DropBox = {}

function DropBox.Init()
	if DropBox_Ativado then
		GameServerFunctions.PlayerDropItem(DropBox.PlayerDrop)
	end
end

function DropBox.PlayerDrop(aIndex, x, y, slot)
	local Box = nil
	local pInv = Inventory.new(aIndex)
	for i in ipairs(DropBox_Config) do
		if pInv:getIndex(slot) == GET_ITEM(DropBox_Config[i].Grupo, DropBox_Config[i].Id) then
			if DropBox_Config[i].Level == -1 or DropBox_Config[i].Level == pInv:getLevel(slot) then
				Box = DropBox_Config[i]
				break
			end
		end
	end

	if Box == nil then
		return 0
	end

	local vip = Utils.GetVip(aIndex)

	if vip < Box.Vip then
		return 1
	end

	local player = User.new(aIndex)

	if player:getInterfaceUse() > 0 or player:getTeleport() ~= 0 or player:getDieRegen() ~= 0 then
		SendMessage(string.format(" Feche outras janelas para dropar "), aIndex, ALERT_COLOR)
		return 1
	end

	local Item = {}
	local ItemId = 0

	::NOVOITEM::

	local Itens = {}
	if Box.Porcentagem then
		for i in ipairs(DropBox_Itens) do
			if DropBox_Itens[i].Index == Box.Index then
				local qtd = (DropBox_Itens[i].Porcentagem / 100) * 10000
				for k = 1, qtd do
					table.insert(Itens, DropBox_Itens[i])
				end
			end
		end
	else
		for i in ipairs(DropBox_Itens) do
			if DropBox_Itens[i].Index == Box.Index then
				table.insert(Itens, DropBox_Itens[i])
			end
		end
	end

	Item = Itens[Utils.GetRandom(1, #Itens, 9)]
	ItemId = GET_ITEM(Item.Grupo, Item.Id)

	if Item.LimiteDeDrop > 0 then
		local Drops = 0

		if Item.Quantidade == 0 then
			Drops = DropBox.GetDropCount(Box.Index, 0)
		else
			Drops = DropBox.GetDropCount(Box.Index, ItemId)
		end

		if Drops >= Item.LimiteDeDrop then
			goto NOVOITEM
		end
	end

	local map = player:getMapNumber()

	if Box.Inventario then
		for p = 12, 75 do
			if p ~= slot then
				if pInv:isItem(p) ~= 0 then
					SendMessage(string.format(" Seu invent�rio precisa estar vazio"), aIndex, ALERT_COLOR)
					return 1
				end
			end
		end

		x = 0
		y = 0
		map = 236
	end

	InventoryDeleteItem(aIndex, slot)
	SendInventoryDeleteItem(aIndex, slot)

	if Item.Quantidade == 0 then
		SendMessage(string.format(" %s: ", Box.Nome), aIndex, INFO_COLOR)
		SendMessage(string.format(" Voc� foi trolado :)"), aIndex, INFO_COLOR)

		if Item.AnunciarGlobal then
			SendMessageGlobal(string.format("-- %s --", Box.Nome), 0)
			SendMessageGlobal(string.format("%s foi trolado", player:getName()), 0)
		end

		if Item.Fogos then
			FireWorks(aIndex, 0, 0, 0)
		end

		DropBox.AddDropCount(1, Box.Index, 0)

		return 1
	end

	for k = 1, Item.Quantidade do
		local Options = DropBox.GetOption(Item)

		ItemSerialCreateComplete(aIndex, map, x, y, ItemId, Options.Level, Options.Dur, Options.Skill, Options.Luck,
			Options.Option, aIndex, Options.Exc, Item.Ancient, Item.Dias)
	end

	if Item.Extras > 0 then
		for i in ipairs(DropBox_Extras) do
			if Item.Extras == DropBox_Extras[i].Index then
				for k = 1, DropBox_Extras[i].Quantidade do
					local Options = DropBox.GetOption(DropBox_Extras[i])

					ItemSerialCreateComplete(aIndex, map, x, y, GET_ITEM(DropBox_Extras[i].Grupo, DropBox_Extras[i].Id),
						Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, aIndex, Options.Exc,
						DropBox_Extras[i].Ancient, DropBox_Extras[i].Dias)
				end
			end
		end
	end

	if Item.AnunciarGlobal then
		SendMessageGlobal(string.format("-- %s --", Box.Nome), 0)
		SendMessageGlobal(string.format("%s dropou:", player:getName()), 0)
		SendMessageGlobal(string.format("%d %s", Item.Quantidade, Item.Nome), 0)
	end

	if Item.Fogos then
		FireWorks(aIndex, 0, 0, 0)
	end

	DropBox.AddDropCount(Item.Quantidade, Box.Index, ItemId)

	return 1
end

function DropBox.GetDropCount(IndexBox, IndexItem)
	db:exec(string.format(
		"IF NOT EXISTS (SELECT Drops FROM DropSystem WHERE IndexBox = %d AND IndexItem = %d) INSERT INTO DropSystem (IndexBox, IndexItem) VALUES (%d, %d)",
		IndexBox, IndexItem, IndexBox, IndexItem))
	db:clear()

	db:exec(string.format("SELECT Drops FROM DropSystem WHERE IndexBox = %d and IndexItem = %d", IndexBox, IndexItem))
	db:fetch()

	local val = db:getInt('Drops')
	db:clear()
	return val
end

function DropBox.AddDropCount(Quantidade, IndexBox, IndexItem)
	db:exec(string.format(
		"IF NOT EXISTS (SELECT Drops FROM DropSystem WHERE IndexBox = %d AND IndexItem = %d) INSERT INTO DropSystem (IndexBox, IndexItem) VALUES (%d, %d)",
		IndexBox, IndexItem, IndexBox, IndexItem))
	db:clear()

	db:exec(string.format("UPDATE DropSystem SET Drops = Drops + %d WHERE IndexBox = %d AND IndexItem = %d", Quantidade,
		IndexBox, IndexItem))
	db:clear()
end

function DropBox.GetOption(Item)
	local level = Utils.GetRandom(Item.LevelMin, Item.LevelMax, math.random(0, 100))
	local skill = Item.Skill
	if skill == -1 then
		skill = Utils.GetRandom(0, 1, math.random(0, 100))
	end
	local luck = Item.Luck
	if luck == -1 then
		luck = Utils.GetRandom(0, 1, math.random(0, 100))
	end
	local dur = Utils.GetRandom(Item.DurMin, Item.DurMax, math.random(0, 100))
	local opt = Utils.GetRandom(Item.OptMin, Item.OptMax, math.random(0, 100))
	local exc = Utils.GetExcelente(Item.ExcMin, Item.ExcMax)

	return { Level = level, Skill = skill, Luck = luck, Dur = dur, Option = opt, Exc = exc }
end

DropBox.Init()

return DropBox

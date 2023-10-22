NovaJoia = {}

function NovaJoia.Init()	
	if NovaJoia_Ativado then
		GameServerFunctions.PlayerUseItem(NovaJoia.PlayerUseItem)
		GameServerFunctions.GameServerProtocol(NovaJoia.Protocol)
	end
end

function NovaJoia.Protocol(aIndex, Packet, PacketName)
	if Packet ~= NovaJoia_Packet then return false end
	local player = User.new(aIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
	local namePacket = string.format("CustomAlertSend-%s", playerInfo[1], aIndex)

    if PacketName == namePacket then
        local sourceSlot = GetBytePacket(namePacket, -1)
        local targetSlot = GetBytePacket(namePacket, -1)

		NovaJoia.CompleteAction(aIndex, sourceSlot, targetSlot)

        ClearPacket(namePacket)
        return true
    end
end

function NovaJoia.PlayerUseItem(aIndex, SourceSlot, TargetSlot)
	local  p = User.new(aIndex)
	local pInv = Inventory.new(aIndex)
	local joia = {item = pInv:getIndex(SourceSlot), level = pInv:getLevel(SourceSlot)}
	
	for i in ipairs(NovaJoia_Config) do
		if joia.item == Utils.GetItem(NovaJoia_Config[i].Grupo , NovaJoia_Config[i].Id) then
			if NovaJoia_Config[i].Level == -1 or joia.level == NovaJoia_Config[i].Level then
				joia = NovaJoia_Config[i]
				break
			end
		end
	end

	if joia.Index == nil then
		return 0
	end

	local packetName = string.format("CustomAlert-%s", p:getName())

    CreatePacket(packetName, NovaJoia_Packet)
    
	SetBytePacket(packetName, SourceSlot)
    SetBytePacket(packetName, TargetSlot)
	
    SendPacket(packetName, aIndex)
	
    ClearPacket(packetName)

	return 0
end

function NovaJoia.CompleteAction(aIndex, SourceSlot, TargetSlot) 
	local  p = User.new(aIndex)
	local pInv = Inventory.new(aIndex)
	local vip = p:getVip()	
	local joia = {item = pInv:getIndex(SourceSlot), level = pInv:getLevel(SourceSlot)}
	local target = {item = pInv:getIndex(TargetSlot), level = pInv:getLevel(TargetSlot), exe = pInv:isExc(TargetSlot)}
	local joia2 = nil
	
	for i in ipairs(NovaJoia_Config) do
		if joia.item == Utils.GetItem(NovaJoia_Config[i].Grupo , NovaJoia_Config[i].Id) then
			if NovaJoia_Config[i].Level == -1 or joia.level == NovaJoia_Config[i].Level then
				joia2 = joia
				joia = NovaJoia_Config[i]
				break
			end
		end
	end
	
	if joia.Index == nil then
		return 0 
	end
		
	if not joia.Vip[vip] then 
		SendMessage(string.format(NovaJoia_MensagemVIp), aIndex, 1)
		InventoryDeleteItem(aIndex, SourceSlot)
		SendInventoryDeleteItem(aIndex, SourceSlot)
		ItemSerialCreate(aIndex, 236, 0, 0, joia2.item, joia2.level, 0, 0, 0, 0, 0)
		return 1 
	end
	
	for i in ipairs(NovaJoia_ItemOriginal) do
		if NovaJoia_ItemOriginal[i].Index == joia.Index then
			if target.item == Utils.GetItem(NovaJoia_ItemOriginal[i].Grupo , NovaJoia_ItemOriginal[i].Id) then
				if NovaJoia_ItemOriginal[i].Level == -1 or joia.level == NovaJoia_ItemOriginal[i].Level then
					if NovaJoia_ItemOriginal[i].Excelente then
						if target.exe == 1 then
							target = NovaJoia_ItemOriginal[i]
							break
						end
					else
						target = NovaJoia_ItemOriginal[i]
						break
					end
				end
			end
		end
	end
	
	if target.Index == nil then
		InventoryDeleteItem(aIndex, SourceSlot)
		SendInventoryDeleteItem(aIndex, SourceSlot)
		ItemSerialCreate(aIndex, 236, 0, 0, joia2.item, joia2.level, 0, 0, 0, 0, 0)
		return 1
	end
	
	if not Utils.GetSuccessByRate(joia.Sucesso[vip]) then
		SendMessage(string.format(NovaJoia_MensagemFalha, joia.Nome), aIndex, 1)
		InventoryDeleteItem(aIndex, SourceSlot)
		SendInventoryDeleteItem(aIndex, SourceSlot)
		
		if not target.CriarItemNexSeFalhar and target.DeletarSeFalhar  then
			InventoryDeleteItem(aIndex, TargetSlot)
			SendInventoryDeleteItem(aIndex, TargetSlot)
			for i = 1, NovaJoia_NovoItemSeDeletar.Quantidade do
				local Options = NovaJoia.GetOption(NovaJoia_NovoItemSeDeletar)
				if NovaJoia_NovoItemSeDeletar.Dias > 0 then
					ItemSerialCreatePeriodic(aIndex, 236, 0, 0, Utils.GetItem(NovaJoia_NovoItemSeDeletar.Grupo, NovaJoia_NovoItemSeDeletar.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc, NovaJoia_NovoItemSeDeletar.Dias)
				else
					ItemSerialCreate(aIndex, 236, 0, 0, Utils.GetItem(NovaJoia_NovoItemSeDeletar.Grupo, NovaJoia_NovoItemSeDeletar.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc)
				end
			end
			
			if NovaJoia_NovoItemSeDeletar.Extras then
				for i in ipairs(NovaJoia_NovoItemSeDeletarExtras) do
					local item = NovaJoia_NovoItemSeDeletarExtras[i]
					
					for i = 1, item.Quantidade do
						local Options = NovaJoia.GetOption(item)
						if item.Dias > 0 then
							ItemSerialCreatePeriodic(aIndex, 236, 0, 0, Utils.GetItem(item.Grupo, item.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc, item.Dias)
						else
							ItemSerialCreate(aIndex, 236, 0, 0, Utils.GetItem(item.Grupo, item.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc)
						end
					end			
				end
			end
		end
		
		if not target.DeletarSeFalhar and target.CriarItemNexSeFalhar then
			InventoryDeleteItem(aIndex, TargetSlot)
			SendInventoryDeleteItem(aIndex, TargetSlot)	
			ItemSerialCreate(aIndex, 236, 0, 0, GET_ITEM(target.Grupo, target.Id), 0, 0, 0, 0, 0, 0)	
		end
				
		return 1
	end
	
	InventoryDeleteItem(aIndex, TargetSlot)
	SendInventoryDeleteItem(aIndex, TargetSlot)
	InventoryDeleteItem(aIndex, SourceSlot)
	SendInventoryDeleteItem(aIndex, SourceSlot)
	
	local Item = nil
	
	for i in ipairs(NovaJoia_ItemNovo) do
		if NovaJoia_ItemNovo[i].Index == target.ItemNovo then
			Item = NovaJoia_ItemNovo[i]
			break
		end
	end
	
	if Item == nil then return 1 end
	
	for i = 1, Item.Quantidade do
		local Options = Utils.GetOption(Item)
		if Item.Dias > 0 then
			ItemSerialCreatePeriodic(aIndex, 236, 0, 0, Utils.GetItem(Item.Grupo, Item.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc, Item.Dias)
		else
			ItemSerialCreate(aIndex, 236, 0, 0, Utils.GetItem(Item.Grupo, Item.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc)
		end
	end
	
	for i in ipairs(NovaJoia_ItemNovoExtra) do
		if NovaJoia_ItemNovoExtra[i].Index == Item.Extras then
			local item = NovaJoia_ItemNovoExtra[i]
			
			for i = 1, item.Quantidade do
				local Options = Utils.GetOption(item)
				if item.Dias > 0 then
					ItemSerialCreatePeriodic(aIndex, 236, 0, 0, Utils.GetItem(item.Grupo, item.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc, item.Dias)
				else
					ItemSerialCreate(aIndex, 236, 0, 0, Utils.GetItem(item.Grupo, item.Id), Options.Level, Options.Dur, Options.Skill, Options.Luck, Options.Option, Options.Exc)
				end
			end			
		end
	end
	
	SendMessage(string.format(NovaJoia_MensagemSucesso, joia.Nome), aIndex, 1)
	
	return 1
end

NovaJoia.Init()

return NovaJoia
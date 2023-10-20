NPCHoras = {}
local Players = {}
local Monster = -1

function NPCHoras.Init()	
	if NPCHoras_Ativado then
		GameServerFunctions.NpcTalk(NPCHoras.NpcTalk)
		GameServerFunctions.EnterCharacter(NPCHoras.PlayerJoin)
		GameServerFunctions.PlayerLogout(NPCHoras.PlayerLeft)
		GameServerFunctions.GameServerProtocol(NPCHoras.GetPacket)
		GameServerFunctions.MonsterReload(NPCHoras.CriarNpc)
		NPCHoras.Load()
		NPCHoras.CriarNpc()
	end
	
end

function NPCHoras.Running(aIndex)

	local player = User.new(aIndex)
	local tipo = ""
	if NPCHoras_Tipo == 0 then
		tipo = player:getAccountID()
	else
		tipo = player:getName()
	end
	
	if not NPCHoras_ContarOffline then
		if player:getInMuHelperOffline() == 1 or player:getInOffAttack() == 1 or player:getInOffStore() == 1 then return end
	end

	if Players[aIndex] ~= nil then
		Players[aIndex].Tempo = Players[aIndex].Tempo + 1
		if Players[aIndex].Tempo % 3600 == 0 then
			DataBase.SetAddValue(NPCHoras_Tabela, NPCHoras_ColunaHora, 1, NPCHoras_Where, tipo)
			Players[aIndex].Tempo = 0
			DataBase.SetValue(NPCHoras_Tabela, NPCHoras_ColunaTemp, 0, NPCHoras_Where, tipo)
		else
			if Players[aIndex].Tempo % 30 == 0 then
				DataBase.SetValue(NPCHoras_Tabela, NPCHoras_ColunaTemp, Players[aIndex].Tempo, NPCHoras_Where, tipo)
			end
		end
	end
end

function NPCHoras.PlayerLeft(aIndex)
	local player = User.new(aIndex)
	local playerInfo = {[0] = player:getAccountID(), [1] = player:getName()}

	if Players[aIndex] ~= nil then
		DataBase.SetValue(NPCHoras_Tabela, NPCHoras_ColunaTemp, Players[aIndex].Tempo, NPCHoras_Where, playerInfo[NPCHoras_Tipo])
		if Players[aIndex].Timer ~= -1 then
			Timer.Cancel(Players[aIndex].Timer)
		end
		Players[aIndex] = nil
	end
end

function NPCHoras.PlayerJoin(aIndex)
	local player = User.new(aIndex)
	local playerInfo = {[0] = player:getAccountID(), [1] = player:getName()}
	
	if Players[aIndex] == nil then
		table.insert(Players, aIndex)
		Players[aIndex] = {Tempo = 0, Timer = -1}
		local lastTime = DataBase.GetValue(NPCHoras_Tabela, NPCHoras_ColunaTemp, NPCHoras_Where, playerInfo[NPCHoras_Tipo])
		Players[aIndex].Tempo = lastTime
	else
		if Players[aIndex].Timer ~= -1 then
			Timer.Cancel(Players[aIndex].Timer)
			Players[aIndex].Timer = -1
		end

		local lastTime = DataBase.GetValue(NPCHoras_Tabela, NPCHoras_ColunaTemp, NPCHoras_Where, playerInfo[NPCHoras_Tipo])
		Players[aIndex].Tempo = lastTime
	end
	
	Players[aIndex].Timer = Timer.Interval(1, NPCHoras.Running, aIndex)
end

function NPCHoras.Load()
	for aIndex = 13000,13999 do
		local player = User.new(aIndex)
		if player:getConnected() == 3 then
			local tipo = ""
			if NPCHoras_Tipo == 0 then
				tipo = player:getAccountID()
			else
				tipo = player:getName()
			end
			table.insert(Players, aIndex)
			Players[aIndex] = {Tempo = 0, Timer = -1}
			local lastTime = DataBase.GetValue(NPCHoras_Tabela, NPCHoras_ColunaTemp, NPCHoras_Where, tipo)
			Players[aIndex].Tempo = lastTime
			Players[aIndex].Timer = Timer.Interval(1, NPCHoras.Running, aIndex)
		end
	end
end

function NPCHoras.CriarNpc()
	for i = 0, 12000 do
		local monster = User.new(i)
		if monster:getConnected() == 3 then
			if monster:getClass() == NPCHoras_Monstro.Classe then
				if monster:getMapNumber() == NPCHoras_Monstro.Mapa then
					if monster:getX() == NPCHoras_Monstro.X and monster:getY() == NPCHoras_Monstro.Y then
						Monster = i
						monster:setType(3)
						return
					end
				end
			end
		end
	end

	Monster = AddMonster(NPCHoras_Monstro.Mapa)
	
	if Monster == -1
	then
		LogAdd(string.format("Erro ao criar o NPC Horas"))
		return
	end
	
	local player = User.new(Monster)
	
	SetMapMonster(Monster, NPCHoras_Monstro.Mapa, NPCHoras_Monstro.X, NPCHoras_Monstro.Y)
	player:setDir(NPCHoras_Monstro.Dir)
	SetMonster(Monster, NPCHoras_Monstro.Classe)
	player:setType(3)
	return
end

function NPCHoras.GiveItem(aIndex, ListID)
	local player = User.new(aIndex)
	local playerInfo = {[0] = player:getAccountID(), [1] = player:getName()}
	if NPCHoras_Itens[ListID] == nil then
		local pname = string.format("4-%s-%d", playerInfo[1], aIndex)
		CreatePacket(pname, NPCHoras_Packet)
		SendPacket(pname, aIndex)	
		ClearPacket(pname)
		return
	end
	
	local Item = NPCHoras_Itens[ListID]
	local saldo = DataBase.GetValue(NPCHoras_Tabela, NPCHoras_ColunaHora, NPCHoras_Where, playerInfo[NPCHoras_Tipo])
	
	if Item.Valor > saldo then
		local pname = string.format("5-%s-%d", playerInfo[1], aIndex)
		CreatePacket(pname, NPCHoras_Packet)
		SendPacket(pname, aIndex)	
		ClearPacket(pname)
		return
	end
		
	if InventoryCheckSpaceByItem(aIndex, GET_ITEM(Item.Grupo, Item.Id)) == 0 then
		local pname = string.format("6-%s-%d", playerInfo[1], aIndex)
		CreatePacket(pname, NPCHoras_Packet)
		SendPacket(pname, aIndex)	
		ClearPacket(pname)
		return
	end
	
	DataBaseAsync.SetDecreaseValue(NPCHoras_Tabela, NPCHoras_ColunaHora, Item.Valor, NPCHoras_Where, playerInfo[NPCHoras_Tipo])

	saldo = saldo - Item.Valor
	
	ItemSerialCreate(aIndex, 236, 0, 0, GET_ITEM(Item.Grupo,Item.Id), Item.Level, Item.Dur, Item.Luck, Item.Skill, Item.Option, Item.Exc)
	
	local pname = string.format("7-%s-%d", playerInfo[1], aIndex)
	CreatePacket(pname, NPCHoras_Packet)
	SetDwordPacket(pname, saldo)
	SendPacket(pname, aIndex)	
	ClearPacket(pname)
	return
end

function NPCHoras.GetPacket(aIndex, Packet, PacketName)
	if Packet == NPCHoras_Packet then	
		local p = User.new(aIndex)
		local name = p:getName()

		if PacketName == string.format("2-%s-%d", name, aIndex) then
			ClearPacket(PacketName)
			p:setInterfaceUse(0)
			return true
		end

		if PacketName == string.format("3-%s-%d", name, aIndex) then
			
			local lid = GetBytePacket(PacketName, -1)
			ClearPacket(PacketName)
			LogAdd(lid)
			NPCHoras.GiveItem(aIndex, lid)
			return true
		end
	end
	return
end

function NPCHoras.NpcTalk(Npc, aIndex)
	if Monster == -1 then return 0 end
	local m = User.new(Npc)

	if Monster == Npc and m:getClass() == NPCHoras_Monstro.Classe then
		
		local player = User.new(aIndex)
		if player:getInterfaceUse() ~= 0 then return 0 end
		local playerInfo = {[0] = player:getAccountID(), [1] = player:getName()}
		local packetname = string.format("1-%s-%d", playerInfo[1], aIndex)
		player:setInterfaceUse(1)
		local saldo = DataBase.GetValue(NPCHoras_Tabela, NPCHoras_ColunaHora, NPCHoras_Where, playerInfo[NPCHoras_Tipo])
		CreatePacket(packetname, NPCHoras_Packet)
		SetDwordPacket(packetname, saldo)
		SendPacket(packetname, aIndex)
		ClearPacket(packetname)
		return 1
	end
	
	return 0
end

NPCHoras.Init()

return NPCHoras
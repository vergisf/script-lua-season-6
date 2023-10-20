GiroDaSorte = {}

function GiroDaSorte.Init()
    if GiroDaSorte_Config.Enabled then
        GameServerFunctions.NpcTalk(GiroDaSorte.NpcTalk)
        GameServerFunctions.MonsterReload(GiroDaSorte.FixNpc)
        GameServerFunctions.GameServerProtocol(GiroDaSorte.Protocol)
        Timer.Interval(60, GiroDaSorte.FixNpc)
    end
end

function GiroDaSorte.IsGiroNpc(monster)
    for i in ipairs(GiroDaSorte_Config.Npc) do
        if monster:getClass() == GiroDaSorte_Config.Npc[i].Class then
            if monster:getMapNumber() == GiroDaSorte_Config.Npc[i].Map and monster:getX() == GiroDaSorte_Config.Npc[i].PosX and monster:getY() == GiroDaSorte_Config.Npc[i].PosY then
                return true
            end
        end
    end

    return false
end

function GiroDaSorte.FixNpc()
    for aIndex = 0, 12000 do
        local monster = User.new(aIndex)
        if monster:getConnected() > 0 then
            for i in ipairs(GiroDaSorte_Config.Npc) do
                if monster:getClass() == GiroDaSorte_Config.Npc[i].Class then
                    monster:setType(3)
                end
            end
        end
        monster = nil
    end
end

function GiroDaSorte.NpcTalk(NpcIndex, PlayerIndex)
    local monster = User.new(NpcIndex)

    if not GiroDaSorte.IsGiroNpc(monster) then return 0 end

    local player = User.new(PlayerIndex)

    local lastclick = player:getCacheInt("GiroLastClick")
    local currentTime = os.time()
    if currentTime-lastclick < 5 then
        ChatTargetSend(NpcIndex, "Aguarde alguns segundos", PlayerIndex)
        return 1
    end

    local giroOpen = player:getCacheInt("GiroOpen")
    if giroOpen == 1 then
        ChatTargetSend(NpcIndex, "Giro da Sorte já está aberto", PlayerIndex)
        return 1
    end

    GiroDaSorte.SendOpen(player)
    return 1
end

function GiroDaSorte.Protocol(aIndex, Packet, PacketName)
    if Packet ~= GiroDaSorte_Config.Packet then return false end

    local player = User.new(aIndex)
    local playerInfo = Utils.GetPlayerInfo(player)

    if PacketName == string.format("2-%d-%s", playerInfo[2], playerInfo[1]) then
        player:setCacheInt("GiroOpen", 0)
        ClearPacket(PacketName)
        return true
    end

    if PacketName == string.format("4-%d-%s", playerInfo[2], playerInfo[1]) then
        local pacoteIndex = GetBytePacket(PacketName, -1)
        ClearPacket(PacketName)
        GiroDaSorte.SendItemList(player, pacoteIndex)
        return true
    end

    if PacketName == string.format("6-%d-%s", playerInfo[2], playerInfo[1]) then
        local pacoteIndex = GetBytePacket(PacketName, -1)
        ClearPacket(PacketName)
        GiroDaSorte.TrySpin(player, pacoteIndex)
        return true
    end
end

function GiroDaSorte.SendOpen(player)
    local playerInfo = Utils.GetPlayerInfo(player)
    local packetName = string.format("1-%d-%s", playerInfo[2], playerInfo[1])

    CreatePacket(packetName, GiroDaSorte_Config.Packet)
    SetBytePacket(packetName, #GiroDaSorte_Config.Pacotes)
    for i in ipairs(GiroDaSorte_Config.Pacotes) do
        SetBytePacket(packetName, GiroDaSorte_Config.Pacotes[i].IndexPacote)       
        local len = GiroDaSorte_Config.Pacotes[i].Nome:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, GiroDaSorte_Config.Pacotes[i].Nome, len)
        len = GiroDaSorte_Config.Pacotes[i].Disponibilidade:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, GiroDaSorte_Config.Pacotes[i].Disponibilidade, len)
        SetBytePacket(packetName, #GiroDaSorte_Config.Custo[GiroDaSorte_Config.Pacotes[i].Custo])
        for m, custo in ipairs(GiroDaSorte_Config.Custo[GiroDaSorte_Config.Pacotes[i].Custo]) do
            SetDwordPacket(packetName, custo.Valor)
            len = GiroDaSorte_Config.Moedas[custo.Moeda].Nome:len()
            SetBytePacket(packetName, len)
            SetCharPacketLength(packetName, GiroDaSorte_Config.Moedas[custo.Moeda].Nome, len)
        end
    end
    SendPacket(packetName, playerInfo[2])
    ClearPacket(packetName)
    player:setCacheInt("GiroOpen", 1)
end

function GiroDaSorte.SendItemList(player, pacoteIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
    local packetName = string.format("3-%d-%s", playerInfo[2], playerInfo[1])
    CreatePacket(packetName, GiroDaSorte_Config.Packet)
    SetBytePacket(packetName, #GiroDaSorte_Config.Itens[pacoteIndex])
    for i in ipairs(GiroDaSorte_Config.Itens[pacoteIndex]) do
        local item = GiroDaSorte_Config.Itens[pacoteIndex][i]
        SetWordPacket(packetName, item.ItemIndex)
        SetBytePacket(packetName, item.Level)
        SetBytePacket(packetName, item.Dur)
        SetBytePacket(packetName, item.Skill)
        SetBytePacket(packetName, item.Luck)
        SetBytePacket(packetName, item.JoL)
        SetBytePacket(packetName, item.Exc)
        SetBytePacket(packetName, item.Days)        
        local len = item.Rate:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, item.Rate, len)
        len = item.PosX:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, item.PosX, len)

        len = item.PosY:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, item.PosY, len)

        len = item.Width:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, item.Width, len)

        len = item.Height:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, item.Height, len)
        len = item.Size:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, item.Size, len)
    end
    SendPacket(packetName, playerInfo[2])
    ClearPacket(packetName)
end

function GiroDaSorte.TrySpin(player, pacoteIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
    local pacote = GiroDaSorte_Config.Pacotes[pacoteIndex]

    for m, custo in ipairs(GiroDaSorte_Config.Custo[pacote.Custo]) do
        local saldo = DataBase.GetValue(GiroDaSorte_Config.Moedas[custo.Moeda].Tabela,GiroDaSorte_Config.Moedas[custo.Moeda].Coluna, GiroDaSorte_Config.Moedas[custo.Moeda].Where, playerInfo[GiroDaSorte_Config.Moedas[custo.Moeda].IdType])
        if saldo < custo.Valor then
            local packetName = string.format("5-%d-%s", playerInfo[2], playerInfo[1])
            CreatePacket(packetName, GiroDaSorte_Config.Packet)
            SendPacket(packetName, playerInfo[2])
            ClearPacket(packetName)
            return
        end
    end
    local pickedID = 0
    if pacote.UseRate then
        pickedID = GiroDaSorte.GetPickedItem(GiroDaSorte_Config.Itens[pacoteIndex])
    else
        pickedID = Utils.GetRandom(1, #GiroDaSorte_Config.Itens[pacoteIndex], math.random(1,10))
    end
	
    local prize = GiroDaSorte_Config.Itens[pacoteIndex][pickedID]
	
	if prize == nil then
		prize = GiroDaSorte_Config.Itens[pacoteIndex][1]
	end

	if prize == nil then
		prize = GiroDaSorte_Config.Itens[1][1]
	end

    if prize.ItemIndex ~= 20000 then
		NpcRescueItem.InsertItem(playerInfo[0], prize.ItemIndex, prize.Level, prize.Skill, prize.Luck, prize.JoL, prize.Exc, 0, 0, 255, 255, 255, 255, 255, 255, 60, prize.Days*86400)
        Timer.TimeOut(3, FireWorks, playerInfo[2], 0, 0, 0)
    end

    for m, custo in ipairs(GiroDaSorte_Config.Custo[pacote.Custo]) do
        DataBase.SetDecreaseValue(GiroDaSorte_Config.Moedas[custo.Moeda].Tabela,GiroDaSorte_Config.Moedas[custo.Moeda].Coluna,  custo.Valor, GiroDaSorte_Config.Moedas[custo.Moeda].Where, playerInfo[GiroDaSorte_Config.Moedas[custo.Moeda].IdType])
    end

    local packetName = string.format("7-%d-%s", playerInfo[2], playerInfo[1])
    CreatePacket(packetName, GiroDaSorte_Config.Packet)
    SetBytePacket(packetName, prize.ListID)
    SendPacket(packetName, playerInfo[2])
    ClearPacket(packetName)

    LogAddC(2, string.format("GiroDaSorte: [%s][%s] Pacote: %s | Item Sorteado: %d", playerInfo[0], playerInfo[1], pacote.Nome, prize.ListID))
end


function GiroDaSorte.GetPickedItem(pool)
	local poolsize = 0
	for k,v in ipairs(pool) do
	   poolsize = poolsize + tonumber(v.Rate)
	end
	local selection = Utils.GetRandom(1,poolsize, math.random(1,10))
	for k,v in ipairs(pool) do
	   selection = selection - tonumber(v.Rate)
	   if (selection <= 0) then
		  return v.ListID
	   end
	end
end

GiroDaSorte.Init()

return GiroDaSorte
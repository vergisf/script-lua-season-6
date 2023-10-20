PacotePromocional = {}

function PacotePromocional.Init()
    if PacotePromocional_Config.Enabled then
        GameServerFunctions.NpcTalk(PacotePromocional.NpcTalk)
        GameServerFunctions.MonsterReload(PacotePromocional.FixNpc)
        GameServerFunctions.GameServerProtocol(PacotePromocional.Protocol)
        Timer.Interval(60, PacotePromocional.FixNpc)
    end
end

function PacotePromocional.IsGiroNpc(monster)
    for i in ipairs(PacotePromocional_Config.Npc) do
        if monster:getClass() == PacotePromocional_Config.Npc[i].Class then
            if monster:getMapNumber() == PacotePromocional_Config.Npc[i].Map and monster:getX() == PacotePromocional_Config.Npc[i].PosX and monster:getY() == PacotePromocional_Config.Npc[i].PosY then
                return true
            end
        end
    end

    return false
end

function PacotePromocional.FixNpc()
    for aIndex = 0, 12000 do
        local monster = User.new(aIndex)
        if monster:getConnected() > 0 then
            for i in ipairs(PacotePromocional_Config.Npc) do
                if monster:getClass() == PacotePromocional_Config.Npc[i].Class then
                    monster:setType(3)
                end
            end
        end
        monster = nil
    end
end

function PacotePromocional.NpcTalk(NpcIndex, PlayerIndex)
    local monster = User.new(NpcIndex)

    if not PacotePromocional.IsGiroNpc(monster) then return 0 end

    local player = User.new(PlayerIndex)

    local lastclick = player:getCacheInt("GiroLastClick")
    local currentTime = os.time()
    if currentTime-lastclick < 5 then
        ChatTargetSend(NpcIndex, "Aguarde alguns segundos", PlayerIndex)
        return 1
    end

    local giroOpen = player:getCacheInt("GiroOpen")
    if giroOpen == 1 then
        ChatTargetSend(NpcIndex, "Giro da Sorte j� est� aberto", PlayerIndex)
        return 1
    end

    PacotePromocional.SendOpen(player)
    return 1
end

function PacotePromocional.Protocol(aIndex, Packet, PacketName)
    if Packet ~= PacotePromocional_Config.Packet then return false end

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
        PacotePromocional.SendItemList(player, pacoteIndex)
        return true
    end

    if PacketName == string.format("6-%d-%s", playerInfo[2], playerInfo[1]) then
        local pacoteIndex = GetBytePacket(PacketName, -1)
        ClearPacket(PacketName)
        PacotePromocional.TrySpin(player, pacoteIndex)
        return true
    end
end

function PacotePromocional.SendOpen(player)
    local playerInfo = Utils.GetPlayerInfo(player)
    local packetName = string.format("1-%d-%s", playerInfo[2], playerInfo[1])

    CreatePacket(packetName, PacotePromocional_Config.Packet)
    SetBytePacket(packetName, #PacotePromocional_Config.Pacotes)
    for i in ipairs(PacotePromocional_Config.Pacotes) do
        SetBytePacket(packetName, PacotePromocional_Config.Pacotes[i].IndexPacote)       
        local len = PacotePromocional_Config.Pacotes[i].Nome:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, PacotePromocional_Config.Pacotes[i].Nome, len)
        len = PacotePromocional_Config.Pacotes[i].Disponibilidade:len()
        SetBytePacket(packetName, len)
        SetCharPacketLength(packetName, PacotePromocional_Config.Pacotes[i].Disponibilidade, len)
        SetBytePacket(packetName, #PacotePromocional_Config.Custo[PacotePromocional_Config.Pacotes[i].Custo])
        for m, custo in ipairs(PacotePromocional_Config.Custo[PacotePromocional_Config.Pacotes[i].Custo]) do
            SetDwordPacket(packetName, custo.Valor)
            len = PacotePromocional_Config.Moedas[custo.Moeda].Nome:len()
            SetBytePacket(packetName, len)
            SetCharPacketLength(packetName, PacotePromocional_Config.Moedas[custo.Moeda].Nome, len)
        end
    end
    SendPacket(packetName, playerInfo[2])
    ClearPacket(packetName)
    player:setCacheInt("GiroOpen", 1)
end

function PacotePromocional.SendItemList(player, pacoteIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
    local packetName = string.format("3-%d-%s", playerInfo[2], playerInfo[1])
    CreatePacket(packetName, PacotePromocional_Config.Packet)
    SetBytePacket(packetName, #PacotePromocional_Config.Itens[pacoteIndex])
    for i in ipairs(PacotePromocional_Config.Itens[pacoteIndex]) do
        local item = PacotePromocional_Config.Itens[pacoteIndex][i]
        SetWordPacket(packetName, item.ItemIndex)
        SetBytePacket(packetName, item.Level)
        SetBytePacket(packetName, item.Dur)
        SetBytePacket(packetName, item.Skill)
        SetBytePacket(packetName, item.Luck)
        SetBytePacket(packetName, item.JoL)
        SetBytePacket(packetName, item.Exc)
        SetBytePacket(packetName, item.Days)
        
        SetBytePacket(packetName, item.Count)

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

function PacotePromocional.TrySpin(player, pacoteIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
    local pacote = PacotePromocional_Config.Pacotes[pacoteIndex]

    for m, custo in ipairs(PacotePromocional_Config.Custo[pacote.Custo]) do
        local saldo = DataBase.GetValue(PacotePromocional_Config.Moedas[custo.Moeda].Tabela,PacotePromocional_Config.Moedas[custo.Moeda].Coluna, PacotePromocional_Config.Moedas[custo.Moeda].Where, playerInfo[PacotePromocional_Config.Moedas[custo.Moeda].IdType])
        if saldo < custo.Valor then
            local packetName = string.format("5-%d-%s", playerInfo[2], playerInfo[1])
            CreatePacket(packetName, PacotePromocional_Config.Packet)
            SendPacket(packetName, playerInfo[2])
            ClearPacket(packetName)
            return
        end
    end

    local prize = PacotePromocional_Config.Itens[pacoteIndex]

	if prize == nil then
		prize = PacotePromocional_Config.Itens[pacoteIndex][1]
	end

	if prize == nil then
		prize = PacotePromocional_Config.Itens[1][1]
	end

	PacotePromocional.CreateItensPlayer(pacote, playerInfo, prize)

    Timer.TimeOut(3, FireWorks, playerInfo[2], 0, 0, 0)

    for m, custo in ipairs(PacotePromocional_Config.Custo[pacote.Custo]) do
        DataBase.SetDecreaseValue(PacotePromocional_Config.Moedas[custo.Moeda].Tabela,PacotePromocional_Config.Moedas[custo.Moeda].Coluna,  custo.Valor, PacotePromocional_Config.Moedas[custo.Moeda].Where, playerInfo[PacotePromocional_Config.Moedas[custo.Moeda].IdType])
    end

    local packetName = string.format("7-%d-%s", playerInfo[2], playerInfo[1])
    CreatePacket(packetName, PacotePromocional_Config.Packet)
    SetBytePacket(packetName, pacoteIndex)
    SendPacket(packetName, playerInfo[2])
    ClearPacket(packetName)

    --LogAddC(2, string.format("GiroDaSorte: [%s][%s] Pacote: %s | Item Sorteado: %d", playerInfo[0], playerInfo[1], pacote.Nome, prize.ListID))
end

function PacotePromocional.CreateItensPlayer(pacote, playerInfo, prize)
    local Codigo = GuardiaoBrindes.GerarCodigo()
	if Codigo == "-1" then
		SendMessage("Erro no sistema, contate o administrador", playerInfo[2], 38)
		return
	end

    GuardiaoBrindes.RegistrarCodigo(pacote.Nome, playerInfo[0], Codigo, pacote.TemValidade, pacote.Dias)

    for index in ipairs(prize) do
        itemShop = prize[index]
        for _ = 1, itemShop.Count do
            PacotePromocional.RegistrarItem(Codigo, itemShop.Nome, itemShop.Section, itemShop.Id, itemShop.Level, 255, itemShop.Skill, itemShop.Luck, itemShop.JoL, itemShop.Exc, itemShop.Days)
        end
    end
end

function PacotePromocional.RegistrarItem(Codigo, Nome, Section, Id, Level, Durabilidade, Skill, Luck, Opt, Excelente, Dias)
	local Query = string.format("INSERT INTO NPCPremio (Nome, Codigo, Section, Id, Level, Durabilidade, Skill, Luck, Opt, Excelente, Dias) VALUES ('%s', '%s', %d, %d, %d, %d, %d, %d, %d, %d, %d)", Nome, Codigo, Section, Id, Level, Durabilidade, Skill, Luck, Opt, Excelente, Dias)
	local ret = db:exec(Query)
	if ret == 0 then
		LogAddC(2,string.format("Query Error: %s", Query))
	end
	db:clear()
end

function PacotePromocional.GetPickedItem(pool)
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

PacotePromocional.Init()

return PacotePromocional
RankingReward = {}

local amountRegisters = nil
local table_ranking = {}

function RankingReward.Init()
    if RankingReward_Config.switch then
        Commands.Register(RankingReward_Config.commandsAdd[1], RankingReward.AddPlayerToRanking, 1)
        Commands.Register(RankingReward_Config.commandsAdd[2], RankingReward.AddPlayerToRanking, 2)
        Commands.Register(RankingReward_Config.commandsAdd[3], RankingReward.AddPlayerToRanking, 3)
        Commands.Register(RankingReward_Config.commandsAdd[4], RankingReward.AddPlayerToRanking, 4)
        Commands.Register(RankingReward_Config.commandsAdd[5], RankingReward.AddPlayerToRanking, 5)
        Commands.Register(RankingReward_Config.commandsAdd[6], RankingReward.AddPlayerToRanking, 6)
        Commands.Register(RankingReward_Config.commandClear, RankingReward.ResetRanking)

        GameServerFunctions.GameServerProtocol(RankingReward.Protocol)
        GameServerFunctions.QueryAsyncProcess(RankingReward.QueryAsyncProcess)

        Timer.TimeOut(5, RankingReward.GetDetailRankings)
    end
end

function RankingReward.GetDetailRankings()
    amountRegisters = RankingRewardUtils.CheckCountRanking()
    if amountRegisters == nil then
        Timer.TimeOut(5, RankingReward.GetDetailRankings)
    end
end

function RankingReward.Protocol(aIndex, Packet, PacketName)
    if RankingReward_Config.Package ~= Packet then return false end

    local player = User.new(aIndex)
    local name = player:getName()

    local pName = string.format("rr-1-%s-%d", name, aIndex)
    local pName2 = string.format("rr-3-%s-%d", name, aIndex)

    if pName == PacketName then
        ClearPacket(pName)

        local query = "SELECT memb___id AS Login, name AS Nome, rankingNumber as Ranking, rankingPosition AS Posicao, withdrawn AS Retirou FROM RankingReward"
        CreateAsyncQuery('RewardRankingPlayers', query, aIndex, 1)

        return true
    elseif pName2 == PacketName then
        --Envia Nome
        local lenName = GetBytePacket(PacketName, -1)
        local name = GetCharPacketLength(PacketName, -1, lenName)
        
        --Envia os detalhes do ranking
        local ranking = GetBytePacket(PacketName, -1) --Número do ranking
        local position = GetBytePacket(PacketName, -1) --Número da pisição
        
        RankingRewardUtils.UpdateBase(name, ranking, position)
        RankingReward.RewardPlayer(aIndex, ranking, position)
        
        ClearPacket(pName2)
        
        local query = "SELECT memb___id AS Login, name AS Nome, rankingNumber as Ranking, rankingPosition AS Posicao, withdrawn AS Retirou FROM RankingReward"
        CreateAsyncQuery('RewardRankingPlayers', query, aIndex, 1)
	    
        return true
    end

    return false
end

function RankingReward.QueryAsyncProcess(queryName, identification, aIndex)
    if queryName == "RewardRankingPlayers" and amountRegisters ~= nil then
        table_ranking = {}

        local player = User.new(aIndex)
        local playerName = player:getName()

        for _ = 1, amountRegisters do
            local login = QueryAsyncGetValue(identification, 'Login')
            local name = QueryAsyncGetValue(identification, 'Nome')
            local ranking = tonumber(QueryAsyncGetValue(identification, 'Ranking'))
            local posicao = tonumber(QueryAsyncGetValue(identification, 'Posicao'))
            local retirou = tonumber(QueryAsyncGetValue(identification, 'Retirou'))

            table.insert(table_ranking, {login = login, name = name, ranking = ranking, posicao = posicao, retirou = retirou})
            
            --LogAddC(2, string.format('Size: %d, login: %s, name: %s, ranking: %d, posicao: %d, retirou: %d', amountRegisters, login, name, ranking, posicao, retirou))
        end
        
        QueryAsyncDelete(identification)

        local pName2 = string.format("rr-2-%s-%d", playerName, aIndex)
        CreatePacket(pName2, RankingReward_Config.Package)
        SetBytePacket(pName2, amountRegisters) --Envia o tamanho do packeg
        for index in ipairs(table_ranking) do
            local player = table_ranking[index]
            
            local lenLogin = player.login:len()
            local lenName = player.name:len()
            --Envia Login
            SetBytePacket(pName2, lenLogin)
            SetCharPacketLength(pName2, player.login, lenLogin)
            
            --Envia Nome
            SetBytePacket(pName2, lenName)
            SetCharPacketLength(pName2, player.name, lenName)
            
            --Envia os detalhes do ranking
            SetBytePacket(pName2, player.ranking) --Número do ranking
            SetBytePacket(pName2, player.posicao) --Número da pisição
            SetBytePacket(pName2, player.retirou) --0 para não retirou e 1 para retirou
            
            --LogAddC(2, string.format('player.login: %s, player.name: %s, player.ranking: %d, player.posicao: %d, player.retirou: %d', player.login, player.name, player.ranking, player.posicao, player.retirou))
        end

        SendPacket(pName2, aIndex)
        ClearPacket(pName2)
    end

    return 1
end

function RankingReward.ResetRanking(aIndex, _)
    local player = User.new(aIndex)

    RankingRewardUtils.ClearRanking()

    SendMessage(string.format('Rankings Reward resetados'), aIndex, 1)
    LogAddC(2, string.format('Rankings Reward resetados por %s', player:getName()))
end

function RankingReward.AddPlayerToRanking(aIndex, params, ranking)
    local player = User.new(aIndex)
    local language = player:getLanguage()

    if RankingReward_Config.OAUTH[player:getName()] == nil then
        return
    end

    local namePlayer = command:getString(params, 1, 0)
    local posRanking = command:getNumber(params, 2)
    local playerReward = RankingRewardUtils.CheckPlayerExist(namePlayer)

    if playerReward == nil then
        SendMessage(string.format('Player %s, informado não existe no ranking %s', namePlayer), aIndex, 1)
        return
    end

    if posRanking > RankingReward_Config.ConfigRanking[ranking].AmountRanking then 
        SendMessage(string.format('O ranking %s só possui %d posições, a posição %d não é válida', RankingReward_Config.TextsRankings[language][ranking], RankingReward_Config.ConfigRanking[ranking].AmountRanking, posRanking), aIndex, 1)
        return
    end

    if not RankingRewardUtils.CheckRankingFilled(posRanking, ranking) then 
        if not RankingRewardUtils.CheckExistRegister(namePlayer, ranking) then
            RankingRewardUtils.RegisterPlayer(namePlayer, posRanking, ranking, playerReward)
    
            SendMessage(string.format('Player inserido no ranking %s, em %d° lugar', RankingReward_Config.TextsRankings[language][ranking], posRanking), aIndex, 1)
            
            LogAddC(2, string.format('Player inserido no ranking %s em %d° lugar, por %s', RankingReward_Config.TextsRankings[language][ranking], posRanking, player:getName()))
    
            return
        else 
            SendMessage(string.format('O player %s, já foi inserido nesse ranking', namePlayer), aIndex, 1)
            
            return
        end
    else 
        SendMessage(string.format('Já existe alguém na posição %d, do ranking %s', posRanking, RankingReward_Config.TextsRankings[language][ranking]), aIndex, 1)
        
        return
    end

end

function RankingReward.RewardPlayer(aIndex, ranking, position)
    local player = User.new(aIndex)
    local language = player:getLanguage()
    local login = player:getAccountID()

    local nameRankign = RankingReward_Config.TextsRankings[language][ranking]
    local itemPosition = RankingReward_Config.ConfigRanking[ranking].Reward[position].item
    local amount = RankingReward_Config.ConfigRanking[ranking].Reward[position].amount

    SendMessage(string.format('Você recebeu %d %s,', amount, itemPosition.nome), aIndex, 29)
    SendMessage(string.format('por ter ficado em %d° no ranking de %s', position, nameRankign), aIndex, 29)

    FireWorks(aIndex, 0, 0, 0)

    for _= 1, amount do 
        NpcRescueItem.InsertItem(login, GET_ITEM(itemPosition.Section, itemPosition.index), 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 255, 255, itemPosition.daysExpire, nil)
    end
end

RankingReward.Init()

return RankingReward
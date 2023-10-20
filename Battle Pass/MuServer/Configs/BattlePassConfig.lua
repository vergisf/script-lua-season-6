--[[ Switcher (Ativa e Desativa o passe) ]]
battlePassSwitch = true

--[[ Comandos ]]
battlePassCommand = '/comprarpasse'
battlePassAddXPCommand = '/passaddxp' --/comando NomePlayer Quantidade
battlePassCommandNPCItens = '/npcrescue' --Comando para o player ir até o NPC pegar os itens

coordinatorNPCPass = { --Local onde seu NPC estiver. Caso tenha vários, coloque somente um aqui, o mais conveniente
    map = 0,
    x = 125,
    y = 125
}

battlePassTableCoin = 'MEMB_INFO'
battlePassColumnCoin = 'cash'
battlePassWhereCoin = 'memb___id'
battlePassNameCoin = 'Cash'
battlePassAmountCoinVip = {}
battlePassAmountCoinVip = {
    [0] = 100,
    [1] = 100,
    [2] = 100
}

--[[ Configuração dos itens free - Cada um é um level, se for premiar o level, configurar, se não só não configurar ]]
battlePass_configItensDetailFree = {}
battlePass_configItensDetailFree[1] = { ItemIndex = GET_ITEM(12, 35), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailFree[2] = { ItemIndex = GET_ITEM(12, 36), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailFree[4] = { ItemIndex = GET_ITEM(12, 37), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailFree[5] = { ItemIndex = GET_ITEM(12, 38), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailFree[7] = { ItemIndex = GET_ITEM(12, 39), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailFree[7] = { ItemIndex = GET_ITEM(12, 40), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailFree[10] = { ItemIndex = GET_ITEM(12, 41), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}

--[[ Configuração dos itens premium - Cada um é um level, se for premiar o level, configurar, se não só não configurar ]]
battlePass_configItensDetailPremium = {}
battlePass_configItensDetailPremium[1] = { ItemIndex = GET_ITEM(12, 35), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[2] = { ItemIndex = GET_ITEM(12, 36), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[3] = { ItemIndex = GET_ITEM(12, 37), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[4] = { ItemIndex = GET_ITEM(12, 38), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[5] = { ItemIndex = GET_ITEM(12, 35), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[6] = { ItemIndex = GET_ITEM(12, 36), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[7] = { ItemIndex = GET_ITEM(12, 37), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[8] = { ItemIndex = GET_ITEM(12, 38), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[9] = { ItemIndex = GET_ITEM(12, 35), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[10] = { ItemIndex = GET_ITEM(12, 36), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[11] = { ItemIndex = GET_ITEM(12, 37), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[12] = { ItemIndex = GET_ITEM(12, 38), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}

--[[ Configuração de XP por level. Esse configura o passe tanto para Free quanto para VIP level é o mesmo. ]]
battlePass_configXPFromLevel = {}
battlePass_configXPFromLevel[1]  = {level = 1,  xpLevelPass = 10000, xpLevelPassString = '10.000'}
battlePass_configXPFromLevel[2]  = {level = 2,  xpLevelPass = 15000, xpLevelPassString = '15.000'}
battlePass_configXPFromLevel[3]  = {level = 3,  xpLevelPass = 20000, xpLevelPassString = '20.000'}
battlePass_configXPFromLevel[4]  = {level = 4,  xpLevelPass = 25000, xpLevelPassString = '25.000'}
battlePass_configXPFromLevel[5]  = {level = 5,  xpLevelPass = 30000, xpLevelPassString = '30.000'}
battlePass_configXPFromLevel[6]  = {level = 6,  xpLevelPass = 35000, xpLevelPassString = '35.000'}
battlePass_configXPFromLevel[7]  = {level = 7,  xpLevelPass = 40000, xpLevelPassString = '40.000'}
battlePass_configXPFromLevel[8]  = {level = 8,  xpLevelPass = 45000, xpLevelPassString = '45.000'}
battlePass_configXPFromLevel[9]  = {level = 9,  xpLevelPass = 50000, xpLevelPassString = '50.000'}
battlePass_configXPFromLevel[10] = {level = 10, xpLevelPass = 55000, xpLevelPassString = '55.000'}
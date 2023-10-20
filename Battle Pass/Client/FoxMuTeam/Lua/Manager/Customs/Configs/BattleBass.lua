battlePass_configItensPremium = {}
battlePass_configItensFree = {}

battlePassCommandNPCItens = '/npcrescue'

--[[Configuração dos itens premium]]
battlePass_configItensPremium[1] = {
    [1] = {premiar = true, vx = 127, vy = 200, vxdesc = 127, vydesc = 200, indexConfigItem = 1, showDescription = true, levelPass = 1, configXY = 1},
    [2] = {premiar = true, vx = 229, vy = 200, vxdesc = 229, vydesc = 200, indexConfigItem = 2, showDescription = true, levelPass = 2, configXY = 2},
    [3] = {premiar = true, vx = 331, vy = 200, vxdesc = 331, vydesc = 200, indexConfigItem = 3, showDescription = true, levelPass = 3, configXY = 3},
    [4] = {premiar = true, vx = 433, vy = 200, vxdesc = 433, vydesc = 200, indexConfigItem = 4, showDescription = true, levelPass = 4, configXY = 4},
}

battlePass_configItensPremium[2] = {
    [1] = {premiar = true, vx = 127, vy = 200, vxdesc = 127, vydesc = 200, indexConfigItem = 5, showDescription = true, levelPass = 5, configXY = 1},
    [2] = {premiar = true, vx = 229, vy = 200, vxdesc = 229, vydesc = 200, indexConfigItem = 6, showDescription = true, levelPass = 6, configXY = 2},
    [3] = {premiar = true, vx = 331, vy = 200, vxdesc = 331, vydesc = 200, indexConfigItem = 7, showDescription = true, levelPass = 7, configXY = 3},
    [4] = {premiar = true, vx = 433, vy = 200, vxdesc = 433, vydesc = 200, indexConfigItem = 8, showDescription = true, levelPass = 8, configXY = 4},
}

battlePass_configItensPremium[3] = {
    [1] = {premiar = true, vx = 127, vy = 200, vxdesc = 127, vydesc = 200, indexConfigItem = 9, showDescription = true, levelPass = 7,  configXY = 1},
    [2] = {premiar = true, vx = 229, vy = 200, vxdesc = 229, vydesc = 200, indexConfigItem = 10, showDescription = true, levelPass = 8,  configXY = 2},
    [3] = {premiar = true, vx = 331, vy = 200, vxdesc = 331, vydesc = 200, indexConfigItem = 11, showDescription = true, levelPass = 9,  configXY = 3},
    [4] = {premiar = true, vx = 433, vy = 200, vxdesc = 433, vydesc = 200, indexConfigItem = 12, showDescription = true, levelPass = 10, configXY = 4},
}

--[[Configuração dos itens free]]
battlePass_configItensFree[1] = {
    [1] = {premiar = true,  vx = 127, vy = 301, vxdesc = 127, vydesc = 301,  indexConfigItem = 1, showDescription = true, levelPass = 1, configXY = 5},
    [2] = {premiar = true,  vx = 229, vy = 301, vxdesc = 229, vydesc = 301,  indexConfigItem = 2, showDescription = true, levelPass = 2, configXY = 6},
    [3] = {premiar = false, vx = 331, vy = 301, vxdesc = 331, vydesc = 301, indexConfigItem = 3, showDescription = true, levelPass = 3, configXY = 7},
    [4] = {premiar = true,  vx = 433, vy = 301, vxdesc = 433, vydesc = 301,  indexConfigItem = 4, showDescription = true, levelPass = 4, configXY = 8},
}

battlePass_configItensFree[2] = {
    [1] = {premiar = true,  vx = 127, vy = 301, vxdesc = 127, vydesc = 301,  indexConfigItem = 5, showDescription = true, levelPass = 5, configXY = 5},
    [2] = {premiar = false, vx = 229, vy = 301, vxdesc = 229, vydesc = 301, indexConfigItem = 6, showDescription = true, levelPass = 6, configXY = 6},
    [3] = {premiar = true,  vx = 331, vy = 301, vxdesc = 331, vydesc = 301,  indexConfigItem = 7, showDescription = true, levelPass = 7, configXY = 7},
    [4] = {premiar = false, vx = 433, vy = 301, vxdesc = 433, vydesc = 301, indexConfigItem = 8, showDescription = true, levelPass = 8, configXY = 8},
}

battlePass_configItensFree[3] = {
    [1] = {premiar = true,  vx = 127, vy = 301, vxdesc = 127, vydesc = 301,  indexConfigItem = 9, showDescription = true, levelPass =  9,  configXY = 5},
    [2] = {premiar = false, vx = 229, vy = 301, vxdesc = 229, vydesc = 301, indexConfigItem = 10, showDescription = true, levelPass = 10, configXY = 6},
    [3] = {premiar = true,  vx = 331, vy = 301, vxdesc = 331, vydesc = 301,  indexConfigItem = 11, showDescription = true, levelPass = 11, configXY = 7},
    [4] = {premiar = false, vx = 433, vy = 301, vxdesc = 433, vydesc = 301, indexConfigItem = 12, showDescription = true, levelPass = 12, configXY = 8},
}

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
battlePass_configItensDetailPremium[1] = { ItemIndex = GET_ITEM(12, 35), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 4, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[2] = { ItemIndex = GET_ITEM(12, 36), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 8, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[3] = { ItemIndex = GET_ITEM(12, 37), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 12, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[4] = { ItemIndex = GET_ITEM(12, 38), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 16, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[5] = { ItemIndex = GET_ITEM(12, 35), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 20, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[6] = { ItemIndex = GET_ITEM(12, 36), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 24, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[7] = { ItemIndex = GET_ITEM(12, 37), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 28, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[8] = { ItemIndex = GET_ITEM(12, 38), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[9] = { ItemIndex = GET_ITEM(12, 35), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[10] = { ItemIndex = GET_ITEM(12, 36), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[11] = { ItemIndex = GET_ITEM(12, 37), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}
battlePass_configItensDetailPremium[12] = { ItemIndex = GET_ITEM(12, 38), Level = 15, Op1 = 1, Op2 = 1, Life = 7, Exc = 63, Ancient = 0, JoH = 0, SocketBonus = 255, Sock1 = 255, Sock2 = 255, Sock3 = 255, Sock4 = 255, Sock5 = 255, ItemTime = nil, DaysExpire = 30, Name = 'Brass Helm +15', Count = 1}

--[[Configuração de XP por level]]
battlePass_configXPFromLevel = {}
battlePass_configXPFromLevel[1] =  {xpLevelPass = 10000, xpLevelPassString = '10.000'}
battlePass_configXPFromLevel[2] =  {xpLevelPass = 15000, xpLevelPassString = '15.000'}
battlePass_configXPFromLevel[3] =  {xpLevelPass = 20000, xpLevelPassString = '20.000'}
battlePass_configXPFromLevel[4] =  {xpLevelPass = 25000, xpLevelPassString = '25.000'}
battlePass_configXPFromLevel[5] =  {xpLevelPass = 30000, xpLevelPassString = '30.000'}
battlePass_configXPFromLevel[6] =  {xpLevelPass = 35000, xpLevelPassString = '35.000'}
battlePass_configXPFromLevel[7] =  {xpLevelPass = 40000, xpLevelPassString = '40.000'}
battlePass_configXPFromLevel[8] =  {xpLevelPass = 45000, xpLevelPassString = '45.000'}
battlePass_configXPFromLevel[9] =  {xpLevelPass = 50000, xpLevelPassString = '50.000'}
battlePass_configXPFromLevel[10] = {xpLevelPass = 55000, xpLevelPassString = '55.000'}

configXY_Text_Level = {}
configXY_Text_Level[1] = {x = 130, y = 190, size = 85}
configXY_Text_Level[2] = {x = 230, y = 190, size = 85}
configXY_Text_Level[3] = {x = 335, y = 190, size = 85}
configXY_Text_Level[4] = {x = 435, y = 190, size = 85}

configXY_Text_Level[5] = {x = 130, y = 290, size = 85}
configXY_Text_Level[6] = {x = 230, y = 290, size = 85}
configXY_Text_Level[7] = {x = 335, y = 290, size = 85}
configXY_Text_Level[8] = {x = 435, y = 290, size = 85}
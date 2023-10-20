RewardRanking = {}

local imagesCode = {
    background = -1,
    btn_reward = -1,
    btn_view_reward = -1,
}

local buttons_table = {}
local buttons_ids = {
    ranking1 = 1,
    ranking2 = 2,
    ranking3 = 3,
    ranking4 = 4,
    ranking5 = 5,
    ranking6 = 6,
    reward_btn = 7
}

local configs_local = {
    isCliked = false,
    enableButtons = false,
    indexClicked = -1,
    configsRewards = {
        clickRanking = -1,
        position = -1
    }
}

local info_player1 = {}
local info_player2 = {}
local info_player3 = {}
local info_player4 = {}
local info_player5 = {}
local info_player6 = {}

function RewardRanking.Init()
    if RewardRanking_Config.Enable then
        InterfaceController.MainProc(RewardRanking.Interface)
        InterfaceController.LoadImages(RewardRanking.LoadImages)
        InterfaceController.MainProcWorldKey(RewardRanking.CheckKeyPressed)
        InterfaceController.InterfaceClickEvent(RewardRanking.InterfaceClickEvent)
        InterfaceController.UpdateMouse(RewardRanking.UpdateMouse)
        InterfaceController.ClientProtocol(RewardRanking.ClientProtocol)
    end
end

function RewardRanking.LoadImages()
    imagesCode.background = LoadImageByDir(RewardRanking_Config.ImagesPath.background)
	imagesCode.btn_reward = LoadImageByDir(RewardRanking_Config.ImagesPath.btn_reward)
	imagesCode.btn_view_reward = LoadImageByDir(RewardRanking_Config.ImagesPath.btn_view_reward)
end

function RewardRanking.CheckKeyPressed(key)
	if CheckRepeatKey(Keys.ControlKey) ~= 0 then
        if Keys.R == key and UICustomInterface ~= RewardRanking_Config.Window then
            RewardRanking.Open()
            RewardRanking.RequestData()
        elseif Keys.R == key and UICustomInterface == RewardRanking_Config.Window then
            RewardRanking.Close()
        end
    end
end

function RewardRanking.UpdateMouse()
	if RewardRanking.CheckOpen() then
		DisableClickClient()
	end
end

function RewardRanking.Interface()

    if UICustomInterface == RewardRanking_Config.Window then
        SetLockInterfaces()
        EnableAlphaTest()

        RewardRanking.CreateBackground()
        RewardRanking.CreateTextsBackground()
        RewardRanking.CreateRewardViews()

        if configs_local.isCliked then
            RewardRanking.CreateWindowReawrds(configs_local.indexClicked)
        end

        DisableAlphaBlend()
    end
end

function RewardRanking.InterfaceClickEvent()
    DisableClickClient()

    if RewardRanking.CheckButton(buttons_ids.ranking1, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then
        configs_local.isCliked = true
        configs_local.indexClicked = buttons_ids.ranking1
    end

    if RewardRanking.CheckButton(buttons_ids.ranking2, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then
        configs_local.isCliked = true
        configs_local.indexClicked = buttons_ids.ranking2
    end

    if RewardRanking.CheckButton(buttons_ids.ranking3, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then
        configs_local.isCliked = true
        configs_local.indexClicked = buttons_ids.ranking3
    end

    if RewardRanking.CheckButton(buttons_ids.ranking4, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then
        configs_local.isCliked = true
        configs_local.indexClicked = buttons_ids.ranking4
    end

    if RewardRanking.CheckButton(buttons_ids.ranking5, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then
        configs_local.isCliked = true
        configs_local.indexClicked = buttons_ids.ranking5
    end

    if RewardRanking.CheckButton(buttons_ids.ranking6, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then
        configs_local.isCliked = true
        configs_local.indexClicked = buttons_ids.ranking6
    end

    if configs_local.configsRewards.clickRanking > 0 and configs_local.configsRewards.position > 0 then
        if RewardRanking.CheckButton(buttons_ids.reward_btn, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then
            local detail =  RewardRanking.CheckInfosPlayer(configs_local.configsRewards.clickRanking)
            if detail ~= nil then
                RewardRanking.RescueItem(detail.Ranking, detail.Posicao, detail.Name)
            end
        end
    end
end

--[[
    #MARK: Private Functions
]]--
function RewardRanking.CheckOpen()
    if UICustomInterface == RewardRanking_Config.Window then
        return true
    end

    return false
end

function RewardRanking.Open()
    if UICustomInterface ~= RewardRanking_Config.Window then
        UICustomInterface = RewardRanking_Config.Window
        SetLockInterfaces()
    end
end

function RewardRanking.Close()
    if UICustomInterface == RewardRanking_Config.Window then
        configs_local.isCliked = false
        configs_local.indexClicked = -1
        UICustomInterface = 0
        SetLockInterfaces()
    end
end

function RewardRanking.MakeDrawWindow(x, y, r, g, b, a, width, heigth)
	EnableAlphaTest()

	SetBlend()
	glColor4f(r, g, b, a)

	DrawBar(x, y, width, heigth)

	EndDrawBar()
	GLSwitchBlend()

	glColor3f(1.0, 1.0, 1.0)

	GLSwitch()
	glColor3f(1.0, 1.0, 1.0)

	DisableAlphaBlend()
end

function RewardRanking.CreateButton(IdBotao, X, Y, W, H, tableParam)
	if tableParam[IdBotao] == nil then
		table.insert(tableParam, IdBotao)
	end
	tableParam[IdBotao] = {X1 = X, X2 = X+W, Y1 = Y, Y2 = Y+H}
end

function RewardRanking.CheckButton(IdBotao, X, Y, tableParam)
	if tableParam[IdBotao] == nil then return false end
	if X >= tableParam[IdBotao].X1 and X <= tableParam[IdBotao].X2 and Y >= tableParam[IdBotao].Y1 and Y <= tableParam[IdBotao].Y2 then
		return true
	end
	return false
end

function RewardRanking.CreateBackground()
    RenderImage2(imagesCode.background, 88, 22, 468, 402, -0.014000, -0.00200, 0.891000, 0.875000, 1, 1, 1)
end

function RewardRanking.CreateTextsBackground()
    SetFontType(2)
    SetTextBg(0, 0, 0, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(224, 36, string.format(RewardRanking_Config.Texts[GetLanguage()][0]), 200, ALIGN_CENTER)
    
    SetFontType(1)
    SetTextColor(255, 187, 0, 255)
    RenderText2(171, 385, string.format(RewardRanking_Config.Texts[GetLanguage()][1], RewardRanking_Config.NameNPC, RewardRanking_Config.LocalReward), 300, ALIGN_CENTER)
end

function RewardRanking.CreateRewardViews()
    RewardRanking.MakeDrawWindow(121, 079, 168, 168, 168, 0.4, 145, 40)
    RewardRanking.MakeDrawWindow(121, 130, 168, 168, 168, 0.4, 145, 40)
    RewardRanking.MakeDrawWindow(121, 181, 168, 168, 168, 0.4, 145, 40)
    RewardRanking.MakeDrawWindow(121, 232, 168, 168, 168, 0.4, 145, 40)
    RewardRanking.MakeDrawWindow(121, 283, 168, 168, 168, 0.4, 145, 40)
    RewardRanking.MakeDrawWindow(121, 334, 168, 168, 168, 0.4, 145, 40)

    RewardRanking.CreateButtonsReward()
    RewardRanking.CreateTextsButtonsReward()
end

function RewardRanking.CreateTextsButtonsReward()
    --Ranking Reset
    local language = GetLanguage()
    
    SetFontType(2)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(123, 88, string.format(RewardRanking_Config.Texts[language][2], RewardRanking_Config.TextsRankings[language][1]), 140, ALIGN_LEFT)
    
    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 187, 0, 255)
    RenderText2(123, 103, string.format(RewardRanking_Config.Texts[language][3], RewardRanking_Config.ConfigRanking[1].AmountRanking), 140, ALIGN_LEFT)

    --Ranking MReset
    SetFontType(2)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(123, 139, string.format(RewardRanking_Config.Texts[language][2], RewardRanking_Config.TextsRankings[language][2]), 140, ALIGN_LEFT)
    
    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 187, 0, 255)
    RenderText2(123, 154, string.format(RewardRanking_Config.Texts[language][3], RewardRanking_Config.ConfigRanking[2].AmountRanking), 140, ALIGN_LEFT)

    --Ranking Mata-Mata
    SetFontType(2)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(123, 190, string.format(RewardRanking_Config.Texts[language][2], RewardRanking_Config.TextsRankings[language][3]), 140, ALIGN_LEFT)
    
    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 187, 0, 255)
    RenderText2(123, 205, string.format(RewardRanking_Config.Texts[language][3], RewardRanking_Config.ConfigRanking[3].AmountRanking), 140, ALIGN_LEFT)

    --Ranking Trade Wins
    SetFontType(2)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(123, 241, string.format(RewardRanking_Config.Texts[language][2], RewardRanking_Config.TextsRankings[language][4]), 140, ALIGN_LEFT)
    
    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 187, 0, 255)
    RenderText2(123, 256, string.format(RewardRanking_Config.Texts[language][3], RewardRanking_Config.ConfigRanking[4].AmountRanking), 140, ALIGN_LEFT)

    --Ranking Blood Castle
    SetFontType(2)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(123, 292, string.format(RewardRanking_Config.Texts[language][2], RewardRanking_Config.TextsRankings[language][5]), 140, ALIGN_LEFT)
    
    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 187, 0, 255)
    RenderText2(123, 307, string.format(RewardRanking_Config.Texts[language][3], RewardRanking_Config.ConfigRanking[5].AmountRanking), 140, ALIGN_LEFT)

    --Ranking Blood Castle
    SetFontType(2)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(123, 343, string.format(RewardRanking_Config.Texts[language][2], RewardRanking_Config.TextsRankings[language][6]), 140, ALIGN_LEFT)
    
    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 187, 0, 255)
    RenderText2(123, 358, string.format(RewardRanking_Config.Texts[language][3], RewardRanking_Config.ConfigRanking[6].AmountRanking), 140, ALIGN_LEFT)
end

function RewardRanking.CreateButtonsReward()
    EnableAlphaTest()

    RewardRanking.CreateButton(buttons_ids.ranking1, 273, 88, 20, 20, buttons_table)
    if RewardRanking.CheckButton(buttons_ids.ranking1, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then 
        RenderImage2(imagesCode.btn_view_reward, 273, 88, 20, 20, 0.002000, 0.174000, 0.604000, 0.177000, 1, 1, 1)
    else 
        RenderImage2(imagesCode.btn_view_reward, 273, 88, 20, 20, 0.002000, 0.002000, 0.604000, 0.177000, 1, 1, 1)
    end
    
    RewardRanking.CreateButton(buttons_ids.ranking2, 273, 140, 20, 20, buttons_table)
    if RewardRanking.CheckButton(buttons_ids.ranking2, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then 
        RenderImage2(imagesCode.btn_view_reward, 273, 140, 20, 20, 0.002000, 0.174000, 0.604000, 0.177000, 1, 1, 1)
    else 
        RenderImage2(imagesCode.btn_view_reward, 273, 140, 20, 20, 0.002000, 0.002000, 0.604000, 0.177000, 1, 1, 1)
    end

    RewardRanking.CreateButton(buttons_ids.ranking3, 273, 192, 20, 20, buttons_table)
    if RewardRanking.CheckButton(buttons_ids.ranking3, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then 
        RenderImage2(imagesCode.btn_view_reward, 273, 192, 20, 20, 0.002000, 0.174000, 0.604000, 0.177000, 1, 1, 1)
    else 
        RenderImage2(imagesCode.btn_view_reward, 273, 192, 20, 20, 0.002000, 0.002000, 0.604000, 0.177000, 1, 1, 1)
    end

    RewardRanking.CreateButton(buttons_ids.ranking4, 273, 242, 20, 20, buttons_table)
    if RewardRanking.CheckButton(buttons_ids.ranking4, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then 
        RenderImage2(imagesCode.btn_view_reward, 273, 242, 20, 20, 0.002000, 0.174000, 0.604000, 0.177000, 1, 1, 1)
    else 
        RenderImage2(imagesCode.btn_view_reward, 273, 242, 20, 20, 0.002000, 0.002000, 0.604000, 0.177000, 1, 1, 1)
    end

    RewardRanking.CreateButton(buttons_ids.ranking5, 273, 294, 20, 20, buttons_table)
    if RewardRanking.CheckButton(buttons_ids.ranking5, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then 
        RenderImage2(imagesCode.btn_view_reward, 273, 294, 20, 20, 0.002000, 0.174000, 0.604000, 0.177000, 1, 1, 1)
    else 
        RenderImage2(imagesCode.btn_view_reward, 273, 294, 20, 20, 0.002000, 0.002000, 0.604000, 0.177000, 1, 1, 1)
    end

    RewardRanking.CreateButton(buttons_ids.ranking6, 273, 344, 20, 20, buttons_table)
    if RewardRanking.CheckButton(buttons_ids.ranking6, MousePosX(), MousePosY(), buttons_table) and configs_local.enableButtons then 
        RenderImage2(imagesCode.btn_view_reward, 273, 344, 20, 20, 0.002000, 0.174000, 0.604000, 0.177000, 1, 1, 1)
    else 
        RenderImage2(imagesCode.btn_view_reward, 273, 344, 20, 20, 0.002000, 0.002000, 0.604000, 0.177000, 1, 1, 1)
    end

    DisableAlphaBlend()
end

function RewardRanking.CreateWindowReawrds(index)
    configsRewards = RewardRanking_Config.ConfigRanking[index]
    local language = GetLanguage()

    SetFontType(1)
    SetTextBg(0, 0, 0, 255)
    SetTextColor(255, 187, 0, 255)
    RenderText2(340, 77, string.format(RewardRanking_Config.Texts[language][06], RewardRanking_Config.DateRecoveryReward), 189, ALIGN_CENTER)
    RenderText2(340, 84, string.format(RewardRanking_Config.Texts[language][07]), 189, ALIGN_CENTER)
    
    SetFontType(2)
    SetTextBg(255, 255, 255, 0)
    RenderText2(340, 100, string.format(RewardRanking_Config.Texts[language][08], RewardRanking_Config.TextsRankings[language][index]), 189, ALIGN_CENTER)
    
    SetFontType(1)

    local initYText = 125
    local initYPText = 135
    local initYP2Text = 145
    local initYP3Text = 155
    
    local detailRanking = RewardRanking.GetListDetail(index)
    for position = 1, configsRewards.AmountRanking do
        configs_local.configsRewards.clickRanking = -1
        configs_local.configsRewards.position = -1

        if UserGetName() == detailRanking[position].Name then SetTextColor(26, 255, 0, 255) else SetTextColor(255, 187, 0, 255) end
        RenderText2(345, initYText, string.format(RewardRanking_Config.Texts[language][09], position, detailRanking[position].Name), 189, ALIGN_LEFT)
        RenderText2(345, initYPText, string.format(RewardRanking_Config.Texts[language][10], configsRewards.Reward[position].item.nome), 189, ALIGN_LEFT)
        RenderText2(345, initYP2Text, string.format(RewardRanking_Config.Texts[language][11], configsRewards.Reward[position].amount), 189, ALIGN_LEFT)
        
        if UserGetName() == detailRanking[position].Name and detailRanking[position].Retirou == 0 then
            SetTextColor(0, 255, 221, 255)
            RenderText2(345, initYP3Text, string.format(RewardRanking_Config.Texts[language][04]), 189, ALIGN_LEFT)
        elseif UserGetName() == detailRanking[position].Name and detailRanking[position].Retirou == 1 then
            SetTextColor(255, 72, 0, 255)
            RenderText2(345, initYP3Text, string.format(RewardRanking_Config.Texts[language][12]), 189, ALIGN_LEFT)
        end 
        
        initYText = initYText + 47
        initYPText = initYPText + 47
        initYP2Text = initYP2Text + 47
        initYP3Text = initYP3Text + 47
    end

    local detail = RewardRanking.CheckInfosPlayer(index)
    if detail ~= nil then 
        if detail.Retirou == 0 then
            configs_local.configsRewards.clickRanking = index
            configs_local.configsRewards.position = detail.Posicao
            RewardRanking.CreateButton(buttons_ids.reward_btn, 390, 346, 88, 30, buttons_table)
            if RewardRanking.CheckButton(buttons_ids.reward_btn, MousePosX(), MousePosY(), buttons_table) then
                RenderImage2(imagesCode.btn_reward, 390, 346, 88, 30, -0.001000, -0.298000, 0.833000, 0.227000, 1, 1, 1) -- Botão habilitado/hover
            else 
                RenderImage2(imagesCode.btn_reward, 390, 346, 88, 30, -0.001000, -0.768000, 0.833000, 0.227000, 1, 1, 1) -- Botão habilitado
            end
        end
    end
end

function RewardRanking.RequestData()
    local name = UserGetName()
    local index = UserGetIndex()
    local PacketName = string.format("rr-1-%s-%d", name, index)

    CreatePacket(PacketName, RewardRanking_Config.Package)
	SendPacket(PacketName)
	ClearPacket(PacketName)
end

function RewardRanking.ClientProtocol(packet, packetName)
    local PacketName = string.format("rr-2-%s-%d", UserGetName(), UserGetIndex())
    
    if packet == RewardRanking_Config.Package then
        if packetName == PacketName then
            RewardRanking.ResetTables()

            local size = GetBytePacket(packetName, -1) --Tamanho do for
            for _ = 1, size do
                --Envia Login
                local lenLogin = GetBytePacket(packetName, -1)
                local login = GetCharPacketLength(packetName, -1, lenLogin)
    
                --Envia Nome
                local lenName = GetBytePacket(packetName, -1)
                local name = GetCharPacketLength(packetName, -1, lenName)

                --Envia os detalhes do ranking
                local ranking = GetBytePacket(packetName, -1) --Número do ranking
                local posicao = GetBytePacket(packetName, -1) --Número da posição
                local retirou = GetBytePacket(packetName, -1) --0 para não retirou e 1 para retirou
                
                RewardRanking.InsertDetails(login, name, ranking, posicao, retirou)
            end

            ClearPacket(packetName)
            configs_local.enableButtons = true
        end
    end
end

function RewardRanking.RescueItem(ranking, position, nameUser)
    local name = UserGetName()
    local index =  UserGetIndex()
    local PacketName = string.format("rr-3-%s-%d", name, index)
    
    CreatePacket(PacketName, RewardRanking_Config.Package)

    --Envia Nome
    local lenName = string.len(nameUser)
    SetBytePacket(PacketName, lenName)
    SetCharPacketLength(PacketName, nameUser, lenName)

    --Envia os detalhes do ranking
    SetBytePacket(PacketName, ranking) --Número do ranking
    SetBytePacket(PacketName, position) --Número da pisição
    
	SendPacket(PacketName)
	ClearPacket(PacketName)

    RewardRanking.Close()
end

function RewardRanking.InsertDetails(login, name, ranking, posicao, retirou)
    if ranking == 1 then 
        table.insert(info_player1, posicao)
        info_player1[posicao] = {Login = login, Name = name, Ranking = ranking, Posicao = posicao, Retirou = retirou}
    elseif ranking == 2 then
        table.insert(info_player2, posicao)
        info_player2[posicao] = {Login = login, Name = name, Ranking = ranking, Posicao = posicao, Retirou = retirou}
    elseif ranking == 3 then
        table.insert(info_player3, posicao)
        info_player3[posicao] = {Login = login, Name = name, Ranking = ranking, Posicao = posicao, Retirou = retirou}
    elseif ranking == 4 then
        table.insert(info_player4, posicao)
        info_player4[posicao] = {Login = login, Name = name, Ranking = ranking, Posicao = posicao, Retirou = retirou}
    elseif ranking == 5 then
        table.insert(info_player5, posicao)
        info_player5[posicao] = {Login = login, Name = name, Ranking = ranking, Posicao = posicao, Retirou = retirou}
    elseif ranking == 6 then
        table.insert(info_player6, posicao)
        info_player6[posicao] = {Login = login, Name = name, Ranking = ranking, Posicao = posicao, Retirou = retirou}
    end
end

function RewardRanking.GetListDetail(ranking)
    if ranking == 1 then 
        return info_player1
    elseif ranking == 2 then
        return info_player2
    elseif ranking == 3 then
        return info_player3
    elseif ranking == 4 then
        return info_player4
    elseif ranking == 5 then
        return info_player5
    elseif ranking == 6 then
        return info_player6
    end
end

function RewardRanking.CheckInfosPlayer(ranking)
    local list = RewardRanking.GetListDetail(ranking)
    for index in ipairs(list) do
        if index < #list then 
            local info = list[index]
            if info.Name == UserGetName() then
                return info
            end
        end
    end

    return nil
end

function RewardRanking.ResetTables()
    info_player1 = {}
    info_player2 = {}
    info_player3 = {}
    info_player4 = {}
    info_player5 = {}
    info_player6 = {}
end

RewardRanking.Init()

return RewardRanking
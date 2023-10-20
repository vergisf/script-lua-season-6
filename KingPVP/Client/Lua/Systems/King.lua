KingPVP = {}

local kingConfigCodeImages = {
    background = -1,
    closeButton = -1,
    closeButtonHover = -1,
    bgKingPvp = -1,
    imageKing = -1
}

local kingPVPWindowID = 100

local buttonTables = {}
local buttonsId = {
    closeButton = 0
}

local infosKingPVP = {
    nome = "",
    level = -1,
    agilidade = -1,
    energia = -1,
    vida = -1,
    forca = -1,
    comando = -1,
    masterReset = -1,
    reset = -1,
    nomeGuild = -1
}

local packetNameKing = "KING_PVP_%s"
local packetNumber = 0x34

function KingPVP.Init()
    if kingSwitch then
        InterfaceController.ClientProtocol(KingPVP.ClientProtocol)
        InterfaceController.InterfaceClickEvent(KingPVP.InterfaceClickEvent)
        InterfaceController.LoadImages(KingPVP.LoadImages)
        InterfaceController.MainProc(KingPVP.MakeInterface)
        InterfaceController.UpdateKey(KingPVP.UpdateKey)
	end
end

function KingPVP.MakeInterface()
    if UICustomInterface == kingPVPWindowID then
        SetLockInterfaces()
        EnableAlphaTest()

        KingPVP.CreateBackground()
        KingPVP.CreateCloseButton()
        KingPVP.CreateHeader()
        KingPVP.CreateDetailPlayer()

        DisableAlphaBlend()
    end
end

function KingPVP.ClientProtocol(packet, packetName)
    if packet == packetNumber then
        local name = UserGetName()
        local pName = string.format(packetNameKing, name)

        if packetName == pName then
            local sizeName = GetBytePacket(packetName, -1)
            infosKingPVP.nome = GetCharPacketLength(packetName, -1, sizeName)
            infosKingPVP.level = GetDwordPacket(packetName, -1)
            infosKingPVP.agilidade = GetDwordPacket(packetName, -1)
            infosKingPVP.energia = GetDwordPacket(packetName, -1)
            infosKingPVP.vida = GetDwordPacket(packetName, -1)
            infosKingPVP.forca = GetDwordPacket(packetName, -1)
            infosKingPVP.comando = GetDwordPacket(packetName, -1)
            infosKingPVP.masterReset = GetDwordPacket(packetName, -1)
            infosKingPVP.reset = GetDwordPacket(packetName, -1)
            infosKingPVP.nomeGuild = GetDwordPacket(packetName, -1)

            ClearPacket(packetName)

            UICustomInterface = kingPVPWindowID
        end
    end
end

function KingPVP.LoadImages()
    kingConfigCodeImages.background = LoadImageByDir(kingConfigPathImages.background)
	kingConfigCodeImages.closeButton = LoadImageByDir(kingConfigPathImages.closeButton)
	kingConfigCodeImages.bgKingPvp = LoadImageByDir(kingConfigPathImages.bgKingPvp)
	kingConfigCodeImages.closeButtonHover = LoadImageByDir(kingConfigPathImages.closeButtonHover)
	kingConfigCodeImages.imageKing = LoadImageByDir(kingConfigPathImages.imageKing)
end

function KingPVP.InterfaceClickEvent()
    if UICustomInterface == kingPVPWindowID then
        if KingPVP.CheckButton(buttonsId.closeButton, MousePosX(), MousePosY(), buttonTables) then
            KingPVP.CloseWindow()
        end
    end
end

--Funções Privadas (Somente utilizada aqui dentro)
function KingPVP.CreateHeader()
    local language = GetLanguage()

    SetFontType(2)
    SetTextBg(0, 0, 0, 0)
    SetTextColor(255, 187, 000, 255)
    RenderText2(281, 102, string.format(kingConfigMessages[language][0]), 90, ALIGN_CENTER)
    
    SetFontType(1)
    RenderText2(127, 101, string.format(kingConfigMessages[language][1]), 90, ALIGN_LEFT)
    RenderText2(127, 113, string.format(kingConfigMessages[language][2]), 90, ALIGN_LEFT)

    SetTextColor(255, 255, 255, 255)
    RenderText2(145, 101, string.format(kingConfigMessages[language][15]), 90, ALIGN_LEFT)
    RenderText2(154, 113, string.format(kingConfigMessages[language][16]), 150, ALIGN_LEFT)
end

function KingPVP.CreateDetailPlayer()
    local language = GetLanguage()

    SetFontType(1)
    SetTextBg(0, 0, 0, 0)
    
    --Strings das informações do personagem
    SetTextColor(255, 255, 255, 255)
    RenderText2(146, 152, string.format(kingConfigMessages[language][3]), 90, ALIGN_CENTER)
    SetTextColor(255, 187, 000, 255)
    RenderText2(130, 165, string.format(kingConfigMessages[language][4]), 30, ALIGN_LEFT)
    RenderText2(130, 175, string.format(kingConfigMessages[language][5]), 30, ALIGN_LEFT)
    RenderText2(130, 185, string.format(kingConfigMessages[language][6]), 30, ALIGN_LEFT)
    RenderText2(130, 195, string.format(kingConfigMessages[language][7]), 30, ALIGN_LEFT)
    RenderText2(130, 205, string.format(kingConfigMessages[language][8]), 30, ALIGN_LEFT)
    
    --Detalhes das informações do personagem
    SetTextColor(255, 255, 255, 255)
    RenderText2(153, 165, string.format(infosKingPVP.level), 90, ALIGN_LEFT) --Level player
    RenderText2(164, 175, string.format(infosKingPVP.agilidade), 90, ALIGN_LEFT) --agilidade player
    RenderText2(159, 185, string.format(infosKingPVP.energia), 90, ALIGN_LEFT) --energia player
    RenderText2(150, 195, string.format(infosKingPVP.vida), 90, ALIGN_LEFT) --vida player
    RenderText2(153, 205, string.format(infosKingPVP.forca), 90, ALIGN_LEFT) --forca player
    
    --String Estatisticas
    SetTextColor(255, 255, 255, 255)
    RenderText2(146, 225, string.format(kingConfigMessages[language][9]), 90, ALIGN_CENTER)
    SetTextColor(255, 187, 000, 255)
    RenderText2(130, 238, string.format(kingConfigMessages[language][10]), 90, ALIGN_LEFT)
    RenderText2(130, 248, string.format(kingConfigMessages[language][11]), 90, ALIGN_LEFT)
    
    --Detalhes Estatisticas
    SetTextColor(255, 255, 255, 255)
    RenderText2(179, 238, string.format(infosKingPVP.masterReset), 90, ALIGN_LEFT) --Level player
    RenderText2(156, 248, string.format(infosKingPVP.reset), 90, ALIGN_LEFT) --agilidade player
    
    SetTextColor(255, 187, 000, 255)
    RenderText2(272, 336, string.format(kingConfigMessages[language][12]), 100, ALIGN_LEFT) --Premiação
    RenderText2(341, 354, string.format(kingConfigMessages[language][14]), 100, ALIGN_LEFT) --Nome vencedor

    SetTextColor(255, 255, 255, 255)
    RenderText2(310, 336, string.format(kingConfigMessages[language][13]), 250, ALIGN_LEFT)
    RenderText2(376, 354, string.format(infosKingPVP.nome), 250, ALIGN_LEFT)

    --String Estatisticas
    SetTextColor(255, 255, 255, 255)
    RenderText2(145, 268, string.format(kingConfigMessages[language][17]), 90, ALIGN_CENTER) --Guild
    
    SetTextColor(255, 187, 000, 255)
    RenderText2(131, 281, string.format(kingConfigMessages[language][18]), 100, ALIGN_LEFT) --Nome:
    RenderText2(131, 291, string.format(kingConfigMessages[language][20]), 100, ALIGN_LEFT) --Posição:
    
    SetTextColor(255, 255, 255, 255)
    RenderText2(153, 281, string.format(kingConfigMessages[language][19]), 100, ALIGN_LEFT) --LoveWar,
    RenderText2(160, 291, string.format(kingConfigMessages[language][21]), 100, ALIGN_LEFT) --Líder
end

function KingPVP.CreateBackground()
    RenderImage2(kingConfigCodeImages.background, 107, 86, 437, 308, 0.003000, -0.002000, 0.729000, 0.821000, 1, 1, 1)
    RenderImage2(kingConfigCodeImages.imageKing, 337, 205, 181, 187, -0.055000, -0.097000, 1.053000, 0.991000, 1, 1, 1)
    RenderImage2(kingConfigCodeImages.bgKingPvp, 323, 184, 137, 144, 0.008000, 0.017000, 0.865000, 0.856000, 1, 1, 1)
end

function KingPVP.CreateCloseButton()
    KingPVP.CreateButton(buttonsId.closeButton, 500, 096, 24, 24, buttonTables)
    RenderImage2(kingConfigCodeImages.closeButton, 500, 096, 24, 24, -0.012000, -0.007000, 0.546000, 0.582000, 1, 1, 1)
    
    if KingPVP.CheckButton(buttonsId.closeButton, MousePosX(), MousePosY(), buttonTables) then
        RenderImage2(kingConfigCodeImages.closeButtonHover, 500, 096, 24, 24, -0.012000, -0.007000, 0.546000, 0.582000, 1, 1, 1)

        SetFontType(1)
        SetTextBg(0, 0, 0, 255)
        SetTextColor(255, 255, 255, 255)
        RenderText2(506, 100, string.format('Fechar tela'), 40, ALIGN_CENTER)
    end
end

function KingPVP.CloseWindow()
    UICustomInterface = 0
    SetUnlockInterfaces()
end

function KingPVP.CreateButton(IdBotao, X, Y, W, H, tableParam)
	if tableParam[IdBotao] == nil then
		table.insert(tableParam, IdBotao)
	end
	tableParam[IdBotao] = {X1 = X, X2 = X+W, Y1 = Y, Y2 = Y+H}
end

function KingPVP.CheckButton(IdBotao, X, Y, tableParam)
	if tableParam[IdBotao] == nil then return false end
	if X >= tableParam[IdBotao].X1 and X <= tableParam[IdBotao].X2 and Y >= tableParam[IdBotao].Y1 and Y <= tableParam[IdBotao].Y2 then
		return true
	end
	return false
end

KingPVP.Init()

return KingPVP
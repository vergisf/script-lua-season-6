LIMPARINVENTARIO_SWITCH = 1

local LIMPARINVENTARIO_MESSAGES = {}

LIMPARINVENTARIO_MESSAGES['Por'] = {
[1] = 'Limpar Inventário',
[2] = 'ATENÇÃO',
[3] = 'TODOS OS ITENS NÃO EQUIPADOS',
[4] = 'VOCÊ TEM CERTEZA QUE DESEJA CONTINUAR?',
[5] = 'SIM',
[6] = 'NÃO',
[7] = 'Limpar Inventário',
[8] = 'SERÃO EXCLUÍDOS PERMANENTEMENTE',
}

LIMPARINVENTARIO_MESSAGES['Eng'] = {
[1] = 'Limpar Inventário',
[2] = 'ATENÇÃO',
[3] = 'TODOS OS ITENS NÃO EQUIPADOS',
[4] = 'VOCÊ TEM CERTEZA QUE DESEJA CONTINUAR?',
[5] = 'SIM',
[6] = 'NÃO',
[7] = 'Limpar Inventário',
[8] = 'SERÃO EXCLUÍDOS PERMANENTEMENTE',
}

LIMPARINVENTARIO_MESSAGES['Spn'] = {
[1] = 'Limpar Inventário',
[2] = 'ATENÇÃO',
[3] = 'TODOS OS ITENS NÃO EQUIPADOS ',
[4] = 'VOCÊ TEM CERTEZA QUE DESEJA CONTINUAR?',
[5] = 'SIM',
[6] = 'NÃO',
[7] = 'Limpar Inventário',
[8] = 'SERÃO EXCLUÍDOS PERMANENTEMENTE',
}

LimparInventario = {}

local LimparInventarioVisible = 0
local LimparInventarioImage1 = -1

local m_PosX = 400	
local m_PosY = 438

function LimparInventario.Render2()
    if LimparInventario.CheckRender() == 0
    then
        return
    end
	
    EnableAlphaTest()
    glColor4f(1.0, 1.0, 1.0, 1.0)
	
	if CheckWindowOpen(UIInventory) == 1
	then
	RenderImage(LimparInventarioImage1, 583, 393, 24, 24)
	end
	
    DisableAlphaBlend()
end

--POSITION MENU--
function LimparInventario.Render()
    if LimparInventario.CheckRender() == 0
    then
        return
    end

    EnableAlphaTest()

    glColor4f(1.0, 1.0, 1.0, 1.0)
	
    if CheckWindowOpen(UIInventory) == 1
    then
             if MousePosX() >= 583 and MousePosX() <= 583 + 24
             and MousePosY() >= 393 and MousePosY() <= 393 + 24
             then
     
             --Text
            SetFontType(1)
            
            SetTextColor(255, 255, 255, 255)
            
            SetTextBg(0, 0, 0, 180)
            RenderText3(596, 381, LIMPARINVENTARIO_MESSAGES[GetLanguage()][1], 67, 8)
	    end
    end 

    DisableAlphaBlend()
	
    if LimparInventarioVisible ~= 1
    then
        return
    end

    LimparInventario.RenderWindow()
end
--FIM POSITION MENU--

--PAINEL MENU--
function LimparInventario.RenderWindow()

    if LimparInventario.CheckRender() == 0
    then
        return
    end

    EnableAlphaTest()

    glColor4f(1.0, 1.0, 1.0, 1.0)
	
    local PosX = (677 / 2) - (230 / 2)
    local PosY = 155



	glColor4f(0.0, 0.0, 0.0, 0.6)
	
	DrawBar(PosX, PosY - 1, 200, 160 + 1, 0.0, 0)
	
	glColor4f(0.0, 0.0, 0.0, 0.6)

	DrawBar(PosX, PosY - 1, 200, 160 + 1, 0.0, 0)
	
	if MousePosX() >=  273 and MousePosY() >= 280 and MousePosX() <= 313 and MousePosY() <=300
	then
	glColor4f(0.28, 0.28, 0.28, 0.8)
	else
	glColor4f(0.18, 0.18, 0.18, 1.0)
	end
	DrawBar(273, 280, 40, 20)
	
	if MousePosX() >=  337 and MousePosY() >= 280 and MousePosX() <= 377 and MousePosY() <=300
	then
	glColor4f(0.28, 0.28, 0.28, 0.8)
	else
	glColor4f(0.18, 0.18, 0.18, 1.0)
	end
	DrawBar(337, 280, 40, 20)
	
	EndDrawBar()
	

	RenderImage(31340, PosX - 3, PosY - 3, 14.0, 14.0)
	RenderImage(31341, PosX + 200 - 9, PosY - 3, 14.0, 14.0)
	RenderImage(31342, PosX - 3, PosY + 160 - 8, 14.0, 14.0)
	RenderImage(31343, PosX + 200 - 9, PosY + 160 - 8, 14.0, 14.0)

	for i = (PosX + 10), PosX + 200 - 9, 1
	do
		RenderImage(31344, i, PosY - 3, 1, 14);
		RenderImage(31345, i, PosY + 160 - 8, 1, 14)
	end
	
	for i = PosY	+ 11, PosY + 160 - 8, 1
	do
		RenderImage(31346, PosX - 3, i, 14, 1);
		RenderImage(31347, PosX + 200 - 9, i, 14, 1)
	end

--Division Up
	for i = (224 + 10), 224 + 200 - 9, 1
	do
		RenderImage(31344, i, 190 - 3, 1, 14);
	end

--Division Down
	for i = (224 + 10), 224 + 200 - 9, 1
	do
		RenderImage(31344, i, 265 - 3, 1, 14);
	end
	
	local PosX = 225
    local PosY = 155
	
	
	--Render Texts
	LimparInventario.RenderText(PosX, PosY)
	
	DisableAlphaBlend()
end
--FIM POSITION MENU

--TEXTS
function LimparInventario.RenderText(x, y)

    if LimparInventario.CheckRender() == 0
    then
        return
    end
    
	EnableAlphaTest()
    local posY = 0.0

    --Text
	glColor4f(0.0, 0.0, 0.0, 0.7)
	
	GLSwitchBlend()	
	
	glColor3f(1.0, 1.0, 1.0)
	
	SetFontType(1)
	
	SetTextColor(255, 189, 25, 255)
	
	SetTextBg(0, 0, 0, 0)
	
	RenderText3(x + 100, y + 10+ posY, LIMPARINVENTARIO_MESSAGES[GetLanguage()][7], 200, 8)
	
	SetTextColor(255, 0, 0, 255)
	RenderText3(x + 100, y + 47+ posY, LIMPARINVENTARIO_MESSAGES[GetLanguage()][2], 200, 8)
	RenderText3(x + 100, y + 59+ posY, LIMPARINVENTARIO_MESSAGES[GetLanguage()][3], 200, 8)
	RenderText3(x + 100, y + 71+ posY, LIMPARINVENTARIO_MESSAGES[GetLanguage()][8], 200, 8)
	RenderText3(x + 100, y + 83+ posY, LIMPARINVENTARIO_MESSAGES[GetLanguage()][4], 200, 8)
	
	SetTextColor(255, 255, 255, 255)
	
	RenderText3(x + 69, y + 131 + posY, LIMPARINVENTARIO_MESSAGES[GetLanguage()][5], 200, 8)
	RenderText3(x + 133, y + 131 + posY, LIMPARINVENTARIO_MESSAGES[GetLanguage()][6], 200, 8)
	
	DisableAlphaBlend()
end

function LimparInventario.UpdateMouse()

    if LimparInventario.CheckRender() == 0
    then
        return
    end

    local WindowWidth = GetWindowWidth()

    m_PosX = 80 + 79

    if (WindowWidth == 800)
    then
        m_PosX = 112 + 79
    elseif (WindowWidth == 1024)
    then
        m_PosX = 96 + 79
    end

	
if	CheckWindowOpen(UIInventory)	    == 1	then
    if (MousePosX() >= 583 and MousePosX() <= 583 + 24)
        and (MousePosY() >= 393 and MousePosY() <= 393 + 24)
    then
        if (CheckClickClient() == 1)
        then
            LimparInventario.Open()
            DisableClickClient()
            return
        end
    end
end
    --Update mouse window
    if LimparInventarioVisible ~= 1
    then
        return
    end

    --Close button
    if MousePosX() >=  337 and MousePosY() >= 280 and MousePosX() <= 377 and MousePosY() <=300
    then
        if (CheckClickClient() == 1)
        then
            LimparInventarioVisible = 0
            DisableClickClient()
            return
        end
    end
	
    DisableClickClient()
end

function LimparInventario.ClickEvent()

    LogDebug("Enviou o packet")

    if LimparInventario.CheckRender() == 0
    then
        return
    end

	if MousePosX() >=  273 and MousePosY() >= 280 and MousePosX() <= 313 and MousePosY() <=300 and LimparInventarioVisible == 1 and CheckWindowOpen(UIInventory) == 1
    then
	        local packetName = "ClearInv"
            CreatePacket (packetName, 0x32)
			SetBytePacket(packetName, 1)
			SendPacket(packetName)
			ClearPacket(packetName)
			LimparInventarioVisible = 0
            DisableClickClient()
    end
end

function LimparInventario.UpdateKeyEvent()
    if LimparInventarioVisible ~= 1
    then
        return
    end

    if (CheckPressedKey(Keys.Escape) == 1) or (CheckPressedKey(Keys.V) == 1) or (CheckPressedKey(Keys.L) == 1)  or (CheckPressedKey(Keys.I) == 1)
	or (CheckPressedKey(Keys.P) == 1)  or (CheckPressedKey(Keys.G) == 1)  or (CheckPressedKey(Keys.C) == 1)
	then
		LimparInventarioVisible = 0
	end
end

function LimparInventario.CheckRender()
    if CheckWindowOpen(UIWarehouse) == 1 or CheckWindowOpen(UICharacter) == 1 or CheckWindowOpen(UIChaosBox) == 1 or CheckWindowOpen(UIShop) == 1
	or CheckWindowOpen(UICashShop) == 1 or CheckWindowOpen(UISkillTree) == 1 or CheckWindowOpen(UIFullMap) == 1 or CheckWindowOpen(UITrade) == 1
    or (CheckWindowOpen(UIWarehouse) == 1 and CheckWindowOpen(UIExpandWarehouse) == 1)
	or (CheckWindowOpen(UIChaosBox) == 1 and CheckWindowOpen(UIExpandInventory) == 1)
	
    then
        return 0
    end

    return 1

end

function LimparInventario.Open()
    LimparInventarioVisible = 1
end

function LimparInventario.LoadImages()
	LimparInventarioImage1 = LoadImageByDir("Interface///Trash.jpg")
end

function LimparInventario.Init()
    if LIMPARINVENTARIO_SWITCH ~= 1
    then
        return
    end

    LimparInventarioVisible = 0

	InterfaceController.MainProc(LimparInventario.Render)
	InterfaceController.MainProc(LimparInventario.Render2)
	InterfaceController.UpdateMouse(LimparInventario.UpdateMouse)
	InterfaceController.UpdateKey(LimparInventario.UpdateKeyEvent)
	InterfaceController.InterfaceClickEvent(LimparInventario.ClickEvent)
	InterfaceController.LoadImages(LimparInventario.LoadImages)
end

LimparInventario.Init()

return LimparInventario
PacotePromocional = {}

function PacotePromocional.Init()
    InterfaceController.MainProc(PacotePromocional.Interface)
    InterfaceController.UpdateMouse(PacotePromocional.UpdateMouse)
    InterfaceController.UpdateKey(PacotePromocional.UpdateKey)
    InterfaceController.ScrollMouse(PacotePromocional.ScrollMouse)
	InterfaceController.ClientProtocol(PacotePromocional.Protocol)
    PacotePromocional.Define()
end

function PacotePromocional.Define()
    PacotePromocional_Config.Button = {}
    PacotePromocional_Config.ButtonID = {
        fechar_voltar = 1,
        acessar_comprar = 2,
        ok = 3,
        cancelar = 4,
		up = 5,
		down = 6
    }

    PacotePromocional_Config.Window = {
        PosX = 120,
        PosY = 80,
        Width = 400,
        Height = 300
    }

    PacotePromocional_Config.m_SelectedItemListID = 1
	PacotePromocional_Config.m_SelectedSectionListID = 1
	PacotePromocional_Config.m_SectionList = {}
	PacotePromocional_Config.m_ItemList = {}
	PacotePromocional_Config.m_Animation = false
	PacotePromocional_Config.m_AnimationStartTime = os.time()
	PacotePromocional_Config.m_CurrentPage = 0
	PacotePromocional_Config.m_ListOffset = 1
	PacotePromocional_Config.m_MaxListID = 10
	PacotePromocional_Config.m_LockInterface = false
	PacotePromocional_Config.m_ShowAlertWindow = false
	PacotePromocional_Config.m_AlertWindowType = 0
	PacotePromocional_Config.m_WinnerItemListID = -1
    PacotePromocional_Config.Barra = {Offset = 0, InitSize = 186, Size = 0, MaxOffset = 0, Pos = 0, InitEsp = 186, Esp = 0, Multiplier = 0}
	PacotePromocional_Config.WasOpen = false
end

function PacotePromocional.CreateButton(ButtonID, x, y, w, h)
	if PacotePromocional_Config.Button[ButtonID] == nil then
		PacotePromocional_Config.Button[ButtonID] = {
			x = x,
			y = y,
			w = w,
			h = h,
			clicked = false,
			timer = 0
		}
	else
		PacotePromocional_Config.Button[ButtonID].x = x
		PacotePromocional_Config.Button[ButtonID].y = y
		PacotePromocional_Config.Button[ButtonID].w = w
		PacotePromocional_Config.Button[ButtonID].h = h
	end
end

function PacotePromocional.ButtonClicked(ButtonID)
	if PacotePromocional_Config.Button[ButtonID] == nil then return false end
	if PacotePromocional_Config.Button[ButtonID].clicked then
		if PacotePromocional_Config.Button[ButtonID].timer >= 2 then
			PacotePromocional_Config.Button[ButtonID].timer = 0
			PacotePromocional_Config.Button[ButtonID].clicked = false
			return false
		end
		PacotePromocional_Config.Button[ButtonID].timer = PacotePromocional_Config.Button[ButtonID].timer + 1
		return true
	end
	return false
end

function PacotePromocional.ButtonMouseOver(ButtonID, x, y)
	if PacotePromocional_Config.Button[ButtonID] == nil then return false end
	if x >= PacotePromocional_Config.Button[ButtonID].x and x <= (PacotePromocional_Config.Button[ButtonID].x+PacotePromocional_Config.Button[ButtonID].w) then
		if y >= PacotePromocional_Config.Button[ButtonID].y and y <= (PacotePromocional_Config.Button[ButtonID].y+PacotePromocional_Config.Button[ButtonID].h) then
			return true
		end
	end
	return false
end

function PacotePromocional.Open()
	CloseWindow(UIInventory)
	CloseWindow(UICharacter)
    UICustomInterface = PacotePromocional_Config.WindowID
	PacotePromocional.RecalculateList()
	PacotePromocional_Config.WasOpen = true
	math.randomseed(os.time()*os.clock()^3)
end

function PacotePromocional.Close()
 	UICustomInterface = 0
	local packetName = string.format("2-%d-%s", UserGetIndex(), UserGetName())
	CreatePacket(packetName, PacotePromocional_Config.Packet)
	SendPacket(packetName)
	ClearPacket(packetName)
	PacotePromocional.Define()
end

function PacotePromocional.CheckOpen()
    if UICustomInterface == PacotePromocional_Config.WindowID then return true else return false end
end

function PacotePromocional.Interface()
    if not PacotePromocional.CheckOpen() then return end

    local lang = GetLanguage()
    PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.fechar_voltar, 0, 0, 0, 0)
    PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.acessar_comprar, 0, 0, 0, 0)
    PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.ok, 0, 0, 0, 0)
    PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.cancelar, 0, 0, 0, 0)
    PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.up, 0, 0, 0, 0)
    PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.down, 0, 0, 0, 0)

	EnableAlphaTest()
	glColor3f(1.0, 1.0, 1.0)
	RenderImage(41003, PacotePromocional_Config.Window.PosX, PacotePromocional_Config.Window.PosY, PacotePromocional_Config.Window.Width, PacotePromocional_Config.Window.Height)
	RenderImage(41004, PacotePromocional_Config.Window.PosX + 100, PacotePromocional_Config.Window.PosY + 1, 199, 18)

	SetFontType(1)
	SetTextBg( 0, 0, 0, 0)
	SetTextColor( 240, 240, 240, 255)
	RenderText3(PacotePromocional_Config.Window.PosX + 198, PacotePromocional_Config.Window.PosY + 3, PacotePromocional_Config.Texts[lang][1], 150, 8)

	DisableAlphaBlend()
	SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.8)
	DrawBar(PacotePromocional_Config.Window.PosX+31, PacotePromocional_Config.Window.PosY+37, 155, 245)
	DrawBar(PacotePromocional_Config.Window.PosX + 214, PacotePromocional_Config.Window.PosY + 38, 152, 152)
	local posY = PacotePromocional_Config.Window.PosY + 34 + 4 + 24
	for i = PacotePromocional_Config.m_ListOffset, PacotePromocional_Config.m_MaxListID do
		glColor4f(0.5, 0.5, 0.5, 0.4)
		DrawBar(PacotePromocional_Config.Window.PosX+40, posY, 120, 1)
		if (PacotePromocional.IsWorkZone(PacotePromocional_Config.Window.PosX + 40, posY-22, 120, 22)) and not PacotePromocional_Config.m_ShowAlertWindow then
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(PacotePromocional_Config.Window.PosX + 40, posY-24, 120, 24)
        end
		if (i == PacotePromocional_Config.m_SelectedItemListID) then
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(PacotePromocional_Config.Window.PosX + 40, posY - 24, 120, 24)
        end
		posY = posY + 24
	end

	glColor4f(0.37, 0.3317, 0.2849, 1.0)
	DrawBar(PacotePromocional_Config.Window.PosX + 167, PacotePromocional_Config.Window.PosY + 53, 14, 212)
	glColor4f(0.91, 0.875, 0.8099, 1.0)
	DrawBar(PacotePromocional_Config.Window.PosX + 168, PacotePromocional_Config.Window.PosY + 65+PacotePromocional_Config.Barra.Pos, 12, PacotePromocional_Config.Barra.Size)
	glColor4f(0.39, 0.3504, 0.3081, 0.6)
	DrawBar(PacotePromocional_Config.Window.PosX + 169, PacotePromocional_Config.Window.PosY + 66+PacotePromocional_Config.Barra.Pos, 10, PacotePromocional_Config.Barra.Size-2)
	EndDrawBar()
	EnableAlphaTest()
	SetBlend()
	glColor3f(1.0, 1.0, 1.0)

	RenderImage2(41007, PacotePromocional_Config.Window.PosX + 30, PacotePromocional_Config.Window.PosY + 34, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)
	for i = 38, 260, 40 do
		RenderImage2(41007 + 1, PacotePromocional_Config.Window.PosX + 30 +156, PacotePromocional_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
		RenderImage2(41007 + 1, PacotePromocional_Config.Window.PosX + 30, PacotePromocional_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
    end
	RenderImage2(41007, PacotePromocional_Config.Window.PosX + 30, PacotePromocional_Config.Window.PosY + 34+ 244, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)

	posY = PacotePromocional_Config.Window.PosY + 34 + 4 + 9
	SetFontType(0)
	SetTextBg( 0, 0, 0, 0)
	for i = PacotePromocional_Config.m_ListOffset, PacotePromocional_Config.m_MaxListID do
		SetTextColor( 240, 240, 240, 255)
		if (PacotePromocional_Config.m_CurrentPage == 0) then
			if (i == PacotePromocional_Config.m_SelectedSectionListID) then
				SetTextColor( 0, 180, 230, 255)
            end
			RenderText3( PacotePromocional_Config.Window.PosX + 50, posY, PacotePromocional_Config.m_SectionList[i].Name, 111, 1)
		else
			if (i == PacotePromocional_Config.m_SelectedItemListID) then
				SetTextColor( 0, 180, 230, 255)
            end
			
			RenderText3( PacotePromocional_Config.Window.PosX + 50, posY,  string.format("(%dx) %s", PacotePromocional_Config.m_ItemList[i].Count, GetNameByIndex(PacotePromocional_Config.m_ItemList[i].ItemIndex)), 111, 1)
			
		end
		posY = posY + 24
	end

	RenderImage2(41007, PacotePromocional_Config.Window.PosX + 210, PacotePromocional_Config.Window.PosY + 34, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)
	for i = 34, 160, 40 do
		RenderImage2(41007 + 1, PacotePromocional_Config.Window.PosX + 210, PacotePromocional_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
		RenderImage2(41007 + 1, PacotePromocional_Config.Window.PosX + 366, PacotePromocional_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
    end
	RenderImage2(41007, PacotePromocional_Config.Window.PosX + 210, PacotePromocional_Config.Window.PosY + 34+156, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)

	PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.up, PacotePromocional_Config.Window.PosX + 168, PacotePromocional_Config.Window.PosY + 53, 13, 12)
	if not PacotePromocional.ButtonClicked(PacotePromocional_Config.ButtonID.up) then
		RenderImage2(41052, PacotePromocional_Config.Window.PosX + 168, PacotePromocional_Config.Window.PosY + 53, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	else
		RenderImage2(41053, PacotePromocional_Config.Window.PosX + 168, PacotePromocional_Config.Window.PosY + 53, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	end

	PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.down, PacotePromocional_Config.Window.PosX + 168, PacotePromocional_Config.Window.PosY + 252, 13, 12)
	if not PacotePromocional.ButtonClicked(PacotePromocional_Config.ButtonID.down) then
		RenderImage2(41050, PacotePromocional_Config.Window.PosX + 168, PacotePromocional_Config.Window.PosY + 252, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	else
		RenderImage2(41051, PacotePromocional_Config.Window.PosX + 168, PacotePromocional_Config.Window.PosY + 252, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	end

	PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.acessar_comprar, PacotePromocional_Config.Window.PosX+235, PacotePromocional_Config.Window.PosY+210, 110, 25)
	RenderImage2(41006, PacotePromocional_Config.Window.PosX+235, PacotePromocional_Config.Window.PosY+210, 110, 25, 0.0, 0.0, 0.8322874124, 1.0, 1, 1, 1.0)
	if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.acessar_comprar, MousePosX(), MousePosY()) then
		if not PacotePromocional.ButtonClicked(PacotePromocional_Config.ButtonID.acessar_comprar) then
			DisableAlphaBlend()
			SetBlend()
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(PacotePromocional_Config.Window.PosX+235, PacotePromocional_Config.Window.PosY+210, 110, 25)
			SetBlend()
			EndDrawBar()
			EnableAlphaTest()
		end
	end

	PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.fechar_voltar, PacotePromocional_Config.Window.PosX+235, PacotePromocional_Config.Window.PosY+245, 110, 25)
	RenderImage2(41006, PacotePromocional_Config.Window.PosX+235, PacotePromocional_Config.Window.PosY+245, 110, 25, 0.0, 0.0, 0.8322874124, 1.0, 1, 1, 1.0)
	if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.fechar_voltar, MousePosX(), MousePosY()) then
		if not PacotePromocional.ButtonClicked(PacotePromocional_Config.ButtonID.fechar_voltar) then
			DisableAlphaBlend()
			SetBlend()
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(PacotePromocional_Config.Window.PosX+235, PacotePromocional_Config.Window.PosY+245, 110, 25)
			SetBlend()
			EndDrawBar()
			EnableAlphaTest()
		end
	end

	if (PacotePromocional_Config.m_CurrentPage == 0) then
		SetFontType(1)
		SetTextBg( 0, 0, 0, 0)
		SetTextColor( 240, 240, 240, 255)
		RenderText3((PacotePromocional_Config.Window.PosX+235+(110/2)), (PacotePromocional_Config.Window.PosY+210+((25/2)-3)), PacotePromocional_Config.Texts[lang][13], 110, 8)
		RenderText3((PacotePromocional_Config.Window.PosX+235+(110/2)), (PacotePromocional_Config.Window.PosY+245+((25/2)-3)), PacotePromocional_Config.Texts[lang][14], 110, 8)

		SetFontType(1)
		SetTextBg( 0, 0, 0, 0)
		SetTextColor( 0, 180, 230, 255)
		RenderText3( PacotePromocional_Config.Window.PosX + 290, PacotePromocional_Config.Window.PosY+50, PacotePromocional_Config.m_SectionList[PacotePromocional_Config.m_SelectedSectionListID].Name, 160, 8)


		SetTextColor( 240, 176, 2, 255)
		RenderText3( PacotePromocional_Config.Window.PosX + 290, PacotePromocional_Config.Window.PosY+75, PacotePromocional_Config.Texts[lang][4], 160, 8)
		SetFontType(0)
		SetTextColor( 240, 240, 240, 255)
		RenderText3( PacotePromocional_Config.Window.PosX + 290, PacotePromocional_Config.Window.PosY+85, PacotePromocional_Config.m_SectionList[PacotePromocional_Config.m_SelectedSectionListID].Availability, 160, 8)

		SetFontType(1)
		SetTextColor( 240, 176, 2, 255)
		RenderText3( PacotePromocional_Config.Window.PosX + 290, PacotePromocional_Config.Window.PosY + 110, PacotePromocional_Config.Texts[lang][5], 160, 8)

		SetFontType(0)
		SetTextColor( 240, 240, 240, 255)
		local costPosY = PacotePromocional_Config.Window.PosY + 120
		for c = 1, #PacotePromocional_Config.m_SectionList[PacotePromocional_Config.m_SelectedSectionListID].Cost do
			RenderText3( PacotePromocional_Config.Window.PosX + 290, costPosY, string.format(PacotePromocional_Config.Texts[lang][6], PacotePromocional_Config.m_SectionList[PacotePromocional_Config.m_SelectedSectionListID].Cost[c].Value, PacotePromocional_Config.m_SectionList[PacotePromocional_Config.m_SelectedSectionListID].Cost[c].Nome), 160, 8)
			costPosY = costPosY + 10
		end
	else
        SetFontType(1)
		SetTextBg( 0, 0, 0, 0)
		SetTextColor( 240, 240, 240, 255)
		RenderText3((PacotePromocional_Config.Window.PosX+235+(110/2)), (PacotePromocional_Config.Window.PosY+210+((25/2)-3)), PacotePromocional_Config.Texts[lang][15], 110, 8)
		RenderText3((PacotePromocional_Config.Window.PosX+235+(110/2)), (PacotePromocional_Config.Window.PosY+245+((25/2)-3)), PacotePromocional_Config.Texts[lang][16], 110, 8)

		CreateItem(PacotePromocional_Config.Window.PosX + 270 + PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].PosX, PacotePromocional_Config.Window.PosY + 90 + PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].PosY, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Width, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Height, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].ItemIndex, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Level, 0, 0, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Size)
		if (PacotePromocional.IsWorkZone(PacotePromocional_Config.Window.PosX + 270 + PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].PosX, PacotePromocional_Config.Window.PosY + 90 + PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].PosY, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Width, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Height)) then
			ShowItemDescription(MousePosX() + 100, MousePosY() + 10, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].ItemIndex, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Level, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Skill, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Luck, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].JoL, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Dur, PacotePromocional_Config.m_ItemList[PacotePromocional_Config.m_SelectedItemListID].Exc, 0)
        end

		if PacotePromocional_Config.m_WinnerItemListID ~= -1 then
			PacotePromocional_Config.m_WinnerItemListID = -1
			PacotePromocional_Config.m_AlertWindowType = 3
			PacotePromocional_Config.m_ShowAlertWindow = true
		end
	end
	if not PacotePromocional_Config.m_ShowAlertWindow then
		return
    end

	DisableAlphaBlend()
	
	SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.7)
	DrawBar(PacotePromocional_Config.Window.PosX, PacotePromocional_Config.Window.PosY, PacotePromocional_Config.Window.Width, PacotePromocional_Config.Window.Height)

	EndDrawBar()
	DisableAlphaBlend()
	EnableAlphaTest()

	RenderImage2(41007, PacotePromocional_Config.Window.PosX + 85, PacotePromocional_Config.Window.PosY + 6, 225, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)
	RenderImage2(41010, PacotePromocional_Config.Window.PosX + 85, PacotePromocional_Config.Window.PosY + 39, 225, 30, 0.0, 0.0, 0.8322874124, 0.6042874124, 1, 1, 1.0)
	RenderImage2(41010, PacotePromocional_Config.Window.PosX + 85, PacotePromocional_Config.Window.PosY + 10, 225, 30, 0.0, 0.0, 0.8322874124, 0.6042874124, 1, 1, 1.0)
	RenderImage2(41007, PacotePromocional_Config.Window.PosX + 85, PacotePromocional_Config.Window.PosY + 68, 225, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)

	SetFontType(0)
	SetTextBg( 0, 0, 0, 0)
	SetTextColor( 240, 240, 240, 255)

	if PacotePromocional_Config.m_AlertWindowType == 1 then
		RenderText3( PacotePromocional_Config.Window.PosX + 200, PacotePromocional_Config.Window.PosY+15, PacotePromocional_Config.Texts[lang][17], 160, 8)
		RenderText3( PacotePromocional_Config.Window.PosX + 200, PacotePromocional_Config.Window.PosY+25, PacotePromocional_Config.Texts[lang][18], 160, 8)
    elseif PacotePromocional_Config.m_AlertWindowType == 2 then
		RenderText3( PacotePromocional_Config.Window.PosX + 200, PacotePromocional_Config.Window.PosY + 20, PacotePromocional_Config.Texts[lang][19], 160, 8)
    elseif PacotePromocional_Config.m_AlertWindowType == 3 then
		RenderText3( PacotePromocional_Config.Window.PosX + 200, PacotePromocional_Config.Window.PosY + 15, PacotePromocional_Config.Texts[lang][20], 160, 8)
		RenderText3( PacotePromocional_Config.Window.PosX + 200, PacotePromocional_Config.Window.PosY + 25, PacotePromocional_Config.Texts[lang][21], 160, 8)
	end

	if PacotePromocional_Config.m_AlertWindowType == 1 then
        PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.ok, 240, 125, 60, 18)
        if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.ok, MousePosX(), MousePosY()) then
            RenderImage2(41011, 240, 125, 60, 18, 0.00688282, 0.313344848, 0.538486151, 0.333344848, 1, 1, 1.0)
        else
            RenderImage2(41011, 240, 125, 60, 18, 0.00688282, 0.002127840, 0.538486151, 0.323344848, 1, 1, 1.0)
        end

		PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.cancelar, 340, 125, 60, 18)
        RenderImage2(41012, 340, 125, 60, 18, 0.00688282, 0.002127840, 0.538486151, 0.323344848, 1, 1, 1.0)
        if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.cancelar, MousePosX(), MousePosY()) then
            RenderImage2(41012, 340, 125, 60, 18, 0.00688282, 0.313344848, 0.538486151, 0.333344848, 1, 1, 1.0)
        end
    else
		PacotePromocional.CreateButton(PacotePromocional_Config.ButtonID.ok, 290, 125, 60, 18)
        RenderImage2(41011, 290, 125, 60, 18, 0.00688282, 0.002127840, 0.538486151, 0.323344848, 1, 1, 1.0)
        if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.ok, MousePosX(), MousePosY()) then
            RenderImage2(41011, 290, 125, 60, 18, 0.00688282, 0.313344848, 0.538486151, 0.333344848, 1, 1, 1.0)
        end
	end

	DisableAlphaBlend()
end

function PacotePromocional.UpdateMouse()
	if not PacotePromocional.CheckOpen() then return end
    
	DisableClickClient()

	if CheckPressedKey(Keys.LButton) == 1 and not PacotePromocional_Config.m_LockInterface then
		if PacotePromocional_Config.m_ShowAlertWindow then
			if PacotePromocional_Config.m_AlertWindowType == 1 then
				if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.ok, MousePosX(), MousePosY()) then
					PacotePromocional_Config.m_LockInterface = true
					PacotePromocional_Config.m_ShowAlertWindow = false
					PacotePromocional.SendSpin()
				end
				if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.cancelar, MousePosX(), MousePosY()) then
					PacotePromocional_Config.m_ShowAlertWindow = false
				end
			else
				if PacotePromocional_Config.m_AlertWindowType == 3 then 
					PacotePromocional.Close()
				end
				if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.ok, MousePosX(), MousePosY()) then
					PacotePromocional_Config.m_ShowAlertWindow = false
				end
			end
			return
		end

		
		local posY = PacotePromocional_Config.Window.PosY + 34 + 4
		for i = PacotePromocional_Config.m_ListOffset, PacotePromocional_Config.m_MaxListID do
			if PacotePromocional.IsWorkZone(PacotePromocional_Config.Window.PosX + 29, posY + 2, 120, 22) then
				if (PacotePromocional_Config.m_CurrentPage == 0) then
					PacotePromocional_Config.m_SelectedSectionListID = i
				else 
					PacotePromocional_Config.m_SelectedItemListID = i
				end
				return
			end
			posY = posY + 24
		end

		if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.up, MousePosX(), MousePosY()) then
			PacotePromocional_Config.Button[PacotePromocional_Config.ButtonID.up].clicked = true
			if PacotePromocional_Config.m_ListOffset <= 1 then
				return
			end
			PacotePromocional_Config.Barra.Offset = PacotePromocional_Config.Barra.Offset - 1
			PacotePromocional_Config.Barra.Pos = PacotePromocional_Config.Barra.Pos - PacotePromocional_Config.Barra.Multiplier
			PacotePromocional_Config.m_ListOffset = PacotePromocional_Config.m_ListOffset - 1
			PacotePromocional_Config.m_MaxListID = PacotePromocional_Config.m_MaxListID - 1
			return
		end
		if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.down, MousePosX(), MousePosY()) then
			PacotePromocional_Config.Button[PacotePromocional_Config.ButtonID.down].clicked = true
			if PacotePromocional_Config.m_CurrentPage == 0 then
				if PacotePromocional_Config.m_MaxListID >= #PacotePromocional_Config.m_SectionList then return end
			else 
				if PacotePromocional_Config.m_MaxListID >= #PacotePromocional_Config.m_ItemList then return end
			end
			PacotePromocional_Config.Barra.Offset = PacotePromocional_Config.Barra.Offset + 1
			PacotePromocional_Config.Barra.Pos = PacotePromocional_Config.Barra.Pos + PacotePromocional_Config.Barra.Multiplier
			PacotePromocional_Config.m_ListOffset = PacotePromocional_Config.m_ListOffset + 1
			PacotePromocional_Config.m_MaxListID = PacotePromocional_Config.m_MaxListID + 1
			return
		end
		if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.acessar_comprar, MousePosX(), MousePosY()) then
			PacotePromocional_Config.Button[PacotePromocional_Config.ButtonID.acessar_comprar].clicked = true
			if (PacotePromocional_Config.m_CurrentPage == 0) then
				PacotePromocional_Config.m_LockInterface = true
				PacotePromocional.SendAccessList()
			else
				PacotePromocional_Config.m_AlertWindowType = 1
				PacotePromocional_Config.m_ShowAlertWindow = true
			end
			return
		end

		if PacotePromocional.ButtonMouseOver(PacotePromocional_Config.ButtonID.fechar_voltar, MousePosX(), MousePosY()) then
			PacotePromocional_Config.Button[PacotePromocional_Config.ButtonID.fechar_voltar].clicked = true
			if (PacotePromocional_Config.m_CurrentPage == 0) then
				PacotePromocional.Close()
			else
				PacotePromocional_Config.m_CurrentPage = 0
				PacotePromocional_Config.m_SelectedSectionListID = 1
				PacotePromocional.RecalculateList()
			end		
		end
	end
end

function PacotePromocional.UpdateKey()
	if not PacotePromocional.CheckOpen() then
		if CheckReleasedKey(Keys.Escape) == 1 and PacotePromocional_Config.WasOpen then
			UICustomInterface = PacotePromocional_Config.WindowID
		end
		return 
	end

    if CheckWindowOpen(UIChatWindow) == 1 or CheckWindowOpen(UIStore) == 1 or CheckWindowOpen(UIGuildNpc) == 1 then return end
	
	if CheckPressedKey(Keys.Return) == 1 then return end
	
	DisableClickClient()
	
	if PacotePromocional_Config.m_LockInterface then return end

	if CheckPressedKey(Keys.Escape) == 1 then
		if (PacotePromocional_Config.m_ShowAlertWindow) then
			PacotePromocional_Config.m_ShowAlertWindow = false
		else
			PacotePromocional.Close()
		end
	end
end

function PacotePromocional.ScrollMouse(direction)
	if not PacotePromocional.CheckOpen() then return end

	if not PacotePromocional.IsWorkZone(PacotePromocional_Config.Window.PosX + 21, PacotePromocional_Config.Window.PosY + 37, 155, 245) or PacotePromocional_Config.m_LockInterface then return end

	if (direction > 0) then
		if PacotePromocional_Config.m_ListOffset <= 1 then
			return
		end
		PacotePromocional_Config.Barra.Offset = PacotePromocional_Config.Barra.Offset - 1
		PacotePromocional_Config.Barra.Pos = PacotePromocional_Config.Barra.Pos - PacotePromocional_Config.Barra.Multiplier
		PacotePromocional_Config.m_ListOffset = PacotePromocional_Config.m_ListOffset - 1
		PacotePromocional_Config.m_MaxListID = PacotePromocional_Config.m_MaxListID - 1
	else
		if PacotePromocional_Config.m_CurrentPage == 0 then
			if PacotePromocional_Config.m_MaxListID >= #PacotePromocional_Config.m_SectionList then return end
		else 
			if PacotePromocional_Config.m_MaxListID >= #PacotePromocional_Config.m_ItemList then return end
		end
		PacotePromocional_Config.Barra.Offset = PacotePromocional_Config.Barra.Offset + 1
		PacotePromocional_Config.Barra.Pos = PacotePromocional_Config.Barra.Pos + PacotePromocional_Config.Barra.Multiplier
		PacotePromocional_Config.m_ListOffset = PacotePromocional_Config.m_ListOffset + 1
		PacotePromocional_Config.m_MaxListID = PacotePromocional_Config.m_MaxListID + 1
	end
end

function PacotePromocional.IsWorkZone(x, y, w, h)
	if MousePosX() >= x and MousePosX() <= x + w and MousePosY() >= y and MousePosY() <= y + h then
		return true
    end
	return false
end

function PacotePromocional.RecalculateList()
	PacotePromocional_Config.m_ListOffset = 1
	PacotePromocional_Config.Barra.Offset = 0
	PacotePromocional_Config.Barra.Pos = 0
	
	if (PacotePromocional_Config.m_CurrentPage == 0) then
		if #PacotePromocional_Config.m_SectionList > 10 then
			PacotePromocional_Config.m_MaxListID = 10
		else
			PacotePromocional_Config.m_MaxListID = #PacotePromocional_Config.m_SectionList
		end

		if #PacotePromocional_Config.m_SectionList > 10 then
			PacotePromocional_Config.Barra.MaxOffset = #PacotePromocional_Config.m_SectionList - 10
			PacotePromocional_Config.Barra.Size = (PacotePromocional_Config.Barra.InitSize - ((#PacotePromocional_Config.m_SectionList - 10) * 10))
			if (PacotePromocional_Config.Barra.Size < 10) then
				PacotePromocional_Config.Barra.Size = 10
			end
		else
			PacotePromocional_Config.Barra.Size = PacotePromocional_Config.Barra.InitSize
		end
		PacotePromocional_Config.Barra.Esp = PacotePromocional_Config.Barra.InitEsp - PacotePromocional_Config.Barra.Size
		PacotePromocional_Config.Barra.Multiplier = PacotePromocional_Config.Barra.Esp / (#PacotePromocional_Config.m_SectionList - 10)
	else
		if #PacotePromocional_Config.m_ItemList > 10 then
			PacotePromocional_Config.m_MaxListID = 10
		else
			PacotePromocional_Config.m_MaxListID = #PacotePromocional_Config.m_ItemList
		end
	
		if #PacotePromocional_Config.m_ItemList > 10 then
			PacotePromocional_Config.Barra.MaxOffset = #PacotePromocional_Config.m_ItemList - 10
			PacotePromocional_Config.Barra.Size = (PacotePromocional_Config.Barra.InitSize - ((#PacotePromocional_Config.m_ItemList - 10) * 10))
			if (PacotePromocional_Config.Barra.Size < 10) then
				PacotePromocional_Config.Barra.Size = 10
			end		
		else 
			PacotePromocional_Config.Barra.Size = PacotePromocional_Config.Barra.InitSize
		end
		PacotePromocional_Config.Barra.Esp = PacotePromocional_Config.Barra.InitEsp - PacotePromocional_Config.Barra.Size
		PacotePromocional_Config.Barra.Multiplier = PacotePromocional_Config.Barra.Esp / (#PacotePromocional_Config.m_ItemList - 10)
	end
end

function PacotePromocional.Protocol(Packet, PacketName)
	if Packet ~= PacotePromocional_Config.Packet then return false end

	local aIndex = UserGetIndex()
	local name = UserGetName()

	if PacketName == string.format("1-%d-%s", aIndex, name) then
		PacotePromocional_Config.m_SectionList = {}
		local count = GetBytePacket(PacketName, -1)
		for i = 1, count do
        	local listID = GetBytePacket(PacketName, -1)       
        	local len = GetBytePacket(PacketName, -1)
        	local nome = GetCharPacketLength(PacketName, -1, len)
			len = GetBytePacket(PacketName, -1)
        	local availability = GetCharPacketLength(PacketName, -1, len)
			local costcount = GetBytePacket(PacketName, -1)
			local custo = {}
			for m = 1, costcount do
				local value = GetDwordPacket(PacketName, -1)
				len = GetBytePacket(PacketName, -1)
        		local nomemoeda = GetCharPacketLength(PacketName, -1, len)
				custo[m] = {Value = value, Nome = nomemoeda}
			end
        
			table.insert(PacotePromocional_Config.m_SectionList, {ListID = listID, Name = nome, Cost = custo, Availability = availability})
    	end
		ClearPacket(PacketName)
		PacotePromocional_Config.m_SelectedSectionListID = 1
		PacotePromocional_Config.m_CurrentPage = 0
		PacotePromocional.Open()
		return true
	end

	if PacketName == string.format("3-%d-%s", aIndex, name) then
		PacotePromocional_Config.m_ItemList = {}
		local count = GetBytePacket(PacketName, -1)
    	for c = 1, count do
    	   local itemIndex = GetWordPacket(PacketName,-1)
    	   local level = GetBytePacket(PacketName,-1)
    	   local dur = GetBytePacket(PacketName,-1)
    	   local skill = GetBytePacket(PacketName,-1)
    	   local luck = GetBytePacket(PacketName,-1)
    	   local jol = GetBytePacket(PacketName,-1)
    	   local exc = GetBytePacket(PacketName,-1)
    	   local days = GetBytePacket(PacketName,-1)
		   
		   local countItem = GetBytePacket(PacketName,-1)

    	   len = GetBytePacket(PacketName,-1)
		   local posx = GetCharPacketLength(PacketName, -1, len)

		   posx = tonumber(posx)
		   len = GetBytePacket(PacketName,-1)

		   local posy = GetCharPacketLength(PacketName, -1, len)

		   posy = tonumber(posy)
		   len = GetBytePacket(PacketName,-1)

		   local width = GetCharPacketLength(PacketName, -1, len)
		   width = tonumber(width)

		   len = GetBytePacket(PacketName,-1)
		   local height = GetCharPacketLength(PacketName, -1, len)
		   height = tonumber(height)

		   len = GetBytePacket(PacketName,-1)
		   local sizeStr = GetCharPacketLength(PacketName, -1, len)
		   local size = tonumber(sizeStr)

		   table.insert(PacotePromocional_Config.m_ItemList, {ListID = c, ItemIndex = itemIndex, Level = level, Dur = dur, Skill = skill, Luck = luck, JoL = jol, Exc = exc, Days = days, PosX = posx, PosY = posy, Width = width, Height = height, Size = size, Count = countItem})
    	end
		ClearPacket(PacketName)
		PacotePromocional_Config.m_SelectedItemListID = 1
		PacotePromocional_Config.m_CurrentPage = 1
		PacotePromocional.RecalculateList()
		PacotePromocional_Config.m_LockInterface = false
		return true
	end

	if PacketName == string.format("5-%d-%s", aIndex, name) then
		ClearPacket(PacketName)
		PacotePromocional_Config.m_AlertWindowType = 2
		PacotePromocional_Config.m_ShowAlertWindow = true
		PacotePromocional_Config.m_LockInterface = false
		return true
	end

	if PacketName == string.format("7-%d-%s", aIndex, name) then
		PacotePromocional_Config.m_WinnerItemListID = GetBytePacket(PacketName, -1)
		ClearPacket(PacketName)
		PacotePromocional_Config.m_LockInterface = false
		return true
	end

end

function PacotePromocional.SendSpin()
	local packetName = string.format("6-%d-%s", UserGetIndex(), UserGetName())
	CreatePacket(packetName, PacotePromocional_Config.Packet)
	SetBytePacket(packetName, PacotePromocional_Config.m_SelectedSectionListID)
	SendPacket(packetName)
	ClearPacket(packetName)
end

function PacotePromocional.SendAccessList()
	local packetName = string.format("4-%d-%s", UserGetIndex(), UserGetName())
	CreatePacket(packetName, PacotePromocional_Config.Packet)
	SetBytePacket(packetName, PacotePromocional_Config.m_SelectedSectionListID)
	SendPacket(packetName)
	ClearPacket(packetName)
end

PacotePromocional.Init()

return PacotePromocional
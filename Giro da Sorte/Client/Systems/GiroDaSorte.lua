GiroDaSorte = {}

function GiroDaSorte.Init()
    InterfaceController.MainProc(GiroDaSorte.Interface)
    InterfaceController.UpdateMouse(GiroDaSorte.UpdateMouse)
    InterfaceController.UpdateKey(GiroDaSorte.UpdateKey)
    InterfaceController.ScrollMouse(GiroDaSorte.ScrollMouse)
	InterfaceController.ClientProtocol(GiroDaSorte.Protocol)
    GiroDaSorte.Define()
end

function GiroDaSorte.Define()
    GiroDaSorte_Config.Button = {}
    GiroDaSorte_Config.ButtonID = {
        fechar_voltar = 1,
        acessar_girar = 2,
        ok = 3,
        cancelar = 4,
		up = 5,
		down = 6
    }
    GiroDaSorte_Config.Window = {
        PosX = 120,
        PosY = 80,
        Width = 400,
        Height = 300
    }
    GiroDaSorte_Config.m_SelectedItemListID = 1
	GiroDaSorte_Config.m_SelectedSectionListID = 1
	GiroDaSorte_Config.m_SectionList = {}
	GiroDaSorte_Config.m_ItemList = {}
	GiroDaSorte_Config.m_Animation = false
	GiroDaSorte_Config.m_AnimationStartTime = os.time()
	GiroDaSorte_Config.m_CurrentPage = 0
	GiroDaSorte_Config.m_ListOffset = 1
	GiroDaSorte_Config.m_MaxListID = 10
	GiroDaSorte_Config.m_LockInterface = false
	GiroDaSorte_Config.m_ShowAlertWindow = false
	GiroDaSorte_Config.m_AlertWindowType = 0
	GiroDaSorte_Config.m_WinnerItemListID = -1
    GiroDaSorte_Config.Barra = {Offset = 0, InitSize = 186, Size = 0, MaxOffset = 0, Pos = 0, InitEsp = 186, Esp = 0, Multiplier = 0}
	GiroDaSorte_Config.WasOpen = false
end

function GiroDaSorte.CreateButton(ButtonID, x, y, w, h)
	if GiroDaSorte_Config.Button[ButtonID] == nil then
		GiroDaSorte_Config.Button[ButtonID] = {
			x = x,
			y = y,
			w = w,
			h = h,
			clicked = false,
			timer = 0
		}
	else
		GiroDaSorte_Config.Button[ButtonID].x = x
		GiroDaSorte_Config.Button[ButtonID].y = y
		GiroDaSorte_Config.Button[ButtonID].w = w
		GiroDaSorte_Config.Button[ButtonID].h = h
	end
end

function GiroDaSorte.ButtonClicked(ButtonID)
	if GiroDaSorte_Config.Button[ButtonID] == nil then return false end
	if GiroDaSorte_Config.Button[ButtonID].clicked then
		if GiroDaSorte_Config.Button[ButtonID].timer >= 2 then
			GiroDaSorte_Config.Button[ButtonID].timer = 0
			GiroDaSorte_Config.Button[ButtonID].clicked = false
			return false
		end
		GiroDaSorte_Config.Button[ButtonID].timer = GiroDaSorte_Config.Button[ButtonID].timer + 1
		return true
	end
	return false
end

function GiroDaSorte.ButtonMouseOver(ButtonID, x, y)
	if GiroDaSorte_Config.Button[ButtonID] == nil then return false end
	if x >= GiroDaSorte_Config.Button[ButtonID].x and x <= (GiroDaSorte_Config.Button[ButtonID].x+GiroDaSorte_Config.Button[ButtonID].w) then
		if y >= GiroDaSorte_Config.Button[ButtonID].y and y <= (GiroDaSorte_Config.Button[ButtonID].y+GiroDaSorte_Config.Button[ButtonID].h) then
			return true
		end
	end
	return false
end

function GiroDaSorte.Open()
	CloseWindow(UIInventory)
	CloseWindow(UICharacter)
    UICustomInterface = GiroDaSorte_Config.WindowID
	GiroDaSorte.RecalculateList()
	GiroDaSorte_Config.WasOpen = true
	math.randomseed(os.time()*os.clock()^3)
end

function GiroDaSorte.Close()
 	UICustomInterface = 0
	local packetName = string.format("2-%d-%s", UserGetIndex(), UserGetName())
	CreatePacket(packetName, GiroDaSorte_Config.Packet)
	SendPacket(packetName)
	ClearPacket(packetName)
	GiroDaSorte.Define()
end

function GiroDaSorte.CheckOpen()
    if UICustomInterface == GiroDaSorte_Config.WindowID then return true else return false end
end

function GiroDaSorte.Interface()
    if not GiroDaSorte.CheckOpen() then return end

    local lang = GetLanguage()
    GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.fechar_voltar, 0, 0, 0, 0)
    GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.acessar_girar, 0, 0, 0, 0)
    GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.ok, 0, 0, 0, 0)
    GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.cancelar, 0, 0, 0, 0)
    GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.up, 0, 0, 0, 0)
    GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.down, 0, 0, 0, 0)

	EnableAlphaTest()
	glColor3f(1.0, 1.0, 1.0)
	RenderImage(41003, GiroDaSorte_Config.Window.PosX, GiroDaSorte_Config.Window.PosY, GiroDaSorte_Config.Window.Width, GiroDaSorte_Config.Window.Height)
	RenderImage(41004, GiroDaSorte_Config.Window.PosX + 100, GiroDaSorte_Config.Window.PosY + 1, 199, 18)

	SetFontType(1)
	SetTextBg( 0, 0, 0, 0)
	SetTextColor( 240, 240, 240, 255)
	RenderText3(GiroDaSorte_Config.Window.PosX + 198, GiroDaSorte_Config.Window.PosY + 3, GiroDaSorte_Config.Texts[lang][1], 150, 8)

	DisableAlphaBlend()
	SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.8)
	DrawBar(GiroDaSorte_Config.Window.PosX+31, GiroDaSorte_Config.Window.PosY+37, 155, 245)
	DrawBar(GiroDaSorte_Config.Window.PosX + 214, GiroDaSorte_Config.Window.PosY + 38, 152, 152)
	local posY = GiroDaSorte_Config.Window.PosY + 34 + 4 + 24
	for i = GiroDaSorte_Config.m_ListOffset, GiroDaSorte_Config.m_MaxListID do
		glColor4f(0.5, 0.5, 0.5, 0.4)
		DrawBar(GiroDaSorte_Config.Window.PosX+40, posY, 120, 1)
		if (GiroDaSorte.IsWorkZone(GiroDaSorte_Config.Window.PosX + 40, posY-22, 120, 22)) and not GiroDaSorte_Config.m_Animation and not GiroDaSorte_Config.m_ShowAlertWindow then
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(GiroDaSorte_Config.Window.PosX + 40, posY-24, 120, 24)
        end
		if (GiroDaSorte_Config.m_Animation and i == GiroDaSorte_Config.m_SelectedItemListID) then
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(GiroDaSorte_Config.Window.PosX + 40, posY - 24, 120, 24)
        end
		posY = posY + 24
	end

	glColor4f(0.37, 0.3317, 0.2849, 1.0)
	DrawBar(GiroDaSorte_Config.Window.PosX + 167, GiroDaSorte_Config.Window.PosY + 53, 14, 212)
	glColor4f(0.91, 0.875, 0.8099, 1.0)
	DrawBar(GiroDaSorte_Config.Window.PosX + 168, GiroDaSorte_Config.Window.PosY + 65+GiroDaSorte_Config.Barra.Pos, 12, GiroDaSorte_Config.Barra.Size)
	glColor4f(0.39, 0.3504, 0.3081, 0.6)
	DrawBar(GiroDaSorte_Config.Window.PosX + 169, GiroDaSorte_Config.Window.PosY + 66+GiroDaSorte_Config.Barra.Pos, 10, GiroDaSorte_Config.Barra.Size-2)
	EndDrawBar()
	EnableAlphaTest()
	SetBlend()
	glColor3f(1.0, 1.0, 1.0)

	RenderImage2(41007, GiroDaSorte_Config.Window.PosX + 30, GiroDaSorte_Config.Window.PosY + 34, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)
	for i = 38, 260, 40 do
		RenderImage2(41007 + 1, GiroDaSorte_Config.Window.PosX + 30 +156, GiroDaSorte_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
		RenderImage2(41007 + 1, GiroDaSorte_Config.Window.PosX + 30, GiroDaSorte_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
    end
	RenderImage2(41007, GiroDaSorte_Config.Window.PosX + 30, GiroDaSorte_Config.Window.PosY + 34+ 244, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)

	posY = GiroDaSorte_Config.Window.PosY + 34 + 4 + 9
	SetFontType(0)
	SetTextBg( 0, 0, 0, 0)
	for i = GiroDaSorte_Config.m_ListOffset, GiroDaSorte_Config.m_MaxListID do
		SetTextColor( 240, 240, 240, 255)
		if (GiroDaSorte_Config.m_CurrentPage == 0) then
			if (i == GiroDaSorte_Config.m_SelectedSectionListID) then
				SetTextColor( 0, 180, 230, 255)
            end
			RenderText3( GiroDaSorte_Config.Window.PosX + 50, posY, GiroDaSorte_Config.m_SectionList[i].Name, 111, 1)
		else
			if (i == GiroDaSorte_Config.m_SelectedItemListID) then
				SetTextColor( 0, 180, 230, 255)
            end
			if tonumber(GiroDaSorte_Config.m_ItemList[i].Rate) == 0 then
				if (GiroDaSorte_Config.m_ItemList[i].ItemIndex == 20000) then
					RenderText3( GiroDaSorte_Config.Window.PosX + 50, posY, GiroDaSorte_Config.Texts[lang][22], 111, 1)
				else
					RenderText3( GiroDaSorte_Config.Window.PosX + 50, posY,  string.format("%s", GetNameByIndex(GiroDaSorte_Config.m_ItemList[i].ItemIndex)), 111, 1)
				end
			else
				if (GiroDaSorte_Config.m_ItemList[i].ItemIndex == 20000) then
					RenderText3( GiroDaSorte_Config.Window.PosX + 50, posY, string.format(GiroDaSorte_Config.Texts[lang][2], GiroDaSorte_Config.m_ItemList[i].Rate), 111, 1)
				else
					RenderText3( GiroDaSorte_Config.Window.PosX + 50, posY,  string.format(GiroDaSorte_Config.Texts[lang][3], GetNameByIndex(GiroDaSorte_Config.m_ItemList[i].ItemIndex), GiroDaSorte_Config.m_ItemList[i].Rate), 111, 1)
				end
			end
			
		end
		posY = posY + 24
	end

	RenderImage2(41007, GiroDaSorte_Config.Window.PosX + 210, GiroDaSorte_Config.Window.PosY + 34, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)
	for i = 34, 160, 40 do
		RenderImage2(41007 + 1, GiroDaSorte_Config.Window.PosX + 210, GiroDaSorte_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
		RenderImage2(41007 + 1, GiroDaSorte_Config.Window.PosX + 366, GiroDaSorte_Config.Window.PosY + i, 4, 40, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
    end
	RenderImage2(41007, GiroDaSorte_Config.Window.PosX + 210, GiroDaSorte_Config.Window.PosY + 34+156, 160, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)

	GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.up, GiroDaSorte_Config.Window.PosX + 168, GiroDaSorte_Config.Window.PosY + 53, 13, 12)
	if not GiroDaSorte.ButtonClicked(GiroDaSorte_Config.ButtonID.up) then
		RenderImage2(41052, GiroDaSorte_Config.Window.PosX + 168, GiroDaSorte_Config.Window.PosY + 53, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	else
		RenderImage2(41053, GiroDaSorte_Config.Window.PosX + 168, GiroDaSorte_Config.Window.PosY + 53, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	end

	GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.down, GiroDaSorte_Config.Window.PosX + 168, GiroDaSorte_Config.Window.PosY + 252, 13, 12)
	if not GiroDaSorte.ButtonClicked(GiroDaSorte_Config.ButtonID.down) then
		RenderImage2(41050, GiroDaSorte_Config.Window.PosX + 168, GiroDaSorte_Config.Window.PosY + 252, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	else
		RenderImage2(41051, GiroDaSorte_Config.Window.PosX + 168, GiroDaSorte_Config.Window.PosY + 252, 13, 12, 0.0, 0.0, 0.687676, 0.687676, 1, 1, 1.0)
	end

	GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.acessar_girar, GiroDaSorte_Config.Window.PosX+235, GiroDaSorte_Config.Window.PosY+210, 110, 25)
	RenderImage2(41006, GiroDaSorte_Config.Window.PosX+235, GiroDaSorte_Config.Window.PosY+210, 110, 25, 0.0, 0.0, 0.8322874124, 1.0, 1, 1, 1.0)
	if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.acessar_girar, MousePosX(), MousePosY()) then
		if not GiroDaSorte.ButtonClicked(GiroDaSorte_Config.ButtonID.acessar_girar) then
			DisableAlphaBlend()
			SetBlend()
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(GiroDaSorte_Config.Window.PosX+235, GiroDaSorte_Config.Window.PosY+210, 110, 25)
			SetBlend()
			EndDrawBar()
			EnableAlphaTest()
		end
	end

	GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.fechar_voltar, GiroDaSorte_Config.Window.PosX+235, GiroDaSorte_Config.Window.PosY+245, 110, 25)
	RenderImage2(41006, GiroDaSorte_Config.Window.PosX+235, GiroDaSorte_Config.Window.PosY+245, 110, 25, 0.0, 0.0, 0.8322874124, 1.0, 1, 1, 1.0)
	if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.fechar_voltar, MousePosX(), MousePosY()) then
		if not GiroDaSorte.ButtonClicked(GiroDaSorte_Config.ButtonID.fechar_voltar) then
			DisableAlphaBlend()
			SetBlend()
			glColor4f(0.5, 0.5, 0.5, 0.2)
			DrawBar(GiroDaSorte_Config.Window.PosX+235, GiroDaSorte_Config.Window.PosY+245, 110, 25)
			SetBlend()
			EndDrawBar()
			EnableAlphaTest()
		end
	end

	if (GiroDaSorte_Config.m_CurrentPage == 0) then
		SetFontType(1)
		SetTextBg( 0, 0, 0, 0)
		SetTextColor( 240, 240, 240, 255)
		RenderText3((GiroDaSorte_Config.Window.PosX+235+(110/2)), (GiroDaSorte_Config.Window.PosY+210+((25/2)-3)), GiroDaSorte_Config.Texts[lang][13], 110, 8)
		RenderText3((GiroDaSorte_Config.Window.PosX+235+(110/2)), (GiroDaSorte_Config.Window.PosY+245+((25/2)-3)), GiroDaSorte_Config.Texts[lang][14], 110, 8)

		SetFontType(1)
		SetTextBg( 0, 0, 0, 0)
		SetTextColor( 0, 180, 230, 255)
		RenderText3( GiroDaSorte_Config.Window.PosX + 290, GiroDaSorte_Config.Window.PosY+50, GiroDaSorte_Config.m_SectionList[GiroDaSorte_Config.m_SelectedSectionListID].Name, 160, 8)


		SetTextColor( 240, 176, 2, 255)
		RenderText3( GiroDaSorte_Config.Window.PosX + 290, GiroDaSorte_Config.Window.PosY+75, GiroDaSorte_Config.Texts[lang][4], 160, 8)
		SetFontType(0)
		SetTextColor( 240, 240, 240, 255)
		RenderText3( GiroDaSorte_Config.Window.PosX + 290, GiroDaSorte_Config.Window.PosY+85, GiroDaSorte_Config.m_SectionList[GiroDaSorte_Config.m_SelectedSectionListID].Availability, 160, 8)

		SetFontType(1)
		SetTextColor( 240, 176, 2, 255)
		RenderText3( GiroDaSorte_Config.Window.PosX + 290, GiroDaSorte_Config.Window.PosY + 110, GiroDaSorte_Config.Texts[lang][5], 160, 8)

		SetFontType(0)
		SetTextColor( 240, 240, 240, 255)
		local costPosY = GiroDaSorte_Config.Window.PosY + 120
		for c = 1, #GiroDaSorte_Config.m_SectionList[GiroDaSorte_Config.m_SelectedSectionListID].Cost do
			RenderText3( GiroDaSorte_Config.Window.PosX + 290, costPosY, string.format(GiroDaSorte_Config.Texts[lang][6], GiroDaSorte_Config.m_SectionList[GiroDaSorte_Config.m_SelectedSectionListID].Cost[c].Value, GiroDaSorte_Config.m_SectionList[GiroDaSorte_Config.m_SelectedSectionListID].Cost[c].Nome), 160, 8)
			costPosY = costPosY + 10
		end
	else
        SetFontType(1)
		SetTextBg( 0, 0, 0, 0)
		SetTextColor( 240, 240, 240, 255)
		RenderText3((GiroDaSorte_Config.Window.PosX+235+(110/2)), (GiroDaSorte_Config.Window.PosY+210+((25/2)-3)), GiroDaSorte_Config.Texts[lang][15], 110, 8)
		RenderText3((GiroDaSorte_Config.Window.PosX+235+(110/2)), (GiroDaSorte_Config.Window.PosY+245+((25/2)-3)), GiroDaSorte_Config.Texts[lang][16], 110, 8)

		if (GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].ItemIndex ~= 20000) then
			CreateItem(GiroDaSorte_Config.Window.PosX + 270 + GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].PosX, GiroDaSorte_Config.Window.PosY + 90 + GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].PosY, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Width, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Height, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].ItemIndex, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Level, 0, 0, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Size)
			if (GiroDaSorte.IsWorkZone(GiroDaSorte_Config.Window.PosX + 270 + GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].PosX, GiroDaSorte_Config.Window.PosY + 90 + GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].PosY, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Width, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Height) and not GiroDaSorte_Config.m_Animation) then
				ShowItemDescription(MousePosX() + 100, MousePosY() + 10, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].ItemIndex, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Level, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Skill, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Luck, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].JoL, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Dur, GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_SelectedItemListID].Exc, 0)
            end
		else
			SetFontType(1)
			SetTextBg( 0, 0, 0, 0)
			SetTextColor( 240, 176, 2, 255)
			RenderText3( GiroDaSorte_Config.Window.PosX + 290, GiroDaSorte_Config.Window.PosY + 75, GiroDaSorte_Config.Texts[lang][10], 160, 8)
			SetFontType(0)
			SetTextColor( 240, 240, 240, 255)
			RenderText3( GiroDaSorte_Config.Window.PosX + 290, GiroDaSorte_Config.Window.PosY + 95, GiroDaSorte_Config.Texts[lang][11], 160, 8)
			RenderText3( GiroDaSorte_Config.Window.PosX + 290, GiroDaSorte_Config.Window.PosY + 105, GiroDaSorte_Config.Texts[lang][12], 160, 8)
        end

		if (GiroDaSorte_Config.m_Animation) then
			local currentTime = os.time()
			local elapsedtime = currentTime - GiroDaSorte_Config.m_AnimationStartTime
			GiroDaSorte_Config.m_SelectedItemListID = math.random(1, #GiroDaSorte_Config.m_ItemList)
			if (elapsedtime >= 3) then
				GiroDaSorte_Config.m_Animation = false
				GiroDaSorte_Config.m_SelectedItemListID = GiroDaSorte_Config.m_WinnerItemListID
				if GiroDaSorte_Config.m_WinnerItemListID ~= -1 then
					if GiroDaSorte_Config.m_ItemList[GiroDaSorte_Config.m_WinnerItemListID].ItemIndex ~= 20000 then
						GiroDaSorte_Config.m_WinnerItemListID = -1
						GiroDaSorte_Config.m_AlertWindowType = 3
						GiroDaSorte_Config.m_ShowAlertWindow = true
					end
				end
			end
		end
	end
	if not GiroDaSorte_Config.m_ShowAlertWindow then
		return
    end

	DisableAlphaBlend()
	
	SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.7)
	DrawBar(GiroDaSorte_Config.Window.PosX, GiroDaSorte_Config.Window.PosY, GiroDaSorte_Config.Window.Width, GiroDaSorte_Config.Window.Height)

	EndDrawBar()
	DisableAlphaBlend()
	EnableAlphaTest()

	RenderImage2(41007, GiroDaSorte_Config.Window.PosX + 85, GiroDaSorte_Config.Window.PosY + 6, 225, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)
	RenderImage2(41010, GiroDaSorte_Config.Window.PosX + 85, GiroDaSorte_Config.Window.PosY + 39, 225, 30, 0.0, 0.0, 0.8322874124, 0.6042874124, 1, 1, 1.0)
	RenderImage2(41010, GiroDaSorte_Config.Window.PosX + 85, GiroDaSorte_Config.Window.PosY + 10, 225, 30, 0.0, 0.0, 0.8322874124, 0.6042874124, 1, 1, 1.0)
	RenderImage2(41007, GiroDaSorte_Config.Window.PosX + 85, GiroDaSorte_Config.Window.PosY + 68, 225, 4, 0, 0, 0.83203125, 0.625, 1, 1, 1.0)

	SetFontType(0)
	SetTextBg( 0, 0, 0, 0)
	SetTextColor( 240, 240, 240, 255)

	if GiroDaSorte_Config.m_AlertWindowType == 1 then
		RenderText3( GiroDaSorte_Config.Window.PosX + 200, GiroDaSorte_Config.Window.PosY+15, GiroDaSorte_Config.Texts[lang][17], 160, 8)
		RenderText3( GiroDaSorte_Config.Window.PosX + 200, GiroDaSorte_Config.Window.PosY+25, GiroDaSorte_Config.Texts[lang][18], 160, 8)
    elseif GiroDaSorte_Config.m_AlertWindowType == 2 then
		RenderText3( GiroDaSorte_Config.Window.PosX + 200, GiroDaSorte_Config.Window.PosY + 20, GiroDaSorte_Config.Texts[lang][19], 160, 8)
    elseif GiroDaSorte_Config.m_AlertWindowType == 3 then
		RenderText3( GiroDaSorte_Config.Window.PosX + 200, GiroDaSorte_Config.Window.PosY + 15, GiroDaSorte_Config.Texts[lang][20], 160, 8)
		RenderText3( GiroDaSorte_Config.Window.PosX + 200, GiroDaSorte_Config.Window.PosY + 25, GiroDaSorte_Config.Texts[lang][21], 160, 8)
	end

	if GiroDaSorte_Config.m_AlertWindowType == 1 then
        GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.ok, 240, 125, 60, 18)
        if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.ok, MousePosX(), MousePosY()) then
            RenderImage2(41011, 240, 125, 60, 18, 0.00688282, 0.313344848, 0.538486151, 0.333344848, 1, 1, 1.0)
        else
            RenderImage2(41011, 240, 125, 60, 18, 0.00688282, 0.002127840, 0.538486151, 0.323344848, 1, 1, 1.0)
        end

		GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.cancelar, 340, 125, 60, 18)
        RenderImage2(41012, 340, 125, 60, 18, 0.00688282, 0.002127840, 0.538486151, 0.323344848, 1, 1, 1.0)
        if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.cancelar, MousePosX(), MousePosY()) then
            RenderImage2(41012, 340, 125, 60, 18, 0.00688282, 0.313344848, 0.538486151, 0.333344848, 1, 1, 1.0)
        end
    else
		GiroDaSorte.CreateButton(GiroDaSorte_Config.ButtonID.ok, 290, 125, 60, 18)
        RenderImage2(41011, 290, 125, 60, 18, 0.00688282, 0.002127840, 0.538486151, 0.323344848, 1, 1, 1.0)
        if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.ok, MousePosX(), MousePosY()) then
            RenderImage2(41011, 290, 125, 60, 18, 0.00688282, 0.313344848, 0.538486151, 0.333344848, 1, 1, 1.0)
        end
	end

	DisableAlphaBlend()
end

function GiroDaSorte.UpdateMouse()
	if not GiroDaSorte.CheckOpen() then return end
    
	DisableClickClient()

	if CheckPressedKey(Keys.LButton) == 1 and not GiroDaSorte_Config.m_LockInterface then
		if GiroDaSorte_Config.m_Animation then return end
			
		if GiroDaSorte_Config.m_ShowAlertWindow then
			if GiroDaSorte_Config.m_AlertWindowType == 1 then
				if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.ok, MousePosX(), MousePosY()) then
					GiroDaSorte_Config.m_LockInterface = true
					GiroDaSorte_Config.m_ShowAlertWindow = false
					GiroDaSorte.SendSpin()
				end
				if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.cancelar, MousePosX(), MousePosY()) then
					GiroDaSorte_Config.m_ShowAlertWindow = false
				end
			else
				if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.ok, MousePosX(), MousePosY()) then
					GiroDaSorte_Config.m_ShowAlertWindow = false
				end
			end
			return
		end

		
		local posY = GiroDaSorte_Config.Window.PosY + 34 + 4
		for i = GiroDaSorte_Config.m_ListOffset, GiroDaSorte_Config.m_MaxListID do
			if GiroDaSorte.IsWorkZone(GiroDaSorte_Config.Window.PosX + 29, posY + 2, 120, 22) then
				if (GiroDaSorte_Config.m_CurrentPage == 0) then
					GiroDaSorte_Config.m_SelectedSectionListID = i
				else 
					GiroDaSorte_Config.m_SelectedItemListID = i
				end
				return
			end
			posY = posY + 24
		end

		if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.up, MousePosX(), MousePosY()) then
			GiroDaSorte_Config.Button[GiroDaSorte_Config.ButtonID.up].clicked = true
			if GiroDaSorte_Config.m_ListOffset <= 1 then
				return
			end
			GiroDaSorte_Config.Barra.Offset = GiroDaSorte_Config.Barra.Offset - 1
			GiroDaSorte_Config.Barra.Pos = GiroDaSorte_Config.Barra.Pos - GiroDaSorte_Config.Barra.Multiplier
			GiroDaSorte_Config.m_ListOffset = GiroDaSorte_Config.m_ListOffset - 1
			GiroDaSorte_Config.m_MaxListID = GiroDaSorte_Config.m_MaxListID - 1
			return
		end
		if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.down, MousePosX(), MousePosY()) then
			GiroDaSorte_Config.Button[GiroDaSorte_Config.ButtonID.down].clicked = true
			if GiroDaSorte_Config.m_CurrentPage == 0 then
				if GiroDaSorte_Config.m_MaxListID >= #GiroDaSorte_Config.m_SectionList then return end
			else 
				if GiroDaSorte_Config.m_MaxListID >= #GiroDaSorte_Config.m_ItemList then return end
			end
			GiroDaSorte_Config.Barra.Offset = GiroDaSorte_Config.Barra.Offset + 1
			GiroDaSorte_Config.Barra.Pos = GiroDaSorte_Config.Barra.Pos + GiroDaSorte_Config.Barra.Multiplier
			GiroDaSorte_Config.m_ListOffset = GiroDaSorte_Config.m_ListOffset + 1
			GiroDaSorte_Config.m_MaxListID = GiroDaSorte_Config.m_MaxListID + 1
			return
		end
		if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.acessar_girar, MousePosX(), MousePosY()) then
			GiroDaSorte_Config.Button[GiroDaSorte_Config.ButtonID.acessar_girar].clicked = true
			if (GiroDaSorte_Config.m_CurrentPage == 0) then
				GiroDaSorte_Config.m_LockInterface = true
				GiroDaSorte.SendAccessList()
			else
				GiroDaSorte_Config.m_AlertWindowType = 1
				GiroDaSorte_Config.m_ShowAlertWindow = true
			end
			return
		end

		if GiroDaSorte.ButtonMouseOver(GiroDaSorte_Config.ButtonID.fechar_voltar, MousePosX(), MousePosY()) then
			GiroDaSorte_Config.Button[GiroDaSorte_Config.ButtonID.fechar_voltar].clicked = true
			if (GiroDaSorte_Config.m_CurrentPage == 0) then
				GiroDaSorte.Close()
			else
				GiroDaSorte_Config.m_CurrentPage = 0
				GiroDaSorte_Config.m_SelectedSectionListID = 1
				GiroDaSorte.RecalculateList()
			end		
		end
	end
end

function GiroDaSorte.UpdateKey()
	if not GiroDaSorte.CheckOpen() then
		if CheckReleasedKey(Keys.Escape) == 1 and GiroDaSorte_Config.WasOpen then
			UICustomInterface = GiroDaSorte_Config.WindowID
		end
		return 
	end

    if CheckWindowOpen(UIChatWindow) == 1 or CheckWindowOpen(UIStore) == 1 or CheckWindowOpen(UIGuildNpc) == 1 then return end
	
	if CheckPressedKey(Keys.Return) == 1 then return end
	
	DisableClickClient()
	
	if GiroDaSorte_Config.m_LockInterface then return end

	if GiroDaSorte_Config.m_Animation then return end

	if CheckPressedKey(Keys.Escape) == 1 then
		if (GiroDaSorte_Config.m_ShowAlertWindow) then
			GiroDaSorte_Config.m_ShowAlertWindow = false
		else
			GiroDaSorte.Close()
		end
	end
end

function GiroDaSorte.ScrollMouse(direction)
	if not GiroDaSorte.CheckOpen() then return end

	if not GiroDaSorte.IsWorkZone(GiroDaSorte_Config.Window.PosX + 21, GiroDaSorte_Config.Window.PosY + 37, 155, 245) or GiroDaSorte_Config.m_Animation or GiroDaSorte_Config.m_LockInterface then return end

	if (direction > 0) then
		if GiroDaSorte_Config.m_ListOffset <= 1 then
			return
		end
		GiroDaSorte_Config.Barra.Offset = GiroDaSorte_Config.Barra.Offset - 1
		GiroDaSorte_Config.Barra.Pos = GiroDaSorte_Config.Barra.Pos - GiroDaSorte_Config.Barra.Multiplier
		GiroDaSorte_Config.m_ListOffset = GiroDaSorte_Config.m_ListOffset - 1
		GiroDaSorte_Config.m_MaxListID = GiroDaSorte_Config.m_MaxListID - 1
	else
		if GiroDaSorte_Config.m_CurrentPage == 0 then
			if GiroDaSorte_Config.m_MaxListID >= #GiroDaSorte_Config.m_SectionList then return end
		else 
			if GiroDaSorte_Config.m_MaxListID >= #GiroDaSorte_Config.m_ItemList then return end
		end
		GiroDaSorte_Config.Barra.Offset = GiroDaSorte_Config.Barra.Offset + 1
		GiroDaSorte_Config.Barra.Pos = GiroDaSorte_Config.Barra.Pos + GiroDaSorte_Config.Barra.Multiplier
		GiroDaSorte_Config.m_ListOffset = GiroDaSorte_Config.m_ListOffset + 1
		GiroDaSorte_Config.m_MaxListID = GiroDaSorte_Config.m_MaxListID + 1
	end
end

function GiroDaSorte.IsWorkZone(x, y, w, h)
	if MousePosX() >= x and MousePosX() <= x + w and MousePosY() >= y and MousePosY() <= y + h then
		return true
    end
	return false
end

function GiroDaSorte.RecalculateList()
	GiroDaSorte_Config.m_ListOffset = 1
	GiroDaSorte_Config.Barra.Offset = 0
	GiroDaSorte_Config.Barra.Pos = 0
	
	if (GiroDaSorte_Config.m_CurrentPage == 0) then
		if #GiroDaSorte_Config.m_SectionList > 10 then
			GiroDaSorte_Config.m_MaxListID = 10
		else
			GiroDaSorte_Config.m_MaxListID = #GiroDaSorte_Config.m_SectionList
		end

		if #GiroDaSorte_Config.m_SectionList > 10 then
			GiroDaSorte_Config.Barra.MaxOffset = #GiroDaSorte_Config.m_SectionList - 10
			GiroDaSorte_Config.Barra.Size = (GiroDaSorte_Config.Barra.InitSize - ((#GiroDaSorte_Config.m_SectionList - 10) * 10))
			if (GiroDaSorte_Config.Barra.Size < 10) then
				GiroDaSorte_Config.Barra.Size = 10
			end
		else
			GiroDaSorte_Config.Barra.Size = GiroDaSorte_Config.Barra.InitSize
		end
		GiroDaSorte_Config.Barra.Esp = GiroDaSorte_Config.Barra.InitEsp - GiroDaSorte_Config.Barra.Size
		GiroDaSorte_Config.Barra.Multiplier = GiroDaSorte_Config.Barra.Esp / (#GiroDaSorte_Config.m_SectionList - 10)
	else
		if #GiroDaSorte_Config.m_ItemList > 10 then
			GiroDaSorte_Config.m_MaxListID = 10
		else
			GiroDaSorte_Config.m_MaxListID = #GiroDaSorte_Config.m_ItemList
		end
	
		if #GiroDaSorte_Config.m_ItemList > 10 then
			GiroDaSorte_Config.Barra.MaxOffset = #GiroDaSorte_Config.m_ItemList - 10
			GiroDaSorte_Config.Barra.Size = (GiroDaSorte_Config.Barra.InitSize - ((#GiroDaSorte_Config.m_ItemList - 10) * 10))
			if (GiroDaSorte_Config.Barra.Size < 10) then
				GiroDaSorte_Config.Barra.Size = 10
			end		
		else 
			GiroDaSorte_Config.Barra.Size = GiroDaSorte_Config.Barra.InitSize
		end
		GiroDaSorte_Config.Barra.Esp = GiroDaSorte_Config.Barra.InitEsp - GiroDaSorte_Config.Barra.Size
		GiroDaSorte_Config.Barra.Multiplier = GiroDaSorte_Config.Barra.Esp / (#GiroDaSorte_Config.m_ItemList - 10)
	end
end

function GiroDaSorte.Protocol(Packet, PacketName)
	if Packet ~= GiroDaSorte_Config.Packet then return false end

	local aIndex = UserGetIndex()
	local name = UserGetName()

	if PacketName == string.format("1-%d-%s", aIndex, name) then
		GiroDaSorte_Config.m_SectionList = {}
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
        
			table.insert(GiroDaSorte_Config.m_SectionList, {ListID = listID, Name = nome, Cost = custo, Availability = availability})
    	end
		ClearPacket(PacketName)
		GiroDaSorte_Config.m_SelectedSectionListID = 1
		GiroDaSorte_Config.m_CurrentPage = 0
		GiroDaSorte.Open()
		return true
	end

	if PacketName == string.format("3-%d-%s", aIndex, name) then
		GiroDaSorte_Config.m_ItemList = {}
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
    	   local len = GetBytePacket(PacketName,-1)
		   local rate = GetCharPacketLength(PacketName, -1, len)
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

		   table.insert(GiroDaSorte_Config.m_ItemList, {ListID = c, ItemIndex = itemIndex, Level = level, Dur = dur, Skill = skill, Luck = luck, JoL = jol, Exc = exc, Days = days, Rate = rate, PosX = posx, PosY = posy, Width = width, Height = height, Size = size})
    	end
		ClearPacket(PacketName)
		GiroDaSorte_Config.m_SelectedItemListID = 1
		GiroDaSorte_Config.m_CurrentPage = 1
		GiroDaSorte.RecalculateList()
		GiroDaSorte_Config.m_LockInterface = false
		return true
	end

	if PacketName == string.format("5-%d-%s", aIndex, name) then
		ClearPacket(PacketName)
		GiroDaSorte_Config.m_AlertWindowType = 2
		GiroDaSorte_Config.m_ShowAlertWindow = true
		GiroDaSorte_Config.m_LockInterface = false
		return true
	end

	if PacketName == string.format("7-%d-%s", aIndex, name) then
		GiroDaSorte_Config.m_WinnerItemListID = GetBytePacket(PacketName, -1)
		ClearPacket(PacketName)
		GiroDaSorte_Config.m_LockInterface = false
		GiroDaSorte_Config.m_Animation = true
		GiroDaSorte_Config.m_AnimationStartTime = os.time()
		return true
	end

end

function GiroDaSorte.SendSpin()
	local packetName = string.format("6-%d-%s", UserGetIndex(), UserGetName())
	CreatePacket(packetName, GiroDaSorte_Config.Packet)
	SetBytePacket(packetName, GiroDaSorte_Config.m_SelectedSectionListID)
	SendPacket(packetName)
	ClearPacket(packetName)
end

function GiroDaSorte.SendAccessList()
	local packetName = string.format("4-%d-%s", UserGetIndex(), UserGetName())
	CreatePacket(packetName, GiroDaSorte_Config.Packet)
	SetBytePacket(packetName, GiroDaSorte_Config.m_SelectedSectionListID)
	SendPacket(packetName)
	ClearPacket(packetName)
end

GiroDaSorte.Init()

return GiroDaSorte
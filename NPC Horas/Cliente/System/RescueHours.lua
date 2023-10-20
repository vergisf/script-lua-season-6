NPCHoras = {}

--#region REGISTRA FUNÇÕES DO SISTEMA
function NPCHoras.Init()
	InterfaceController.BeforeMainProc(NPCHoras.Interface)
	InterfaceController.MainProc(NPCHoras.AfterInterface)
	InterfaceController.ClientProtocol(NPCHoras.Protocol)
	InterfaceController.MainProcWorldKey(NPCHoras.KeyListener)
	InterfaceController.InterfaceClickEvent(NPCHoras.ClickEvent)
	InterfaceController.ScrollMouse(NPCHoras.ScrollMouse)
	InterfaceController.UpdateMouse(NPCHoras.UpdateMouse)


	NPCHoras.Define()
end
--#endregion

--#region DEFINE VARIAVEIS
function NPCHoras.Define()
	NPCHoras_Config.Saldo = 0
	NPCHoras_Config.WorkArea = {X1 = 260, X2 = 450, Y1 = 0, Y2 = 429}
	NPCHoras_Config.WindowOffset = 0
	NPCHoras_Config.AlertWindow = {Show = false, Type = 0}	
	NPCHoras_Config.ShortLista = {}
	NPCHoras_Config.ShortListaConfig = {Offset = 0, Count = 4, Steps = 0, CurrentStep = 0, Selected = {}}
	NPCHoras_Config.Area = {sx = 260, ex = 450}
	NPCHoras_Config.Button = {}
	NPCHoras_Config.ButtonID = {
		fechar = 1,
		acessar = 2,
		ok = 3,
		cancel = 4
	}
end
--#endregion

--#region ABRE A JANELA
function NPCHoras.Open()
	if	CheckWindowOpen(UIFriendList)		== 1	then	return							end
	if	CheckWindowOpen(UIMoveList)			== 1	then	return							end
	if	CheckWindowOpen(UIParty)			== 1	then	CloseWindow(UIParty)			end
	if	CheckWindowOpen(UIQuest)			== 1	then	return							end
	if	CheckWindowOpen(UIGuild)			== 1	then	CloseWindow(UIGuild)			end
	if	CheckWindowOpen(UIGuildNpc)			== 1	then	CloseWindow(UIGuild)			end
	if	CheckWindowOpen(UITrade)			== 1	then	return							end
	if	CheckWindowOpen(UIWarehouse)		== 1	then	return							end
	if	CheckWindowOpen(UIChaosBox)			== 1	then	return							end
	if	CheckWindowOpen(UICommandWindow)	== 1	then	return							end
	if	CheckWindowOpen(UIPetInfo)			== 1	then	return							end
	if	CheckWindowOpen(UIShop)				== 1	then	return							end
	if	CheckWindowOpen(UIStore)			== 1	then	CloseWindow(UIStore)			end
	if	CheckWindowOpen(UIOtherStore)		== 1	then	return							end
	if	CheckWindowOpen(UICharacter)		== 1	then	CloseWindow(UICharacter)		end
	if	CheckWindowOpen(UIOptions)			== 1	then	return							end
	if	CheckWindowOpen(UIHelp)				== 1	then	return							end
	if	CheckWindowOpen(UIFastDial)			== 1	then	return							end
	if	CheckWindowOpen(UISkillTree)		== 1	then	return							end
	if	CheckWindowOpen(UINPC_Titus)		== 1	then	return							end
	if	CheckWindowOpen(UICashShop)			== 1	then	return							end
	if	CheckWindowOpen(UIFullMap)			== 1	then	return							end
	if	CheckWindowOpen(UINPC_Dialog)		== 1	then	return							end
	if	CheckWindowOpen(UIGensInfo)			== 1	then	CloseWindow(UIGensInfo)			end
	if	CheckWindowOpen(UINPC_Julia)		== 1	then	return							end
	if	CheckWindowOpen(UIExpandInventory)	== 1	then	CloseWindow(UIExpandInventory)	end
	if	CheckWindowOpen(UIExpandWarehouse)	== 1	then	return							end
	if	CheckWindowOpen(UIMuHelper)			== 1	then	CloseWindow(UIMuHelper)			end
	OpenWindow(UIInventory)
	UICustomInterface = NPCHoras_Config.WindowID
end
--#endregion

--#region FECHA A JANELA
function NPCHoras.Close()
	CloseWindow(UIInventory)
	UICustomInterface = 0
	NPCHoras.Define()
	local pname = string.format("2-%s-%d", UserGetName(), UserGetIndex())
	CreatePacket(pname, NPCHoras_Config.Packet)
	SendPacket(pname)
	ClearPacket(pname)
end
--#endregion

--#region VERIFICA JANELA ABERTA E AREA PROTEGIDA DA TELA
function NPCHoras.CheckOpen()
	if UICustomInterface == NPCHoras_Config.WindowID then return true else return false end
end

function NPCHoras.CheckArea(x)
	if x >= NPCHoras_Config.Area.sx-NPCHoras_Config.WindowOffset and x <= NPCHoras_Config.Area.ex-NPCHoras_Config.WindowOffset then
		return true
	end
	return false
end
--#endregion

--#region FUNÇÕES DE BOTÃO
function NPCHoras.CreateButton(ButtonID, x, y, w, h)
	if NPCHoras_Config.Button[ButtonID] == nil then
		table.insert(NPCHoras_Config.Button, ButtonID)
		NPCHoras_Config.Button[ButtonID] = {
			x = x,
			y = y,
			w = w,
			h = h,
			clicked = false,
			timer = 0
		}
	else
		NPCHoras_Config.Button[ButtonID].x = x
		NPCHoras_Config.Button[ButtonID].y = y
		NPCHoras_Config.Button[ButtonID].w = w
		NPCHoras_Config.Button[ButtonID].h = h
	end
end

function NPCHoras.ButtonClicked(ButtonID)
	if NPCHoras_Config.Button[ButtonID] == nil then return false end
	if NPCHoras_Config.Button[ButtonID].clicked then
		if NPCHoras_Config.Button[ButtonID].timer >= 2 then
			NPCHoras_Config.Button[ButtonID].timer = 0
			NPCHoras_Config.Button[ButtonID].clicked = false
			return false
		end
		NPCHoras_Config.Button[ButtonID].timer = NPCHoras_Config.Button[ButtonID].timer + 1
		return true
	end
	return false
end

function NPCHoras.ButtonMouseOver(ButtonID, x, y)
	if NPCHoras_Config.Button[ButtonID] == nil then return false end
	if x >= NPCHoras_Config.Button[ButtonID].x and x <= (NPCHoras_Config.Button[ButtonID].x+NPCHoras_Config.Button[ButtonID].w) then
		if y >= NPCHoras_Config.Button[ButtonID].y and y <= (NPCHoras_Config.Button[ButtonID].y+NPCHoras_Config.Button[ButtonID].h) then
			return true
		end
	end
	return false
end
--#endregion

--#region BARRA DE ROLAGEM ITENS
function NPCHoras.GerarScrollBarItem()
	NPCHoras_Config.ShortListaConfig.Steps = #NPCHoras_Config.Brindes-#NPCHoras_Config.ShortLista
end

function NPCHoras.GerarListaItem()
	local count = 1

	NPCHoras_Config.ShortLista = {}
	for i in ipairs(NPCHoras_Config.Brindes) do
		if i > NPCHoras_Config.ShortListaConfig.Offset then
			if count <= NPCHoras_Config.ShortListaConfig.Count then
				table.insert(NPCHoras_Config.ShortLista, NPCHoras_Config.Brindes[i])
				count = count + 1
			end
		end
	end
end
--#endregion

--#region INTERFACE AFTER
function NPCHoras.AfterInterface()
	if not NPCHoras.CheckOpen() then return end
	NPCHoras.CreateButton(NPCHoras_Config.ButtonID.ok, 0, 0, 0,0)
	NPCHoras.CreateButton(NPCHoras_Config.ButtonID.cancel, 0, 0, 0,0)
	--#region Check outras interfaces
	if	CheckWindowOpen(UIInventory) 		== 0	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIFriendList) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIMoveList)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIParty) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIQuest) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIGuild) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIGuildNpc) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UITrade) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIWarehouse) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIChaosBox)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UICommandWindow) 	== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIPetInfo)	 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIShop)				== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIStore) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIOtherStore) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UICharacter) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIOptions) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIHelp)				== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIFastDial)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UISkillTree) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UINPC_Titus) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UICashShop)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIFullMap) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UINPC_Dialog)		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIGensInfo)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UINPC_Julia)		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIExpandInventory)	== 1	then	NPCHoras_Config.WindowOffset = 190 else NPCHoras_Config.WindowOffset = 0	end
	if	CheckWindowOpen(UIExpandWarehouse)	== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIMuHelper)			== 1	then	NPCHoras.Close()	end
	--#endregion


	DisableAlphaBlend()

	if NPCHoras_Config.ShortListaConfig.Selected.ListID ~= nil then
		CreateItem(NPCHoras_Config.ShortListaConfig.Selected.Pos.X-NPCHoras_Config.WindowOffset, NPCHoras_Config.ShortListaConfig.Selected.Pos.Y, NPCHoras_Config.ShortListaConfig.Selected.Pos.W, NPCHoras_Config.ShortListaConfig.Selected.Pos.H, GET_ITEM(NPCHoras_Config.ShortListaConfig.Selected.Grupo, NPCHoras_Config.ShortListaConfig.Selected.Id), NPCHoras_Config.ShortListaConfig.Selected.Level, 0, 0)
		EndDrawBar()
		if NPCHoras_Config.ShortListaConfig.Selected.ShowDescription then
			if MousePosX() >= NPCHoras_Config.ShortListaConfig.Selected.Pos.X and MousePosX() <= NPCHoras_Config.ShortListaConfig.Selected.Pos.X+NPCHoras_Config.ShortListaConfig.Selected.Pos.W then
				if MousePosY() >= NPCHoras_Config.ShortListaConfig.Selected.Pos.Y and MousePosY() <= NPCHoras_Config.ShortListaConfig.Selected.Pos.Y+NPCHoras_Config.ShortListaConfig.Selected.Pos.H then
					SetBlend()
					ShowItemDescription(MousePosX(), MousePosY(), GET_ITEM(NPCHoras_Config.ShortListaConfig.Selected.Grupo, NPCHoras_Config.ShortListaConfig.Selected.Id), NPCHoras_Config.ShortListaConfig.Selected.Level, NPCHoras_Config.ShortListaConfig.Selected.Skill, NPCHoras_Config.ShortListaConfig.Selected.Luck, NPCHoras_Config.ShortListaConfig.Selected.Opt, NPCHoras_Config.ShortListaConfig.Selected.Dur, NPCHoras_Config.ShortListaConfig.Selected.Exc, 0)
					EndDrawBar()
				end
			end
		end
	end

	EnableAlphaTest()


	if NPCHoras_Config.AlertWindow.Show then
		RenderImage2(31137, 195, 70, 250, 90, 0, 0, 0.83, 1, 1, 1, 1.0)
		SetFontType(0)			
		SetTextBg(0, 0, 0, 0)				
		SetTextColor(255, 255, 255, 255)

		if NPCHoras_Config.AlertWindow.Type == 0 then
			-- ALERTA CONFIRMAÇÃO
			NPCHoras.CreateButton(NPCHoras_Config.ButtonID.ok, 245, 120, 42, 20)			
			if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.ok, MousePosX(), MousePosY()) then
				RenderImage2(31503, 245, 120, 50, 20,0,0, 1.0, 1.0,1,1, 1.0)
			else
				RenderImage2(31502, 245, 120, 50, 20,0,0, 1.0, 1.0,1,1, 1.0)
			end

			NPCHoras.CreateButton(NPCHoras_Config.ButtonID.cancel, 305, 120, 45, 20)			
			if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.cancel, MousePosX(), MousePosY()) then
				RenderImage2(0X7A5C, 305, 120, 45, 19, 0, 0.2334770489476, 0.83885612414, 0.2364770489476,1,1, 1.0)
			else
				RenderImage2(0X7A5C, 305, 120, 45, 19, 0, 0, 0.83885612414, 0.2364770489476,1,1, 1.0)
			end

			RenderText3(302, 90, string.format(NPCHoras_Config.Texts[GetLanguage()][11], NPCHoras_Config.ShortListaConfig.Selected.Valor), 200, 8)
			RenderText3(302, 100, NPCHoras_Config.Texts[GetLanguage()][12], 200, 8)
		else

			NPCHoras.CreateButton(NPCHoras_Config.ButtonID.ok, 278, 120, 42, 20)			
			if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.ok, MousePosX(), MousePosY()) then
				RenderImage2(31503, 278, 120, 50, 20,0,0, 1.0, 1.0,1,1, 1.0)
			else
				RenderImage2(31502, 278, 120, 50, 20,0,0, 1.0, 1.0,1,1, 1.0)
			end
					
			if NPCHoras_Config.AlertWindow.Type == 1 then -- sucesso
				RenderText3(302, 100, string.format(NPCHoras_Config.Texts[GetLanguage()][13]), 200, 8)
			end
			if NPCHoras_Config.AlertWindow.Type == 2 then --  erro config
				RenderText3(302, 100, string.format(NPCHoras_Config.Texts[GetLanguage()][14]), 200, 8)
			end
			if NPCHoras_Config.AlertWindow.Type == 3 then -- falta saldo
				RenderText3(302, 100, string.format(NPCHoras_Config.Texts[GetLanguage()][16]), 200, 8)
			end
			if NPCHoras_Config.AlertWindow.Type == 4 then -- falta espaço
				RenderText3(302, 100, string.format(NPCHoras_Config.Texts[GetLanguage()][15]), 200, 8)
			end

		end

		
		

		
	end
	DisableAlphaBlend()

end
--#endregion

--#region INTERFACE BEFORE
function NPCHoras.Interface()						
	if not NPCHoras.CheckOpen() then return end
	NPCHoras.CreateButton(NPCHoras_Config.ButtonID.fechar,0, 0, 0, 0)
	NPCHoras.CreateButton(NPCHoras_Config.ButtonID.acessar,0, 0, 0, 0)
	
	--#region Check outras interfaces
	if	CheckWindowOpen(UIInventory) 		== 0	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIFriendList) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIMoveList)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIParty) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIQuest) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIGuild) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIGuildNpc) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UITrade) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIWarehouse) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIChaosBox)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UICommandWindow) 	== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIPetInfo)	 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIShop)				== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIStore) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIOtherStore) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UICharacter) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIOptions) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIHelp)				== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIFastDial)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UISkillTree) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UINPC_Titus) 		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UICashShop)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIFullMap) 			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UINPC_Dialog)		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIGensInfo)			== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UINPC_Julia)		== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIExpandInventory)	== 1	then	NPCHoras_Config.WindowOffset = 190 else NPCHoras_Config.WindowOffset = 0	end
	if	CheckWindowOpen(UIExpandWarehouse)	== 1	then	NPCHoras.Close()	end
	if	CheckWindowOpen(UIMuHelper)			== 1	then	NPCHoras.Close()	end
	--#endregion
	
	EnableAlphaTest()
	RenderImage(31322, 260-NPCHoras_Config.WindowOffset, 0, 190, 428)
	RenderImage(31353, 260-NPCHoras_Config.WindowOffset, 0, 190, 64)
	RenderImage(31355, 260-NPCHoras_Config.WindowOffset, 64, 21, 320)
	RenderImage(31356, 429-NPCHoras_Config.WindowOffset, 64, 21, 320)
	RenderImage(31357, 260-NPCHoras_Config.WindowOffset, 384, 190, 45)
	
	SetFontType(1)
	SetTextBg(0, 0, 0, 0)
	SetTextColor(255, 255, 255, 240)
	RenderText3(355-NPCHoras_Config.WindowOffset, 20, NPCHoras_Config.Texts[GetLanguage()][1], 80, 8)
	

	SetFontType(2)			
	SetTextBg(0, 0, 0, 0)			
	SetTextColor(255, 208, 0, 255)
	RenderText3(355-NPCHoras_Config.WindowOffset, 50, NPCHoras_Config.Texts[GetLanguage()][2], 150, 8)
	SetFontType(0)			
	SetTextBg(0, 0, 0, 0)			
	SetTextColor(255, 255, 255, 255)
	RenderText3(355-NPCHoras_Config.WindowOffset, 75, NPCHoras_Config.Texts[GetLanguage()][3], 150, 8)
	RenderText3(355-NPCHoras_Config.WindowOffset, 85, NPCHoras_Config.Texts[GetLanguage()][4], 150, 8)
	RenderText3(355-NPCHoras_Config.WindowOffset, 95, NPCHoras_Config.Texts[GetLanguage()][5], 150, 8)

	SetFontType(1)			
	SetTextBg(255, 100, 0, 150)			
	SetTextColor(0, 0, 0, 255)
	local tid = 6	
	if NPCHoras_Config.Saldo == 1 then
		tid = 7
	end
	RenderText3(355-NPCHoras_Config.WindowOffset, 110, string.format(NPCHoras_Config.Texts[GetLanguage()][tid], NPCHoras_Config.Saldo), 160, 8)

	NPCHoras.CreateButton(NPCHoras_Config.ButtonID.fechar,470, 395, 24, 24)

	DisableAlphaBlend()
	
	SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.6)
	DrawBar(278-NPCHoras_Config.WindowOffset, 140, 155, 100)
	DrawBar(278-NPCHoras_Config.WindowOffset, 280, 155, 132)
	DrawBar(278-NPCHoras_Config.WindowOffset, 280, 155, 20)
	glColor4f(0.8, 0.8, 0.8, 0.1)
	
	local line = 329
	local c = 1
	while c < #NPCHoras_Config.ShortLista do
		DrawBar(290-NPCHoras_Config.WindowOffset, line, 110, 1)
		line = line+25
		c = c+1
	end
	c = nil
	
	
	EndDrawBar()

	EnableAlphaTest()

	RenderImage(31340, 274-NPCHoras_Config.WindowOffset, 140, 14, 14) -- topo esquerdo
	RenderImage(31341, 425-NPCHoras_Config.WindowOffset, 140, 14, 14) -- topo direito
	RenderImage(31342, 274-NPCHoras_Config.WindowOffset, 230, 14, 14) -- base esquerdo
	RenderImage(31343, 425-NPCHoras_Config.WindowOffset, 230, 14, 14) -- base direito
	
	
	RenderImage(31340, 274-NPCHoras_Config.WindowOffset, 280, 14, 14) -- topo esquerdo
	RenderImage(31341, 425-NPCHoras_Config.WindowOffset, 280, 14, 14) -- topo direito
	RenderImage(31342, 274-NPCHoras_Config.WindowOffset, 400, 14, 14) -- base esquerdo
	RenderImage(31343, 425-NPCHoras_Config.WindowOffset, 400, 14, 14) -- base direito

	for i = 1, 137 do
		RenderImage(31344, 287-NPCHoras_Config.WindowOffset+i, 140, 1, 14) -- horizontal superior
		RenderImage(31344, 287-NPCHoras_Config.WindowOffset+i, 280, 1, 14) -- horizontal superior
		
		RenderImage(31345, 287-NPCHoras_Config.WindowOffset+i, 230, 1, 14) -- horizontal superior
		RenderImage(31345, 287-NPCHoras_Config.WindowOffset+i, 400, 1, 14) -- horizontal superior
	end

	for i = 1, 76 do
		RenderImage(31346, 274-NPCHoras_Config.WindowOffset, 153+i, 14, 1) -- vertical esquerda
		RenderImage(31347, 425-NPCHoras_Config.WindowOffset, 153+i, 14, 1) -- vertical direita
	end	
	for i = 1, 100 do
		RenderImage(31346, 274-NPCHoras_Config.WindowOffset, 293+i, 14, 1) -- vertical esquerda
		RenderImage(31347, 425-NPCHoras_Config.WindowOffset, 293+i, 14, 1) -- vertical direita
	end

	RenderImage(31270, 413-NPCHoras_Config.WindowOffset, 310, 7, 3) -- topo	
	for i = 313, 395, 15 do
		RenderImage(31271, 413-NPCHoras_Config.WindowOffset, i, 7, 15) -- meio
	end
	RenderImage(31272, 413-NPCHoras_Config.WindowOffset, 400, 7, 3) -- baixo
	
	local cursorPos = 305 + (NPCHoras_Config.ShortListaConfig.CurrentStep*(70/(#NPCHoras_Config.Brindes-4)))
	if tostring(cursorPos) == "nan" or tostring(cursorPos) == "-nan" then cursorPos = 305 end
	RenderImage(31273, 409-NPCHoras_Config.WindowOffset, cursorPos, 15, 30)

	NPCHoras.CreateButton(NPCHoras_Config.ButtonID.acessar, 310-NPCHoras_Config.WindowOffset, 249, 90, 24)

	if NPCHoras_Config.ShortListaConfig.Selected.ListID ~= nil then
		if NPCHoras_Config.ShortListaConfig.Selected.Valor < NPCHoras_Config.Saldo then
			if not NPCHoras.ButtonClicked(NPCHoras_Config.ButtonID.acessar) then			
				if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.acessar, MousePosX(), MousePosY()) then
					RenderImage2(31326, 310-NPCHoras_Config.WindowOffset, 249, 110, 25,0, 0.2264566, 1.0, 0.2245212, 1, 1, 1.0)
				else
					RenderImage2(31326, 310-NPCHoras_Config.WindowOffset, 249, 110, 25,0, 0, 1.0, 0.2245212, 1, 1, 1.0)
				end
			else
				RenderImage2(31326, 310-NPCHoras_Config.WindowOffset, 249, 110, 25,0, 0, 1.0, 0.2245212, 1, 1, 1.0)
			end
		else
			RenderImage2(31326, 310-NPCHoras_Config.WindowOffset, 249, 110, 25,0, 0.4509778, 1.0, 0.2245212, 1, 1, 1.0)
		end
	else
		RenderImage2(31326, 310-NPCHoras_Config.WindowOffset, 249, 110, 25,0, 0.4509778, 1.0, 0.2245212, 1, 1, 1.0)
	end

	DisableAlphaBlend()

	if MousePosX() >= 290-NPCHoras_Config.WindowOffset and MousePosX() <= 400-NPCHoras_Config.WindowOffset then
		local line = 304
		for i in ipairs(NPCHoras_Config.ShortLista) do
			if MousePosY() >= line+1 and MousePosY() <= line+24 then
				SetBlend()
				glColor4f(1.0, 1.0, 1.0, 0.1)
				DrawBar(290-NPCHoras_Config.WindowOffset, line+2, 110, 22)
				EndDrawBar()
			end
			line = line+25
		end
	end

	EnableAlphaTest()
	
	SetFontType(0)			
	SetTextBg(0, 0, 0, 0)
	if NPCHoras_Config.ShortListaConfig.Selected.ListID ~= nil then
		SetFontType(0)
		SetTextBg(0, 0, 0, 0)
		if NPCHoras_Config.ShortListaConfig.Selected.Valor > NPCHoras_Config.Saldo then
			SetTextColor(200, 200, 200, 255)
		else
			SetTextColor(255, 255, 255, 255)
		end
		RenderText3(355-NPCHoras_Config.WindowOffset, 257, NPCHoras_Config.Texts[GetLanguage()][8], 100, 8)
		SetFontType(1)
		SetTextBg(255, 208, 0, 150)			
		SetTextColor(0, 0, 0, 255)
		RenderText3(355-NPCHoras_Config.WindowOffset, 287, string.format(NPCHoras_Config.Texts[GetLanguage()][10], NPCHoras_Config.ShortListaConfig.Selected.Valor), 110, 8)
	else
		SetFontType(0)
		SetTextBg(0, 0, 0, 0)	
		SetTextColor(200, 200, 200, 255)
		RenderText3(355-NPCHoras_Config.WindowOffset, 257, NPCHoras_Config.Texts[GetLanguage()][8], 110, 8)
		SetFontType(1)
		SetTextBg(255, 208, 0, 150)			
		SetTextColor(0, 0, 0, 255)
		RenderText3(355-NPCHoras_Config.WindowOffset, 287, NPCHoras_Config.Texts[GetLanguage()][9], 110, 8)
	end

	SetFontType(0)
	SetTextBg(0, 0, 0, 0)	
	SetTextColor(255, 255, 255, 255)
	local line = 314
	for i in ipairs(NPCHoras_Config.ShortLista) do
		RenderImage2(NPCHoras_Config.Images.GB_Ponto, 290-NPCHoras_Config.WindowOffset, line+2, 5, 5, 0, 0, 0.591827401425252121, 0.591827401425252121, 1, 1, 1.0)
		if NPCHoras_Config.ShortListaConfig.Selected.ListID ~= nil then 
			if NPCHoras_Config.ShortLista[i].ListID == NPCHoras_Config.ShortListaConfig.Selected.ListID then
				SetTextColor(0, 255, 0, 205)
			else
				SetTextColor(255, 255, 255, 255)
			end
		else
			SetTextColor(255, 255, 255, 255)
		end
		RenderText3(300-NPCHoras_Config.WindowOffset, line, string.format("%s", NPCHoras_Config.ShortLista[i].Nome), 150, ALIGN_LEFT)
		line = line+25
	end 
	
	DisableAlphaBlend()

end
--#endregion

--#region DETECTA TECLADO
function NPCHoras.KeyListener(key)
	if CheckWindowOpen(UIChatWindow) == 1 then return false end

	if not NPCHoras.CheckOpen() then return false end
		
	if key == Keys.Escape or key == Keys.I or key == Keys.V then
		NPCHoras.Close()
		return true
	end	
end
--#endregion

--#region DETECA CLIQUE ESQUERDO MOUSE
function NPCHoras.ClickEvent()
	if not NPCHoras.CheckOpen() then return false end
	local x = MousePosX()
	local y = MousePosY()

	if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.fechar, (x+NPCHoras_Config.WindowOffset), y) then
		NPCHoras.Close()
		return true
	end

	
	if NPCHoras_Config.AlertWindow.Show then
		if NPCHoras_Config.AlertWindow.Type == 0 then
			if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.ok, x, y) then
				NPCHoras.RetirarItem()
				NPCHoras_Config.AlertWindow.Show = false
				NPCHoras_Config.AlertWindow.Type = 0
			end
			if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.cancel, x, y) then
				NPCHoras_Config.AlertWindow.Show = false
				NPCHoras_Config.AlertWindow.Type = 0
			end
		else
			if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.ok, x, y) then
				NPCHoras_Config.AlertWindow.Show = false
				NPCHoras_Config.AlertWindow.Type = 0
			end
		end

		return true
	end

	if NPCHoras.ButtonMouseOver(NPCHoras_Config.ButtonID.acessar, x, y) then
		if NPCHoras_Config.ShortListaConfig.Selected.ListID ~= nil then
			if NPCHoras_Config.ShortListaConfig.Selected.Valor < NPCHoras_Config.Saldo then
				NPCHoras_Config.Button[NPCHoras_Config.ButtonID.acessar].clicked = true
				NPCHoras_Config.AlertWindow.Type = 0
				NPCHoras_Config.AlertWindow.Show = true
			end
		end
		return true
	end
		

	if x >= 290-NPCHoras_Config.WindowOffset and x <= 400-NPCHoras_Config.WindowOffset then
		local line = 304
		for i in ipairs(NPCHoras_Config.ShortLista) do
			if y >= line+1 and y <= line+24 then
				NPCHoras_Config.ShortListaConfig.Selected = NPCHoras_Config.ShortLista[i]
				return true
			end
			line = line+25
		end
	end

	return false
end
--#endregion

--#region DETECTA SCROLL DO MOUSE
function NPCHoras.ScrollMouse(Direction)
	local x = MousePosX()
	local y = MousePosY()
	if NPCHoras.CheckOpen() then
		if NPCHoras_Config.AlertWindow.Show then return true end

		local area = {x1 = 275, x2 = 435, y1 = 280, y2 = 410}
		if x >= area.x1-NPCHoras_Config.WindowOffset and x <= area.x2-NPCHoras_Config.WindowOffset and y >= area.y1 and y <= area.y2 then
			if Direction > 0 then
				if NPCHoras_Config.ShortListaConfig.CurrentStep > 0 then
					NPCHoras_Config.ShortListaConfig.CurrentStep = NPCHoras_Config.ShortListaConfig.CurrentStep - 1
					NPCHoras_Config.ShortListaConfig.Offset = NPCHoras_Config.ShortListaConfig.Offset - 1
					NPCHoras.GerarListaItem()
				end
			else
				if NPCHoras_Config.ShortListaConfig.CurrentStep < NPCHoras_Config.ShortListaConfig.Steps then
					NPCHoras_Config.ShortListaConfig.CurrentStep = NPCHoras_Config.ShortListaConfig.CurrentStep + 1
					NPCHoras_Config.ShortListaConfig.Offset = NPCHoras_Config.ShortListaConfig.Offset + 1
					NPCHoras.GerarListaItem()
				end
			end
			return true
		end
	end
end
--#endregion

--#region RECEBE PACKETS DO SERVIDOR
function NPCHoras.Protocol(Packet, PacketName)
	if Packet == NPCHoras_Config.Packet then
		if PacketName == string.format("1-%s-%d", UserGetName(), UserGetIndex()) then
			NPCHoras_Config.Saldo = GetDwordPacket(PacketName, -1)
			ClearPacket(PacketName)
			NPCHoras.GerarListaItem()
			NPCHoras.GerarScrollBarItem()
			NPCHoras.Open()
			return true
		end

		if PacketName == string.format("4-%s-%d", UserGetName(), UserGetIndex()) then
			ClearPacket(PacketName)
			NPCHoras_Config.AlertWindow.Type = 2
			NPCHoras_Config.AlertWindow.Show = true
			return true
		end

		if PacketName == string.format("5-%s-%d", UserGetName(), UserGetIndex()) then
			ClearPacket(PacketName)
			NPCHoras_Config.AlertWindow.Type = 3
			NPCHoras_Config.AlertWindow.Show = true			
			return true
		end

		if PacketName == string.format("6-%s-%d", UserGetName(), UserGetIndex()) then
			ClearPacket(PacketName)
			NPCHoras_Config.AlertWindow.Type = 4
			NPCHoras_Config.AlertWindow.Show = true
			return true
		end

		if PacketName == string.format("7-%s-%d", UserGetName(), UserGetIndex()) then
			NPCHoras_Config.Saldo = GetDwordPacket(PacketName, -1)
			ClearPacket(PacketName)
			NPCHoras_Config.AlertWindow.Type = 1
			NPCHoras_Config.AlertWindow.Show = true
			return true
		end
	end	
end
--#endregion

--#region verifica se o mouse está sobre a area da janela
function NPCHoras.UpdateMouse()
	if UICustomInterface == NPCHoras_Config.WindowID then
		if NPCHoras.CheckArea(MousePosX()) then
			DisableClickClient()
			return
		end
	end	
	
end
--#endregion

--#region RETIRA UM ITEM
function NPCHoras.RetirarItem()
	local pname = string.format("3-%s-%d", UserGetName(), UserGetIndex())
	CreatePacket(pname, NPCHoras_Config.Packet)
	SetBytePacket(pname, NPCHoras_Config.ShortListaConfig.Selected.ListID)
	SendPacket(pname)
	ClearPacket(pname)
end
--#endregion

NPCHoras.Init()

return NPCHoras

Ranking = {}

function Ranking.Init()
    Ranking.Define()
    InterfaceController.MainProc(Ranking.Interface)
    InterfaceController.MainProcWorldKey(Ranking.KeyEvent)
    InterfaceController.UpdateMouse(Ranking.UpdateMouse)
    InterfaceController.InterfaceClickEvent(Ranking.ClickEvent)
    InterfaceController.ClientProtocol(Ranking.Protocol)
   
end

function Ranking.Define()
    Ranking_Config.LinkClickable = 0
    Ranking_Config.ImageBack = 0
    Ranking_Config.WindowPosition = {X = 180, Y = 65}
    Ranking_Config.Button = {}
    Ranking_Config.ButtonID = {
        fechar = 1,
        esquerda = 2,
        direita = 3
    }
    Ranking_Config.CurrentCategorie = 1
    Ranking_Config.Players = {}
end

function Ranking.Open()
    if	CheckWindowOpen(UIFriendList)		== 1	then	CloseWindow(UIFriendList)		end
	if	CheckWindowOpen(UIMoveList)			== 1	then	CloseWindow(UIMoveList)			end
	if	CheckWindowOpen(UIParty)			== 1	then	CloseWindow(UIParty)			end
	if	CheckWindowOpen(UIQuest)			== 1	then	CloseWindow(UIQuest)			end
	if	CheckWindowOpen(UIGuild)			== 1	then	CloseWindow(UIGuild)			end
	if	CheckWindowOpen(UIGuildNpc)			== 1	then	CloseWindow(UIGuildNpc)			end
	if	CheckWindowOpen(UITrade)			== 1	then	CloseWindow(UITrade)			end
	if	CheckWindowOpen(UIWarehouse)		== 1	then	CloseWindow(UIWarehouse)		end
	if	CheckWindowOpen(UIChaosBox)			== 1	then	CloseWindow(UIChaosBox)			end
	if	CheckWindowOpen(UICommandWindow)	== 1	then	CloseWindow(UICommandWindow)    end
	if	CheckWindowOpen(UIPetInfo)			== 1	then	CloseWindow(UIPetInfo)          end
	if	CheckWindowOpen(UIShop)				== 1	then	CloseWindow(UIShop)             end
	if	CheckWindowOpen(UIStore)			== 1	then	CloseWindow(UIStore)			end
	if	CheckWindowOpen(UIOtherStore)		== 1	then	CloseWindow(UIOtherStore)       end
	if	CheckWindowOpen(UICharacter)		== 1	then	CloseWindow(UICharacter)		end
	if	CheckWindowOpen(UIOptions)			== 1	then	CloseWindow(UIOptions)			end
	if	CheckWindowOpen(UIHelp)				== 1	then	CloseWindow(UIHelp)			    end
	if	CheckWindowOpen(UIFastDial)			== 1	then	CloseWindow(UIFastDial)			end
	if	CheckWindowOpen(UISkillTree)		== 1	then	CloseWindow(UISkillTree)		end
	if	CheckWindowOpen(UINPC_Titus)		== 1	then	CloseWindow(UINPC_Titus)		end
	if	CheckWindowOpen(UICashShop)			== 1	then	CloseWindow(UICashShop)			end
	if	CheckWindowOpen(UIFullMap)			== 1	then	CloseWindow(UIFullMap)			end
	if	CheckWindowOpen(UINPC_Dialog)		== 1	then	CloseWindow(UINPC_Dialog)		end
	if	CheckWindowOpen(UIGensInfo)			== 1	then	CloseWindow(UIGensInfo)			end
	if	CheckWindowOpen(UINPC_Julia)		== 1	then	CloseWindow(UINPC_Julia)        end
	if	CheckWindowOpen(UIExpandInventory)	== 1	then	CloseWindow(UIExpandInventory)	end
	if	CheckWindowOpen(UIExpandWarehouse)	== 1	then	CloseWindow(UIExpandWarehouse)  end
	if	CheckWindowOpen(UIMuHelper)			== 1	then	CloseWindow(UIMuHelper)			end
	UICustomInterface = Ranking_Config.WindowID
end

function Ranking.Close()
    UICustomInterface = 0
    Ranking.Define()
end

--#region FUNÇÕES DE BOTÃO
function Ranking.CreateButton(ButtonID, x, y, w, h)
	if Ranking_Config.Button[ButtonID] == nil then
		table.insert(Ranking_Config.Button, ButtonID)
		Ranking_Config.Button[ButtonID] = {
			x = x,
			y = y,
			w = w,
			h = h,
			clicked = false,
			timer = 0
		}
	else
		Ranking_Config.Button[ButtonID].x = x
		Ranking_Config.Button[ButtonID].y = y
		Ranking_Config.Button[ButtonID].w = w
		Ranking_Config.Button[ButtonID].h = h
	end
end

function Ranking.ButtonClicked(ButtonID)
	if Ranking_Config.Button[ButtonID] == nil then return false end
	if Ranking_Config.Button[ButtonID].clicked then
		if Ranking_Config.Button[ButtonID].timer >= 2 then
			Ranking_Config.Button[ButtonID].timer = 0
			Ranking_Config.Button[ButtonID].clicked = false
			return false
		end
		Ranking_Config.Button[ButtonID].timer = Ranking_Config.Button[ButtonID].timer + 1
		return true
	end
	return false
end

function Ranking.ButtonMouseOver(ButtonID, x, y)
	if Ranking_Config.Button[ButtonID] == nil then return false end
	if x >= Ranking_Config.Button[ButtonID].x and x <= (Ranking_Config.Button[ButtonID].x+Ranking_Config.Button[ButtonID].w) then
		if y >= Ranking_Config.Button[ButtonID].y and y <= (Ranking_Config.Button[ButtonID].y+Ranking_Config.Button[ButtonID].h) then
			return true
		end
	end
	return false
end
--#endregion

function Ranking.Interface()
    if UICustomInterface ~= Ranking_Config.WindowID then return end

    EnableAlphaTest()
    RenderImage(Ranking_Config.Images.Ranking_Back, Ranking_Config.WindowPosition.X, Ranking_Config.WindowPosition.Y, 285, 320)
    DisableAlphaBlend()

    GLSwitch()
    GLSwitchBlend()
    SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.6)
	DrawBar(Ranking_Config.WindowPosition.X, Ranking_Config.WindowPosition.Y, 285, 320)
	EndDrawBar()
        
    EnableAlphaTest()
    RenderImage2(31353, Ranking_Config.WindowPosition.X, Ranking_Config.WindowPosition.Y, 85, 42, 0.0, 0.0, 0.5, 1.0, 1, 1, 1.0)
    RenderImage2(31353, Ranking_Config.WindowPosition.X+85, Ranking_Config.WindowPosition.Y, 115, 42, 0.242465867, 0.0, 0.242465867, 1.0, 1, 1, 1.0)	
    RenderImage2(31353, Ranking_Config.WindowPosition.X+200, Ranking_Config.WindowPosition.Y, 85, 42, 0.242465867, 0.0, 0.5, 1.0, 1, 1, 1.0)
    RenderImage(31355, Ranking_Config.WindowPosition.X, Ranking_Config.WindowPosition.Y+41, 18, 254)
    RenderImage(31356, Ranking_Config.WindowPosition.X+264, Ranking_Config.WindowPosition.Y+41, 21, 254)
    RenderImage2(31357, Ranking_Config.WindowPosition.X, Ranking_Config.WindowPosition.Y+294, 85, 42, 0.0, 0.0, 0.5, 1.0, 1, 1, 1.0)
    RenderImage2(31357, Ranking_Config.WindowPosition.X+85, Ranking_Config.WindowPosition.Y+294, 115, 42, 0.242465867, 0.0, 0.242465867, 1.0, 1, 1, 1.0)	
    RenderImage2(31357, Ranking_Config.WindowPosition.X+200, Ranking_Config.WindowPosition.Y+294, 85, 42, 0.242465867, 0.0, 0.5, 1.0, 1, 1, 1.0)	
    
    SetFontType(1)
    SetTextBg(0,0,0,0)
    SetTextColor(255,179,0,255)
    RenderText3(Ranking_Config.WindowPosition.X+144, Ranking_Config.WindowPosition.Y+5, Ranking_Config.Texts[GetLanguage()][2], 150, 8)

    Ranking.CreateButton(Ranking_Config.ButtonID.fechar, 450, 70, 10, 10)
    if Ranking.ButtonMouseOver(Ranking_Config.ButtonID.fechar, MousePosX(), MousePosY()) then
        SetFontType(0)
        SetTextBg(0,0,0,180)
        SetTextColor(255,255,255,230)
        RenderText3(Ranking_Config.Button[Ranking_Config.ButtonID.fechar].x, Ranking_Config.Button[Ranking_Config.ButtonID.fechar].y-15, Ranking_Config.Texts[GetLanguage()][1], #Ranking_Config.Texts[GetLanguage()][1]*4, ALIGN_LEFT)
    end 
    DisableAlphaBlend()
     --#region FUNDO DAS JANELAS
    GLSwitch()
    GLSwitchBlend()
    SetBlend()
    glColor4f(0.0, 0.0, 0.0, 0.7)
    DrawBar(Ranking_Config.WindowPosition.X+88, Ranking_Config.WindowPosition.Y+40, 110, 24)
    DrawBar(Ranking_Config.WindowPosition.X+15, Ranking_Config.WindowPosition.Y+64, 255, 220)

    
    glColor4f(0.4, 0.4, 0.4, 0.1)
    DrawBar(Ranking_Config.WindowPosition.X+90, Ranking_Config.WindowPosition.Y+64, 1, 220)
    DrawBar(Ranking_Config.WindowPosition.X+195, Ranking_Config.WindowPosition.Y+64, 1, 220)
     

    local line = 83
    for i = 1, 11 do
        if i == 1 then
            glColor4f(0.4, 0.4, 0.4, 0.2)
            DrawBar(Ranking_Config.WindowPosition.X+15, Ranking_Config.WindowPosition.Y+line-20, 255, 20)
        end
        if i ~= 11 then
            glColor4f(0.4, 0.4, 0.4, 0.1)
            DrawBar(Ranking_Config.WindowPosition.X+15, Ranking_Config.WindowPosition.Y+line, 255, 1)
        end
        if i%2 ~= 0 then
            glColor4f(0.1, 0.1, 0.1, 0.1)
            DrawBar(Ranking_Config.WindowPosition.X+15, Ranking_Config.WindowPosition.Y+line-20, 255, 20)
        end
        line = line + 20
    end
    EndDrawBar()
     --#endregion

    EnableAlphaTest()

    RenderImage(31340, Ranking_Config.WindowPosition.X+13, Ranking_Config.WindowPosition.Y+64, 14, 14) -- topo esquerdo
    RenderImage(31341, Ranking_Config.WindowPosition.X+260, Ranking_Config.WindowPosition.Y+64, 14, 14) -- topo direito
    RenderImage(31342, Ranking_Config.WindowPosition.X+13, Ranking_Config.WindowPosition.Y+277, 14, 14) -- base esquerdo
    RenderImage(31343, Ranking_Config.WindowPosition.X+260, Ranking_Config.WindowPosition.Y+277, 14, 14) -- base direito    
    RenderImage(31340, Ranking_Config.WindowPosition.X+87, Ranking_Config.WindowPosition.Y+40, 14, 14) -- topo esquerdo
    RenderImage(31341, Ranking_Config.WindowPosition.X+188, Ranking_Config.WindowPosition.Y+40, 14, 14) -- topo direito
    
    for i = 1, 88 do
        RenderImage(31344, Ranking_Config.WindowPosition.X+99+i, Ranking_Config.WindowPosition.Y+40, 1, 14) -- horizontal titulo
    end 
    for i = 1, 233 do
        RenderImage(31344, Ranking_Config.WindowPosition.X+26+i, Ranking_Config.WindowPosition.Y+64, 1, 14) -- horizontal superior
        RenderImage(31345, Ranking_Config.WindowPosition.X+26+i, Ranking_Config.WindowPosition.Y+277, 1, 14) -- horizontal inferior
    end

    for i = 1, 10 do
        RenderImage(31346, Ranking_Config.WindowPosition.X+87, Ranking_Config.WindowPosition.Y+53+i, 14, 1) -- vertical esquerda topo
        RenderImage(31347, Ranking_Config.WindowPosition.X+188, Ranking_Config.WindowPosition.Y+53+i, 14, 1) -- vertical direita topo
    end	
    
    for i = 1, 200 do
        RenderImage(31346, Ranking_Config.WindowPosition.X+13, Ranking_Config.WindowPosition.Y+77+i, 14, 1) -- vertical esquerda
        RenderImage(31347, Ranking_Config.WindowPosition.X+260, Ranking_Config.WindowPosition.Y+77+i, 14, 1) -- vertical direita
    end

    Ranking.CreateButton(Ranking_Config.ButtonID.esquerda, Ranking_Config.WindowPosition.X+67, Ranking_Config.WindowPosition.Y+45, 16, 15)
    if Ranking_Config.CurrentCategorie > 1 then
	    if Ranking.ButtonClicked(Ranking_Config.ButtonID.esquerda) then
            RenderImage2(0X7E59, Ranking_Config.WindowPosition.X+67, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0, 0.63282525, 0.1848742, 1, 1, 1.0)
        else
            if Ranking.ButtonMouseOver(Ranking_Config.ButtonID.esquerda, MousePosX(), MousePosY()) then
                RenderImage2(0X7E59, Ranking_Config.WindowPosition.X+67, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0.1748742, 0.63282525, 0.1848742, 1, 1, 1.0)
            else
                RenderImage2(0X7E59, Ranking_Config.WindowPosition.X+67, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0, 0.63282525, 0.1848742, 1, 1, 1.0)
            end
        end
    else
        RenderImage2(0X7E59, Ranking_Config.WindowPosition.X+67, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0.3497484, 0.63282525, 0.1848742, 1, 1, 1.0)
    end

    Ranking.CreateButton(Ranking_Config.ButtonID.direita, Ranking_Config.WindowPosition.X+205, Ranking_Config.WindowPosition.Y+45, 16, 15)
    if Ranking_Config.CurrentCategorie < Ranking_Config.Count then
	    if Ranking.ButtonClicked(Ranking_Config.ButtonID.direita) then
            RenderImage2(0X7E5A, Ranking_Config.WindowPosition.X+205, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0, 0.63282525, 0.1848742, 1, 1, 1.0)
        else
            if Ranking.ButtonMouseOver(Ranking_Config.ButtonID.direita, MousePosX(), MousePosY()) then
                RenderImage2(0X7E5A, Ranking_Config.WindowPosition.X+205, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0.1748742, 0.63282525, 0.1848742, 1, 1, 1.0)
            else
                RenderImage2(0X7E5A, Ranking_Config.WindowPosition.X+205, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0, 0.63282525, 0.1848742, 1, 1, 1.0)
            end
        end
    else
        RenderImage2(0X7E5A, Ranking_Config.WindowPosition.X+205, Ranking_Config.WindowPosition.Y+45, 16, 15, 0, 0.3497484, 0.63282525, 0.1848742, 1, 1, 1.0)
    end

    DisableAlphaBlend()

    EnableAlphaTest()

    SetFontType(1)
    SetTextBg(0,0,0,0)
    SetTextColor(255,179,0,255)
    RenderText3(Ranking_Config.WindowPosition.X+144, Ranking_Config.WindowPosition.Y+48, Ranking_Config.Categories[GetLanguage()][Ranking_Config.CurrentCategorie], 150, 8)

    SetFontType(1)
    SetTextBg(0,0,0,0)
    SetTextColor(255,255,255,255)
    RenderText3(Ranking_Config.WindowPosition.X+55, Ranking_Config.WindowPosition.Y+70, Ranking_Config.Texts[GetLanguage()][3], 150, 8)
    RenderText3(Ranking_Config.WindowPosition.X+145, Ranking_Config.WindowPosition.Y+70, Ranking_Config.Texts[GetLanguage()][4], 150, 8)
    RenderText3(Ranking_Config.WindowPosition.X+233, Ranking_Config.WindowPosition.Y+70, Ranking_Config.Texts[GetLanguage()][5], 150, 8)
    
    SetFontType(0)
    SetTextBg(0,0,0,0)
    
    line = Ranking_Config.WindowPosition.Y+90
    for i in ipairs(Ranking_Config.Players) do
        if MousePosX() >= 271 and MousePosX() <=375 and MousePosY() >= line and MousePosY() <= line+10 then
            SetTextColor(0,132,255,255)
            RenderText3(Ranking_Config.WindowPosition.X+145, line, string.format("%s",Ranking_Config.Players[i].Name), 150, 8)
        else
            SetTextColor(255,255,255,255)
            RenderText3(Ranking_Config.WindowPosition.X+145, line, string.format("%s",Ranking_Config.Players[i].Name), 150, 8)
        end
        SetTextColor(255,255,255,255)
        RenderText3(Ranking_Config.WindowPosition.X+55, line, string.format("%dº",Ranking_Config.Players[i].Position), 150, 8)
        RenderText3(Ranking_Config.WindowPosition.X+233, line, string.format("%d",Ranking_Config.Players[i].Points), 150, 8)
        line = line+20
    end
    line = Ranking_Config.WindowPosition.Y+90
    for i in ipairs(Ranking_Config.Players) do
        if MousePosX() >= 271 and MousePosX() <=375 and MousePosY() >= line and MousePosY() <= line+10 then
            if Ranking_Config.Players[i].Tempo > 0 then
                DisableAlphaBlend()
                GLSwitch()
                GLSwitchBlend()
                SetBlend()
                glColor4f(0.0, 0.0, 0.0, 1.0)
                DrawBar(MousePosX()+30, MousePosY()-10, 100, 50)
                glColor4f(0.5, 0.5, 0.5, 0.3)
                DrawBar(MousePosX()+30, MousePosY()-10, 100, 50)
                EndDrawBar()
                EnableAlphaTest()
                for g = 1, 92 do
                    RenderImage(31344, MousePosX()+29+g, MousePosY()-12, 1, 14) -- horizontal superior preview
                    RenderImage(31345, MousePosX()+29+g, MousePosY()+30, 1, 14) -- horizontal inferior preview
                end
                for g = 1, 45 do
                    RenderImage(31346, MousePosX()+29, MousePosY()-12+g, 14, 1) -- vertical esquerda carrinho
                    RenderImage(31347, MousePosX()+121, MousePosY()-12+g, 14, 1) -- vertical direita carrinho
                end
                RenderImage(31340, MousePosX()+29, MousePosY()-12, 14, 14) -- Topo Esquerdo Carrinho
                RenderImage(31341, MousePosX()+121, MousePosY()-12, 14, 14) -- Topo Direito Carrinho
                RenderImage(31342, MousePosX()+29, MousePosY()+30, 14, 14) -- Base Esquerdo Carrinho
                RenderImage(31343, MousePosX()+121, MousePosY()+30, 14, 14) -- Base Direito Carrinho
                
                SetFontType(1)
                SetTextBg(0,0,0,0)
                SetTextColor(255,179,0,255)
                RenderText3(MousePosX()+81, MousePosY()-5, Ranking_Config.Texts[GetLanguage()][8], 150, 8)
                SetFontType(0)
                SetTextColor(255,255,255,255)

                local txtday = ""
                if GetLanguage() == "Eng" then
                    txtday = os.date("%m/%d/%Y", Ranking_Config.Players[i].Tempo)
                else
                    txtday = os.date("%d/%m/%Y", Ranking_Config.Players[i].Tempo)
                end
                local txttime = os.date("%H:%M:%S", Ranking_Config.Players[i].Tempo)
                RenderText3(MousePosX()+81, MousePosY()+10, txtday, 150, 8)
                RenderText3(MousePosX()+81, MousePosY()+20, txttime, 150, 8)
            end
        end
        line = line+20
    end
end

function Ranking.KeyEvent(key)
    if key == Ranking_Config.Shortcut then
        if UICustomInterface == Ranking_Config.WindowID then
            Ranking.Close()
        else
            Ranking.RequestData(0)
        end
    end

    if key == Keys.Escape then
        if UICustomInterface == Ranking_Config.WindowID then
            Ranking.Close()
        end
    end
end

function Ranking.UpdateMouse()
    if UICustomInterface == Ranking_Config.WindowID then DisableClickClient() end
end

function Ranking.ClickEvent()
    if UICustomInterface ~= Ranking_Config.WindowID then return end
    local x = MousePosX()
    local y = MousePosY()

    if Ranking.ButtonMouseOver(Ranking_Config.ButtonID.fechar, x, y) then
        Ranking.Close()
        return true
    end

    if Ranking.ButtonMouseOver(Ranking_Config.ButtonID.esquerda, x, y) then
        if Ranking_Config.CurrentCategorie > 1 then
            Ranking_Config.Button[Ranking_Config.ButtonID.esquerda].clicked = true
            Ranking_Config.CurrentCategorie = Ranking_Config.CurrentCategorie - 1
            Ranking.RequestData(1)
        end
        Ranking_Config.LinkClickable = Ranking_Config.LinkClickable + 1
        return true
    end

    if Ranking.ButtonMouseOver(Ranking_Config.ButtonID.direita, x, y) then
        if Ranking_Config.CurrentCategorie < Ranking_Config.Count then
            Ranking_Config.Button[Ranking_Config.ButtonID.direita].clicked = true
            Ranking_Config.CurrentCategorie = Ranking_Config.CurrentCategorie + 1
            Ranking.RequestData(1)
        end
        Ranking_Config.LinkClickable = Ranking_Config.LinkClickable + 1
        return true
    end

    if Ranking_Config.UseWebProfile then
        line = Ranking_Config.WindowPosition.Y+90
        for i in ipairs(Ranking_Config.Players) do
            if MousePosX() >= 271 and MousePosX() <=375 and MousePosY() >= line and MousePosY() <= line+10 then
                if Ranking_Config.LinkClickable > 0 then
                    os.execute(string.format("start %s%s", Ranking_Config.WebProfilePath, Ranking_Config.Players[i].Name))
                end
            end
            line = line+20
        end
    end
    Ranking_Config.LinkClickable = Ranking_Config.LinkClickable + 1  
end

function Ranking.Protocol(Packet, PacketName)
    if Packet ~= Ranking_Config.Packet then return false end

    local name = UserGetName()
    local index = UserGetIndex()
    if PacketName == string.format("2-%s-%d", name, index) or PacketName == string.format("3-%s-%d", name, index) then
        Ranking_Config.Players = {}
        local playerCount = GetBytePacket(PacketName, -1)
        for n = 1, playerCount do
            local len =GetBytePacket(PacketName, -1)
            local playerName = GetCharPacketLength(PacketName, -1, len)
            local points = GetDwordPacket(PacketName, -1)
            local tempo = GetDwordPacket(PacketName, -1)
            table.insert(Ranking_Config.Players, n)
            Ranking_Config.Players[n] = {Position = n, Name = playerName, Points = points, Tempo = tempo}
        end
        ClearPacket(PacketName)
        if PacketName == string.format("2-%s-%d", name, index) then
            Ranking.Open()
        end
        return true
    end

end

function Ranking.RequestData(t)
    local name = UserGetName()
    local index = UserGetIndex()
    local PacketName = string.format("1-%s-%d", name, index)
    CreatePacket(PacketName, Ranking_Config.Packet)
	SetBytePacket(PacketName, t)
    SetBytePacket(PacketName, Ranking_Config.CurrentCategorie)
	SendPacket(PacketName)
	ClearPacket(PacketName)
end

Ranking.Init()

return Ranking
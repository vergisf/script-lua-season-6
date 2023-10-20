Auction = {}
Auction.Started = false

function Auction.Init()
    InterfaceController.MainProc(Auction.Interface)
    InterfaceController.InterfaceClickEvent(Auction.ClickEvent)
    InterfaceController.UpdateProc(Auction.Update)
    InterfaceController.UpdateMouse(Auction.Update)
    InterfaceController.ClientProtocol(Auction.Protocol)
    Auction.Define()
end

function Auction.Define()
    Auction_Config.Button = {}
    Auction_Config.ButtonID = {
        abrir = 1,
        fechar = 2,
        lance = 3,
    }

    Auction_Config.Info = {
        Nome = "",
        Item = {
            Index = 0,
            Level = 0,
            Skill = 0,
            Luck = 0,
            JoL = 0,
            Exc = 0,
            X = 0,
            Y = 0,
            W = 0,
            H = 0
        },
        Lance = 0,
        Moeda = 1,
        Jogador  = "",
        Valor = 0
    }
end

function Auction.CreateButton(ButtonID, x, y, w, h)
	if Auction_Config.Button[ButtonID] == nil then
		table.insert(Auction_Config.Button, ButtonID)
		Auction_Config.Button[ButtonID] = {
			x = x,
			y = y,
			w = w,
			h = h,
			clicked = false,
			timer = 0
		}
	else
		Auction_Config.Button[ButtonID].x = x
		Auction_Config.Button[ButtonID].y = y
		Auction_Config.Button[ButtonID].w = w
		Auction_Config.Button[ButtonID].h = h
	end
end

function Auction.ButtonClicked(ButtonID)
	if Auction_Config.Button[ButtonID] == nil then return false end
	if Auction_Config.Button[ButtonID].clicked then
		if Auction_Config.Button[ButtonID].timer >= 2 then
			Auction_Config.Button[ButtonID].timer = 0
			Auction_Config.Button[ButtonID].clicked = false
			return false
		end
		Auction_Config.Button[ButtonID].timer = Auction_Config.Button[ButtonID].timer + 1
		return true
	end
	return false
end

function Auction.ButtonMouseOver(ButtonID, x, y)
	if Auction_Config.Button[ButtonID] == nil then return false end
	if x >= Auction_Config.Button[ButtonID].x and x <= (Auction_Config.Button[ButtonID].x+Auction_Config.Button[ButtonID].w) then
		if y >= Auction_Config.Button[ButtonID].y and y <= (Auction_Config.Button[ButtonID].y+Auction_Config.Button[ButtonID].h) then
			return true
		end
	end
	return false
end

function Auction.CheckOpen()
    if UICustomInterface == Auction_Config.WindowID then return true else return false end
end

function Auction.Open()
    UICustomInterface = Auction_Config.WindowID
end

function Auction.Close()
    UICustomInterface = 0
end

function Auction.Interface()
    Auction.CreateButton(Auction_Config.ButtonID.abrir, 0, 0, 0, 0)
    Auction.CreateButton(Auction_Config.ButtonID.fechar, 0, 0, 0, 0)
    Auction.CreateButton(Auction_Config.ButtonID.lance, 0, 0, 0, 0)

    if Auction.Started then
        EnableAlphaTest()
        Auction.CreateButton(Auction_Config.ButtonID.abrir, 120, 30, 20, 20)
        RenderImage(590036, 120, 30, 20, 20)
        if Auction.ButtonMouseOver(Auction_Config.ButtonID.abrir, MousePosX(), MousePosY()) then
            SetFontType(0)
            SetTextBg(0,0,0, 200)
            SetTextColor(255,255,255,255)
            RenderText3(110, 20, Auction_Config.Texts[GetLanguage()][1], 40, 3)
        end
        DisableAlphaBlend()
        SetBlend()
        EndDrawBar()
    end

    if not Auction.CheckOpen() then return end

    EnableAlphaTest()
    RenderImage(590003, 450, 0, 190, 429)
    DisableAlphaBlend()
    SetBlend()
    EndDrawBar()

    EnableAlphaTest()
    SetFontType(1)
    SetTextBg(0,0,0, 0)
    SetTextColor(255,255,255,255)
    RenderText3(545, 15, Auction_Config.Texts[GetLanguage()][1], 50, 8)
    DisableAlphaBlend()
    SetBlend()
    EndDrawBar()

    Auction.CreateButton(Auction_Config.ButtonID.fechar, 473, 392, 24, 24)
    RenderImage2(31074, 473, 392, 24, 24, 0.0, 0.0, 0.74512441456, 0.74512441456, 1, 1, 1.0)
    if Auction.ButtonMouseOver(Auction_Config.ButtonID.fechar, MousePosX(), MousePosY()) then
        EnableAlphaTest()
        SetFontType(0)
        SetTextBg(0,0,0, 200)
        SetTextColor(255,255,255,255)
        RenderText3(469, 382, Auction_Config.Texts[GetLanguage()][2], 35, 3)
        DisableAlphaBlend()
        SetBlend()
        EndDrawBar()
    end

    EnableAlphaTest()
    SetFontType(1)
    SetTextBg(0,0,0, 0)
    SetTextColor(255,204,0,255)
    RenderText3(545, 55, Auction_Config.Info.Nome, 150, 8)

    DisableAlphaBlend()
    SetBlend()
    glColor4f(0.0, 0.0, 0.0, 0.6)
    DrawBar(470, 70, 149, 120)
    EndDrawBar()

    EnableAlphaTest()

    for l = 70, 150, 40 do
        RenderImage2(590032, 470, l, 4, 42, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
        RenderImage2(590032, 615, l, 4, 42, 0, 0, 0.64203125, 0.625, 1, 1, 1.0)
    end
    RenderImage2(590023, 470, 70, 149, 4, 0, 0, 0.83203125, 0.6247483, 1, 1, 1.0)
    RenderImage2(590023, 470, 190, 149, 4, 0, 0, 0.83203125, 0.6247483, 1, 1, 1.0)
    

    DisableAlphaBlend()
    SetBlend()
    CreateItem(Auction_Config.Info.Item.X, Auction_Config.Info.Item.Y, Auction_Config.Info.Item.W, Auction_Config.Info.Item.H, Auction_Config.Info.Item.Index, Auction_Config.Info.Item.Level, 0, 0, 1.0)
    EndDrawBar()

    if MousePosX() >= Auction_Config.Info.Item.X and MousePosX() <= Auction_Config.Info.Item.X+Auction_Config.Info.Item.W and MousePosY() > Auction_Config.Info.Item.Y and MousePosY() <= Auction_Config.Info.Item.Y+Auction_Config.Info.Item.H then
        SetBlend()
        ShowItemDescription(MousePosX(), MousePosY(), Auction_Config.Info.Item.Index, Auction_Config.Info.Item.Level, Auction_Config.Info.Item.Skill, Auction_Config.Info.Item.Luck, Auction_Config.Info.Item.JoL, 255, Auction_Config.Info.Item.Exc, 0)
        EndDrawBar()                     
    end

    SetBlend()
    EndDrawBar()
    EnableAlphaTest()
    

    SetFontType(1)
    SetTextBg(0,0,0, 0)
    SetTextColor(0, 128, 255,255)
    RenderText3(545, 205, Auction_Config.Texts[GetLanguage()][3], 150, 8)
    SetTextColor(255, 255, 255, 255)
    RenderText3(545, 215, string.format("%d %s", Auction_Config.Info.Valor, Auction_Config.Moeda[GetLanguage()][Auction_Config.Info.Moeda]), 150, 8)
    if Auction_Config.Info.Jogador ~= 0 or Auction_Config.Info.Jogador ~= "0" or Auction_Config.Info.Jogador ~= "" then
        RenderText3(545, 225, Auction_Config.Info.Jogador, 150, 8)
    end

    SetFontType(1)
    SetTextBg(0,0,0, 0)
    SetTextColor(161, 67, 151, 255)
    RenderText3(545, 260, Auction_Config.Texts[GetLanguage()][4], 150, 8)
    SetTextColor(255, 255, 255, 255)
    RenderText3(545, 270, string.format("%d %s", Auction_Config.Info.Lance+Auction_Config.Info.Valor, Auction_Config.Moeda[GetLanguage()][Auction_Config.Info.Moeda]), 150, 8)

    Auction.CreateButton(Auction_Config.ButtonID.lance, 500, 285, 90, 25)
    RenderImage2(590028, 500, 285, 90, 25, 0.0, 0.0, 0.8321874124, 1.0, 1, 1, 1.0)
    if Auction.ButtonMouseOver(Auction_Config.ButtonID.lance, MousePosX(), MousePosY()) then
        if not Auction.ButtonClicked(Auction_Config.ButtonID.lance) then
            DisableAlphaBlend()
            SetBlend()
            glColor4f(0.5, 0.5, 0.5, 0.2)
            DrawBar(500, 285, 90, 25)
            SetBlend()
            EndDrawBar()
            EnableAlphaTest()
        end
    end
    SetFontType(1)
    SetTextBg(0,0,0, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText3(545, 293, Auction_Config.Texts[GetLanguage()][5], 150, 8)

    SetFontType(1)
    SetTextBg(0,0,0, 0)
    SetTextColor(200, 10, 10, 200)
    RenderText3(545, 320, Auction_Config.Texts[GetLanguage()][6], 150, 8)
    SetFontType(0)
    SetTextColor(255, 255, 255, 200)
    RenderText3(545, 330, Auction_Config.Texts[GetLanguage()][7], 150, 8)
    RenderText3(545, 340, Auction_Config.Texts[GetLanguage()][8], 150, 8)


    DisableAlphaBlend()
    SetBlend()

    CreateItem(Auction_Config.Info.Item.X, Auction_Config.Info.Item.Y, Auction_Config.Info.Item.W, Auction_Config.Info.Item.H, Auction_Config.Info.Item.Index, Auction_Config.Info.Item.Level, 0, 0, 1.0)
    EndDrawBar()

    if MousePosX() >= Auction_Config.Info.Item.X and MousePosX() <= Auction_Config.Info.Item.X+Auction_Config.Info.Item.W and MousePosY() > Auction_Config.Info.Item.Y and MousePosY() <= Auction_Config.Info.Item.Y+Auction_Config.Info.Item.H then
        SetBlend()
        ShowItemDescription(MousePosX(), MousePosY(), Auction_Config.Info.Item.Index, Auction_Config.Info.Item.Level, Auction_Config.Info.Item.Skill, Auction_Config.Info.Item.Luck, Auction_Config.Info.Item.JoL, 255, Auction_Config.Info.Item.Exc, 0)
        EndDrawBar()                     
    end

    SetBlend()
    EndDrawBar()
end

function Auction.ClickEvent()
    if Auction.Started then
        if Auction.ButtonMouseOver(Auction_Config.ButtonID.abrir, MousePosX(), MousePosY()) then
            DisableClickClient()
            if not Auction.CheckOpen() then
                Auction.Open()
                return true
            end
        end
    end

    if not Auction.CheckOpen() then return end

    if Auction.ButtonMouseOver(Auction_Config.ButtonID.fechar, MousePosX(), MousePosY()) then
        Auction.Close()
        return true
    end

    if Auction.ButtonMouseOver(Auction_Config.ButtonID.lance, MousePosX(), MousePosY()) then
        Auction_Config.Button[Auction_Config.ButtonID.lance].clicked = true
        local name = UserGetName()
        local index = UserGetIndex()
        local PacketName = string.format("1-%s-%d", name, index)
        CreatePacket(PacketName, Auction_Config.Packet)
        local lance = Auction_Config.Info.Valor+Auction_Config.Info.Lance
	    SetDwordPacket(PacketName, lance)
	    SendPacket(PacketName)
	    ClearPacket(PacketName)
        return true
    end

end

function Auction.Update()
    if Auction.Started then
        if Auction.ButtonMouseOver(Auction_Config.ButtonID.abrir, MousePosX(), MousePosY()) then
            DisableClickClient()
        end
    else
        if Auction.CheckOpen() then Auction.Close() end 
    end

    if not Auction.CheckOpen() then return end

    if MousePosX() >= 450 then
        DisableClickClient()
    end
    if	CheckWindowOpen(UIInventory) 		== 1	then	CloseWindow(UIInventory) 		end
    if	CheckWindowOpen(UIFriendList) 		== 1	then	CloseWindow(UIFriendList) 		end
    if	CheckWindowOpen(UIMoveList)			== 1	then	CloseWindow(UIMoveList)			end
    if	CheckWindowOpen(UIParty) 			== 1	then	CloseWindow(UIParty)		    end
    if	CheckWindowOpen(UIQuest) 			== 1	then	CloseWindow(UIQuest) 			end
    if	CheckWindowOpen(UIGuild) 			== 1	then	CloseWindow(UIGuild)            end
    if	CheckWindowOpen(UITrade) 			== 1	then	CloseWindow(UITrade)            end
    if	CheckWindowOpen(UIWarehouse) 		== 1	then	CloseWindow(UIWarehouse) 		end
    if	CheckWindowOpen(UIChaosBox)			== 1	then	CloseWindow(UIChaosBox)			end
    if	CheckWindowOpen(UICommandWindow) 	== 1	then	CloseWindow(UICommandWindow) 	end
    if	CheckWindowOpen(UIPetInfo)	 		== 1	then	CloseWindow(UIPetInfo)	 		end
    if	CheckWindowOpen(UIShop)				== 1	then	CloseWindow(UIShop)	 	    	end
    if	CheckWindowOpen(UIStore) 			== 1	then	CloseWindow(UIStore) 			end
    if	CheckWindowOpen(UIOtherStore) 		== 1	then	CloseWindow(UIOtherStore) 		end
    if	CheckWindowOpen(UICharacter) 		== 1	then	CloseWindow(UICharacter)        end
    if	CheckWindowOpen(UIOptions) 			== 1	then	CloseWindow(UIOptions) 			end
    if	CheckWindowOpen(UIHelp)				== 1	then	CloseWindow(UIHelp)				end
    if	CheckWindowOpen(UIFastDial)			== 1	then	CloseWindow(UIFastDial)			end
    if	CheckWindowOpen(UISkillTree) 		== 1	then	CloseWindow(UISkillTree) 		end
    if	CheckWindowOpen(UINPC_Titus) 		== 1	then	CloseWindow(UINPC_Titus) 		end
    if	CheckWindowOpen(UICashShop)			== 1	then	CloseWindow(UICashShop)			end
    if	CheckWindowOpen(UIFullMap) 			== 1	then	CloseWindow(UIFullMap) 			end
    if	CheckWindowOpen(UINPC_Dialog)		== 1	then	CloseWindow(UINPC_Dialog)		end
    if	CheckWindowOpen(UIGensInfo)			== 1	then	CloseWindow(UIGensInfo)			end
    if	CheckWindowOpen(UINPC_Julia)		== 1	then	CloseWindow(UINPC_Julia)		end
    if	CheckWindowOpen(UIExpandInventory)	== 1	then	CloseWindow(UIExpandInventory)	end
    if	CheckWindowOpen(UIExpandWarehouse)	== 1	then	CloseWindow(UIExpandWarehouse)	end
    if	CheckWindowOpen(UIMuHelper)			== 1	then	CloseWindow(UIMuHelper)			end
    
end

function Auction.Protocol(Packet, PacketName)
    if Packet ~= Auction_Config.Packet then return false end
    if PacketName == "AuctionUpdate" then
        local started = GetBytePacket(PacketName, -1)
        if started == 1 then
            Auction.Started = true
        else
            Auction.Started = false
        end
        local len = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Nome = GetCharPacketLength(PacketName, -1, len)
        Auction_Config.Info.Moeda = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Item.Index = GetWordPacket(PacketName, -1)
        Auction_Config.Info.Item.Level = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Item.Skill = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Item.Luck = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Item.JoL = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Item.Exc = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Item.X = GetWordPacket(PacketName, -1)
        Auction_Config.Info.Item.Y = GetWordPacket(PacketName, -1)
        Auction_Config.Info.Item.W = GetWordPacket(PacketName, -1)
        Auction_Config.Info.Item.H = GetWordPacket(PacketName, -1)
        Auction_Config.Info.Lance = GetDwordPacket(PacketName, -1)
        Auction_Config.Info.Valor = GetDwordPacket(PacketName, -1)
        len = GetBytePacket(PacketName, -1)
        Auction_Config.Info.Jogador = GetCharPacketLength(PacketName, -1, len)
        ClearPacket(PacketName)
        return true
    end

    if PacketName == "AuctionEnd" then
        ClearPacket(PacketName)
        Auction.Started = false
        Auction.Close()
        Auction.Define()
        return true
    end
end

Auction.Init()

return Auction
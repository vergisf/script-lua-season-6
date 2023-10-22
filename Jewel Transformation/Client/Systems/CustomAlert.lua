CustomAlert = {}

local Private_Config = {
    showAlert = false,
    slotJoia = -1,
    slotTarget = -1,
    tableButtons = {}
}

function CustomAlert.Init()
    if CustomAlert_Config.enable then
        InterfaceController.MainProc(CustomAlert.MainProc)
        InterfaceController.InterfaceClickEvent(CustomAlert.InterfaceClickEvent)
        InterfaceController.ClientProtocol(CustomAlert.ClientProtocol)
        InterfaceController.UpdateMouse(CustomAlert.UpdateMouse)
    end
end

function CustomAlert.MainProc()
    if Private_Config.showAlert then
        EnableAlphaTest()

        CustomAlert.MakeWindowAlert()
        CustomAlert.MakeButtonConfirm()
        CustomAlert.MakeButtonCancel()

        DisableAlphaBlend()
    end
end

function CustomAlert.InterfaceClickEvent()
    if CustomAlert.CheckButton(CustomAlert_Config.buttons.buttonConfirm.index, MousePosX(), MousePosY(), Private_Config.tableButtons) then
        if CustomAlert.isOpen() then
            local packetName = string.format("CustomAlertSend-%s", UserGetName())
            CreatePacket(packetName, CustomAlert_Config.packget)
            SetBytePacket(packetName, Private_Config.slotJoia)
            SetBytePacket(packetName, Private_Config.slotTarget)
            SendPacket(packetName, UserGetIndex())
            ClearPacket(packetName)
            CustomAlert.Close()
        end
    end

    if CustomAlert.CheckButton(CustomAlert_Config.buttons.buttonCancel.index, MousePosX(), MousePosY(), Private_Config.tableButtons) then
        if CustomAlert.isOpen() then
            CustomAlert.Close()
        end
    end
end

function CustomAlert.ClientProtocol(packet, packetName)
    if packet == CustomAlert_Config.packget then
        local namePacket = string.format("CustomAlert-%s", UserGetName())
        if packetName == namePacket then
            if not CustomAlert.isOpen() then
                Private_Config.slotJoia = GetBytePacket(namePacket, -1)
                Private_Config.slotTarget = GetBytePacket(namePacket, -1)
                
                ClearPacket(namePacket)

                CustomAlert.Open()
            end
        end
    end
end

function CustomAlert.UpdateMouse()
    if Private_Config.showAlert then
		DisableClickClient()
	end
end

--[[ Private Functions, Make View ]]--
function CustomAlert.Open()
    Private_Config.showAlert = true
    UICustomInterface = CustomAlert_Config.window
end

function CustomAlert.Close()
    Private_Config.showAlert = false
    UICustomInterface = 0
end

function CustomAlert.isOpen()
    if Private_Config.showAlert and UICustomInterface == CustomAlert_Config.window then
        return true
    end
    
    return false
end

function CustomAlert.MakeWindowAlert()
	SetBlend()
	glColor4f(CustomAlert_Config.principalView.color.r, CustomAlert_Config.principalView.color.g, CustomAlert_Config.principalView.color.b, CustomAlert_Config.principalView.color.alpha)
    
	DrawBar(CustomAlert_Config.principalView.x, CustomAlert_Config.principalView.y, CustomAlert_Config.principalView.width, CustomAlert_Config.principalView.heigth)
	EndDrawBar()
    
    GLSwitchBlend()
	glColor3f(1.0, 1.0, 1.0)
	GLSwitch()
	glColor3f(1.0, 1.0, 1.0)

    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 255, 255, 255)
    RenderText2(CustomAlert_Config.principalView.x, CustomAlert_Config.principalView.y+12, CustomAlert_Config.principalView.text[1], 191, ALIGN_CENTER)
    RenderText2(CustomAlert_Config.principalView.x, CustomAlert_Config.principalView.y+19, CustomAlert_Config.principalView.text[2], 191, ALIGN_CENTER)
end

function CustomAlert.MakeButtonConfirm()
    CustomAlert.CreateButton(CustomAlert_Config.buttons.buttonConfirm.index, CustomAlert_Config.buttons.buttonConfirm.x, CustomAlert_Config.buttons.buttonConfirm.y, CustomAlert_Config.buttons.buttonConfirm.width, CustomAlert_Config.buttons.buttonConfirm.heigth, Private_Config.tableButtons)

    SetBlend()
    if CustomAlert.CheckButton(CustomAlert_Config.buttons.buttonConfirm.index, MousePosX(), MousePosY(), Private_Config.tableButtons) then
        glColor4f(CustomAlert_Config.buttons.buttonConfirm.colorHover.r, CustomAlert_Config.buttons.buttonConfirm.colorHover.g, CustomAlert_Config.buttons.buttonConfirm.colorHover.b, CustomAlert_Config.buttons.buttonConfirm.colorHover.alpha)
    else 
        glColor4f(CustomAlert_Config.buttons.buttonConfirm.color.r, CustomAlert_Config.buttons.buttonConfirm.color.g, CustomAlert_Config.buttons.buttonConfirm.color.b, CustomAlert_Config.buttons.buttonConfirm.color.alpha)
    end
    
    DrawBar(CustomAlert_Config.buttons.buttonConfirm.x, CustomAlert_Config.buttons.buttonConfirm.y, CustomAlert_Config.buttons.buttonConfirm.width, CustomAlert_Config.buttons.buttonConfirm.heigth)
    EndDrawBar()
    
    GLSwitchBlend()
	glColor3f(1.0, 1.0, 1.0)
	GLSwitch()
	glColor3f(1.0, 1.0, 1.0)

    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 149, 0, 255)
    RenderText2(CustomAlert_Config.buttons.buttonConfirm.x, CustomAlert_Config.buttons.buttonConfirm.y+5, CustomAlert_Config.buttons.buttonConfirm.title, 50, ALIGN_CENTER)
end

function CustomAlert.MakeButtonCancel()
    CustomAlert.CreateButton(CustomAlert_Config.buttons.buttonCancel.index, CustomAlert_Config.buttons.buttonCancel.x, CustomAlert_Config.buttons.buttonCancel.y, CustomAlert_Config.buttons.buttonCancel.width, CustomAlert_Config.buttons.buttonCancel.heigth, Private_Config.tableButtons)
    
    SetBlend()

    if CustomAlert.CheckButton(CustomAlert_Config.buttons.buttonCancel.index, MousePosX(), MousePosY(), Private_Config.tableButtons) then
        glColor4f(CustomAlert_Config.buttons.buttonCancel.colorHover.r, CustomAlert_Config.buttons.buttonCancel.colorHover.g, CustomAlert_Config.buttons.buttonCancel.colorHover.b, CustomAlert_Config.buttons.buttonCancel.colorHover.alpha)
    else 
        glColor4f(CustomAlert_Config.buttons.buttonCancel.color.r, CustomAlert_Config.buttons.buttonCancel.color.g, CustomAlert_Config.buttons.buttonCancel.color.b, CustomAlert_Config.buttons.buttonCancel.color.alpha)
    end
    
    DrawBar(CustomAlert_Config.buttons.buttonCancel.x, CustomAlert_Config.buttons.buttonCancel.y, CustomAlert_Config.buttons.buttonCancel.width, CustomAlert_Config.buttons.buttonCancel.heigth)
    EndDrawBar()
    
    GLSwitchBlend()
	glColor3f(1.0, 1.0, 1.0)
	GLSwitch()
	glColor3f(1.0, 1.0, 1.0)

    SetFontType(1)
    SetTextBg(255, 255, 255, 0)
    SetTextColor(255, 149, 0, 255)
    RenderText2(CustomAlert_Config.buttons.buttonCancel.x, CustomAlert_Config.buttons.buttonCancel.y+5, CustomAlert_Config.buttons.buttonCancel.title, 50, ALIGN_CENTER)
end

function CustomAlert.CreateButton(IdBotao, X, Y, W, H, tableParam)
	if tableParam[IdBotao] == nil then
		table.insert(tableParam, IdBotao)
	end
	tableParam[IdBotao] = {X1 = X, X2 = X+W, Y1 = Y, Y2 = Y+H}
end

function CustomAlert.CheckButton(IdBotao, X, Y, tableParam)
	if tableParam[IdBotao] == nil then return false end
	if X >= tableParam[IdBotao].X1 and X <= tableParam[IdBotao].X2 and Y >= tableParam[IdBotao].Y1 and Y <= tableParam[IdBotao].Y2 then
		return true
	end
	return false
end

CustomAlert.Init()

return CustomAlert
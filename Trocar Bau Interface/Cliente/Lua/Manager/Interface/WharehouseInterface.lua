WharehouseInterface = {}

WharehouseInterface.Alfabeto = {}
WharehouseInterface.Alfabeto = {
	AlterarText = {[48] = "0",[49] = "1",[50] = "2",[51] = "3",[52] = "4",[53] = "5",[54] = "6",[55] = "7",[56] = "8",[57] = "9",[96] = "0",[97] = "1",[98] = "2",[99] = "3",[100] = "4",[101] = "5",[102] = "6",[103] = "7",[104] = "8",[105] = "9"},
}

WharehouseInterface.TextArea = {}
WharehouseInterface.TextArea = {
    AlterarText = {onFocus = false, timer = 0, Text = "", cursor = "|", Source = 0},
}

local imagesWarehouse = {
	[0] = {image = -1},
	[1] = {image = -1},
	[2] = {image = -1},
	[3] = {image = -1}
}

local wharehouseInterfaceSwitch = true

local vaultPName = 'WHouse_%s'
local vaultChange = 'WHouse_Change_%s'
local vaultPNumber = 0x66

local openSetNumberVault = false
local clickedTextArea = false

local vaultCounts = 0
local lastVault = 0

local table_butons_system = {}

function WharehouseInterface.Init()
	if wharehouseInterfaceSwitch then
		InterfaceController.ClientProtocol(WharehouseInterface.ClientProtocol)
		InterfaceController.MainProc(WharehouseInterface.MakeInterface)
		InterfaceController.InterfaceClickEvent(WharehouseInterface.InterfaceClickEvent)
		InterfaceController.MainProcWorldKey(WharehouseInterface.KeyListener)
		InterfaceController.UpdateKey(WharehouseInterface.UpdateKey)
		InterfaceController.UpdateMouse(WharehouseInterface.UpdateMouse)
		InterfaceController.LoadImages(WharehouseInterface.LoadImages)
	end
end

function WharehouseInterface.LoadImages()
	imagesWarehouse[0].image = LoadImageByDir("Interface///btn-back-letf-higt.tga")
	imagesWarehouse[1].image = LoadImageByDir("Interface///btn-back-letf-noclick.tga")
	imagesWarehouse[2].image = LoadImageByDir("Interface///btn-back-rigth-click.tga")
	imagesWarehouse[3].image = LoadImageByDir("Interface///btn-back-rigth-noclick.tga")
end

function WharehouseInterface.MakeInterface()
	if CheckWindowOpen(UIWarehouse) == 0 then return end
	WharehouseInterface.MakeView()
end

function WharehouseInterface.MakeView()
	EnableAlphaTest()

	SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.8)

	GLSwitchBlend()

	glColor3f(1.0, 1.0, 1.0)

	SetFontType(1)

	SetTextBg(0, 0, 0, 255)

	SetTextColor(217, 135, 25, 255)

	Utils.CreateButton(3, 315, 11, 80, 10, table_butons_system)
	if Utils.CheckButton(3, MousePosX(), MousePosY(), table_butons_system) then
		SetTextColor(217, 135, 25, 150)
		RenderText2(315, 11, string.format('Baú: %d | Total: %d', lastVault, vaultCounts), 80, ALIGN_CENTER)
	else
		if openSetNumberVault then
			SetTextColor(217, 135, 25, 150)
		end
		RenderText2(315, 11, string.format('Baú: %d | Total: %d', lastVault, vaultCounts), 80, ALIGN_CENTER)
	end

	Utils.CreateButton(1, 300, 7, 15, 15, table_butons_system)
	if lastVault > 0 then
		if Utils.CheckButton(1, MousePosX(), MousePosY(), table_butons_system) and not openSetNumberVault then
			RenderImage(imagesWarehouse[0].image, 300, 7, 15, 15)
		else
			RenderImage(imagesWarehouse[1].image, 300, 7, 15, 15)
		end
	end

	Utils.CreateButton(2, 395, 7, 15, 17, table_butons_system)
	if lastVault < vaultCounts then
		if Utils.CheckButton(2, MousePosX(), MousePosY(), table_butons_system) and not openSetNumberVault then
			RenderImage(imagesWarehouse[2].image, 395, 7, 15, 15)
		else
			RenderImage(imagesWarehouse[3].image, 395, 7, 15, 15)
		end
	end

	if openSetNumberVault then 
		Utils.CreateButton(4, 315, 65, 35, 15, table_butons_system)
		Utils.CreateButton(5, 360, 65, 35, 15, table_butons_system)

		Utils.MakeDrawWindow(310, 27, 0.0, 0.0, 0.0, 0.8, 90, 60)

		Utils.CreateButton(6, 320, 41, 70, 17, table_butons_system)
		Utils.MakeDrawWindow(320, 41, 0.5, 0.5, 0.5, 0.4, 70, 17)

		SetTextBg(255, 255, 255, 0)

		if Utils.CheckButton(4, MousePosX(), MousePosY(), table_butons_system) then
			SetTextColor(52, 184, 0, 255)
			Utils.MakeDrawWindow(315, 65, 0.5, 0.5, 0.5, 0.9, 35, 15)
		else 
			SetTextColor(217, 135, 25, 255)
			Utils.MakeDrawWindow(315, 65, 0.5, 0.5, 0.5, 0.6, 35, 15)
		end
		RenderText2(315, 69, string.format('Alterar'), 35, ALIGN_CENTER)

		if Utils.CheckButton(5, MousePosX(), MousePosY(), table_butons_system) then 
			SetTextColor(52, 184, 0, 255)
			Utils.MakeDrawWindow(360, 65, 0.5, 0.5, 0.5, 0.9, 35, 15)
		else
			SetTextColor(217, 135, 25, 255)
			Utils.MakeDrawWindow(360, 65, 0.5, 0.5, 0.5, 0.6, 35, 15)
		end
		RenderText2(360, 69, string.format('Fechar'), 35, ALIGN_CENTER)
		
		SetTextColor(217, 135, 25, 255)
		RenderText2(310, 28, string.format('Alterar Baú'), 90, ALIGN_CENTER)
	end

	if clickedTextArea then
		WharehouseInterface.MakeTextArea()
		if WharehouseInterface.TextArea == "" then
			WharehouseInterface.TextArea.AlterarText.Text = tostring(lastVault)
		end
	end

	GLSwitch()
	glColor3f(1.0, 1.0, 1.0)

	DisableAlphaBlend()
end

function WharehouseInterface.MakeTextArea()
	if WharehouseInterface.TextArea.AlterarText.onFocus then
		if WharehouseInterface.TextArea.AlterarText.timer >= 8 then
			if WharehouseInterface.TextArea.AlterarText.timer >= 16 then
				WharehouseInterface.TextArea.AlterarText.timer = 0
			end
			RenderText2(320, 46, WharehouseInterface.TextArea.AlterarText.Text, 70, ALIGN_CENTER)
		else
			RenderText2(320, 46, WharehouseInterface.TextArea.AlterarText.Text..WharehouseInterface.TextArea.AlterarText.cursor, 70, ALIGN_CENTER)
		end

		WharehouseInterface.TextArea.AlterarText.timer = WharehouseInterface.TextArea.AlterarText.timer + 1
	else
		WharehouseInterface.TextArea.AlterarText.timer = 90
		RenderText2(320, 46, WharehouseInterface.TextArea.AlterarText.Text, 70, ALIGN_CENTER)
	end
end

function WharehouseInterface.InterfaceClickEvent()
	if Utils.CheckButton(1, MousePosX(), MousePosY(), table_butons_system) and (lastVault > 0) and not openSetNumberVault then
		local newVault = lastVault-1
		WharehouseInterface.SendPacket(newVault)

		return true
	end

	if Utils.CheckButton(2, MousePosX(), MousePosY(), table_butons_system) and (lastVault < vaultCounts) and not openSetNumberVault then
		local newVault = lastVault+1
		WharehouseInterface.SendPacket(newVault)

		return true
	end

	if Utils.CheckButton(3, MousePosX(), MousePosY(), table_butons_system) then
		openSetNumberVault = true
		return true
	end

	if Utils.CheckButton(4, MousePosX(), MousePosY(), table_butons_system) then
		if WharehouseInterface.TextArea.AlterarText.onFocus then 
			local vaultSelect = tonumber(WharehouseInterface.TextArea.AlterarText.Text)
			WharehouseInterface.SendPacket(vaultSelect)
			WharehouseInterface.Close()

			return true
		end
	end

	if Utils.CheckButton(5, MousePosX(), MousePosY(), table_butons_system) then
		WharehouseInterface.Close()

		return true
	end

	if Utils.CheckButton(6, MousePosX(), MousePosY(), table_butons_system) and openSetNumberVault then
		clickedTextArea = true
		WharehouseInterface.TextArea.AlterarText.onFocus = true

		return true
	end
end

function WharehouseInterface.KeyListener(key)

	if Keys.Escape == key then
		WharehouseInterface.Close()
	end

	if WharehouseInterface.TextArea.AlterarText.onFocus then
		if WharehouseInterface.Alfabeto.AlterarText[key] ~= nil then
			if string.len(WharehouseInterface.TextArea.AlterarText.Text) < 3 then
				WharehouseInterface.TextArea.AlterarText.Text = WharehouseInterface.TextArea.AlterarText.Text..WharehouseInterface.Alfabeto.AlterarText[key]
				WharehouseInterface.TextArea.AlterarText.timer = 0
			end

			return true
		end
	end
end

function WharehouseInterface.UpdateKey()
	if WharehouseInterface.TextArea.AlterarText.onFocus then
		if CheckWindowOpen(UIChatWindow) ~= 1 then
			if CheckRepeatKey(8) == 1 then
				if string.len(WharehouseInterface.TextArea.AlterarText.Text) > 0 then
					WharehouseInterface.TextArea.AlterarText.Text = WharehouseInterface.TextArea.AlterarText.Text:sub(1, -2)
					DisableClickClient()
					return
				end
			end
		end
	end
end

function WharehouseInterface.UpdateMouse()
	if openSetNumberVault then
		DisableClickClient()
	end
end

function WharehouseInterface.ChangeFocus(id)
    if id == 1 then
        WharehouseInterface.TextArea.AlterarText.onFocus = true
        return
    end

    WharehouseInterface.TextArea.AlterarText.onFocus = false
end

function WharehouseInterface.ClientProtocol(packet, packetName)
	local name = UserGetName()
	local pName = string.format(vaultPName, name)

	if packet == vaultPNumber then
		if packetName == pName then
			vaultCounts = GetDwordPacket(packetName, -1)
			lastVault = GetDwordPacket(packetName, -1)
		end

		ClearPacket(packetName)
	end
end

function WharehouseInterface.SendPacket(numberVault)
	local name = UserGetName()
	local pName = string.format(vaultChange, name)

	CloseWindow(UIWarehouse)

	CreatePacket(pName, vaultPNumber)
	SetDwordPacket(pName, numberVault)
	SendPacket(pName)
	ClearPacket(pName)
end

function WharehouseInterface.Close()
	openSetNumberVault = false
	clickedTextArea = false
	WharehouseInterface.TextArea.AlterarText.Text = ""
	WharehouseInterface.TextArea.AlterarText.onFocus = false
end

WharehouseInterface.Init()

return WharehouseInterface
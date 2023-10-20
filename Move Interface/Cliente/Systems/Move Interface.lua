MoveCustomInterface = {}

local MoveCustom_Packet = MoveCustom.packetCode

local moveWindow = MoveCustom.interfaceNumber
local clickedM = false

local MoveCustomInterface_Buttons = {}
local MoveCustomInterface_ButtonsId = {
	closeButton = 1
}

local MoveCustomInterfaceSwitch = true

local isClickedMap = false
local backButton = false
local mapSelect = ''

local imagesLoad = {
	background = -1,
	closeButton = -1,
   	closeBtnHover = -1
}

function MoveCustomInterface.Init()
	if MoveCustomInterfaceSwitch then
		InterfaceController.MainProc(MoveCustomInterface.MakeInterface)
		InterfaceController.MainProcWorldKey(MoveCustomInterface.CheckKeyPressed)
		InterfaceController.ClientProtocol(MoveCustomInterface.ClientProtocol)
		InterfaceController.InterfaceClickEvent(MoveCustomInterface.InterfaceClickEvent)
		InterfaceController.LoadImages(MoveCustomInterface.LoadImages)
	end
end

function MoveCustomInterface.LoadImages()
	imagesLoad.background = LoadImageByDir(MoveCustom.imagesLoad.background)
	imagesLoad.closeButton = LoadImageByDir(MoveCustom.imagesLoad.closeButton)
	imagesLoad.closeBtnHover = LoadImageByDir(MoveCustom.imagesLoad.closeBtnHover)
end

function MoveCustomInterface.MakeInterface()
	if UICustomInterface == moveWindow then
		if not Utils.CheckWindow() then
			MoveCustomInterface.MakeBackgroundView()
			MoveCustomInterface.MakeCloseButton()
		else 
			MoveCustomInterface.Close()
		end
	end
end

function MoveCustomInterface.MakeBackgroundView()
    RenderImage2(imagesLoad.background, 107, 86, 437, 308, 0.003000, -0.002000, 0.729000, 0.821000, 1, 1, 1)
end

function MoveCustomInterface.MakeCloseButton()
	Utils.CreateButton(MoveCustomInterface_ButtonsId.closeButton, 500, 096, 24, 24, MoveCustomInterface_Buttons)
    RenderImage2(imagesLoad.closeButton, 500, 096, 24, 24, -0.012000, -0.007000, 0.546000, 0.582000, 1, 1, 1)
    
    if Utils.CheckButton(MoveCustomInterface_ButtonsId.closeButton, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
        RenderImage2(imagesLoad.closeButtonHover, 500, 096, 24, 24, -0.012000, -0.007000, 0.546000, 0.582000, 1, 1, 1)

        SetFontType(1)
        SetTextBg(0, 0, 0, 255)
        SetTextColor(255, 255, 255, 255)
        RenderText2(506, 100, string.format('Fechar tela'), 40, ALIGN_CENTER)
    end
end

function MoveCustomInterface.MakeInterfaceMove()
	EnableAlphaTest()

	SetBlend()
	glColor4f(0.0, 0.0, 0.0, 0.8)

	DrawBar(200, 138, 205, 149)

	EndDrawBar()
	GLSwitchBlend()

	glColor3f(1.0, 1.0, 1.0)

	SetFontType(1)
		
	SetTextBg(255, 255, 255, 0)
	
	SetTextColor(217, 135, 25, 255)
	
	if mapSelect ~= '' then 
		RenderText2(200, 138, string.format('Move | %s', mapSelect), 205, ALIGN_CENTER)
	else
		RenderText2(200, 138, string.format('Moves'), 205, ALIGN_CENTER)
	end

	SetFontType(1)

	if not isClickedMap then 
		for index in ipairs(moveCustomConfigMap) do
			local map = moveCustomConfigMap[index]
			
			Utils.CreateButton(map.index, map.IX, map.IY, map.wdth, map.heigth, MoveCustomInterface_Buttons)
			
			if Utils.CheckButton(map.index, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
				SetTextColor(52, 184, 0, 255)
				Utils.MakeDrawWindow(map.IX, map.IY, 0.5, 0.5, 0.5, 0.9, map.wdth, map.heigth)
			else
				SetTextColor(217, 135, 25, 255)
				Utils.MakeDrawWindow(map.IX, map.IY, 0.5, 0.5, 0.5, 0.6, map.wdth, map.heigth)
			end

			RenderText2(map.alignText[0], map.alignText[1], string.format('%s', map.name), map.wdth, ALIGN_CENTER)
		end
	elseif mapSelect ~= '' then
		local listMoves = moveCustomConfigMoves[mapSelect]
		if listMoves ~= nil then
			for index in ipairs(listMoves) do
				local map = listMoves[index]
				
				Utils.CreateButton(map.index, map.IX, map.IY, map.wdth, map.heigth, MoveCustomInterface_Buttons)
				
				if Utils.CheckButton(map.index, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
					SetTextColor(52, 184, 0, 255)
					Utils.MakeDrawWindow(map.IX, map.IY, 0.5, 0.5, 0.5, 0.9, map.wdth, map.heigth)
				else
					SetTextColor(217, 135, 25, 255)
					Utils.MakeDrawWindow(map.IX, map.IY, 0.5, 0.5, 0.5, 0.6, map.wdth, map.heigth)
				end
				RenderText2(map.alignText[0], map.alignText[1], string.format('%s', map.title), map.wdth, ALIGN_CENTER)
			end
		end
	end

	--Make button close
	Utils.CreateButton(100, 273, 250, 60, 25, MoveCustomInterface_Buttons)
	if Utils.CheckButton(100, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
		SetTextColor(52, 184, 0, 255)
		Utils.MakeDrawWindow(273, 250, 0.5, 0.5, 0.5, 0.9, 60, 25)
	else
		SetTextColor(217, 135, 25, 255)
		Utils.MakeDrawWindow(273, 250, 0.5, 0.5, 0.5, 0.6, 60, 25)
	end
	RenderText2(273, 260, string.format('Fechar'), 60, ALIGN_CENTER)

	if mapSelect ~= '' then
		backButton = true
		Utils.CreateButton(200, 208, 250, 60, 25, MoveCustomInterface_Buttons)
		if Utils.CheckButton(200, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
			Utils.MakeDrawWindow(208, 250, 0.5, 0.5, 0.5, 0.9, 60, 25)
			SetTextColor(52, 184, 0, 255)
		else
			Utils.MakeDrawWindow(208, 250, 0.5, 0.5, 0.5, 0.6, 60, 25)
			SetTextColor(217, 135, 25, 255)
		end
		RenderText2(208, 260, string.format('Voltar'), 60, ALIGN_CENTER)
	end

	GLSwitch()
	glColor3f(1.0, 1.0, 1.0)

	DisableAlphaBlend()
end

function MoveCustomInterface.InterfaceClickEvent()
	if UICustomInterface == moveWindow then
		if Utils.CheckButton(100, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
			MoveCustomInterface.Close()
		elseif not isClickedMap then
			for index in ipairs(moveCustomConfigMap) do
				local map = moveCustomConfigMap[index]
				if Utils.CheckButton(map.index, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
					if map.listMove == true then
						isClickedMap = true
						mapSelect = map.name
						MoveCustomInterface_Buttons = {}
					else
						MoveCustomInterface.SendPacket('GS_MoveCustom', MoveCustom_Packet, map.name, 'nil', map.mapNumber, map.cdX, map.cdY)
						MoveCustomInterface.Close()
					end
				end
			end
		elseif mapSelect ~= '' then
				local listMoves = moveCustomConfigMoves[mapSelect]
				if listMoves ~= nil then
				for index in ipairs(listMoves) do
					local map = listMoves[index]
					if Utils.CheckButton(map.index, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) then
						MoveCustomInterface.SendPacket('GS_MoveCustom', MoveCustom_Packet, mapSelect, map.title, map.mapNumber, map.cdX, map.cdY)
						MoveCustomInterface.Close()
					end
				end

				if Utils.CheckButton(200, MousePosX(), MousePosY(), MoveCustomInterface_Buttons) and backButton then
					mapSelect = ''
					listMoves = nil
					backButton = true
					isClickedMap = false
				end
			end
		end
	end
end

function MoveCustomInterface.SendPacket(packName, packet, map, destination, mapNumber, cx, cy)
	CreatePacket(packName, packet)
	SetCharPacketLength(packName, map, 10)
	SetCharPacketLength(packName, destination, 10)
	SetDwordPacket(packName, mapNumber)
	SetDwordPacket(packName, cx)
	SetDwordPacket(packName, cy)
	SendPacket(packName)
	ClearPacket(packName)
end

function MoveCustomInterface.ClientProtocol(packet, packetName)
	if packet == MoveCustom_Packet then
		if packetName == 'GS_MoveCustom' then
			NamePlayer_Staff = GetCharPacketLength(packetName, -1, 10)
			ClearPacket(packetName)
		end
	end
end

function MoveCustomInterface.CheckKeyPressed(key)
	if Keys.M == key then
		if not clickedM then
			MoveCustomInterface.Open()
		else
			MoveCustomInterface.Close()
		end
	end
end

function MoveCustomInterface.Open()
	if UICustomInterface ~= moveWindow then
		UICustomInterface = moveWindow
		clickedM = true
		LockPlayerWalk()
		SetLockInterfaces()
	end
end

function MoveCustomInterface.Close()
	if UICustomInterface == moveWindow then 
		moveWindow = -1
		clickedM = false
		isClickedMap = false
		mapSelect = ''
		UICustomInterface = 0
		UnlockPlayerWalk()
		SetUnlockInterfaces()
	end
end

MoveCustomInterface.Init()

return MoveCustomInterface
BattlePass = {}

local battlePassSwitch = true
local battlePassWindow = 19983

local images_battlePass = {}
images_battlePass[1] = {
    topImage = 40006,
    premiumImage = 40007,
    freeImage = 40008,
    topImageSmall = 40009,
    boxItem = 40010,
    bottomLeftNormal = 40011,
    bottomLeftHover = 40012,
    bottomRigthNormal = 40013,
    bottomRigthHover = 40014,
    iconPass = 40015,
    closeButton = 40016,
    closeButtonHover = 40017
}

local battles_pass_button = {}

local initalList = 1
local maxIndexListItem = 0
local minIndexListItem = 0

local player = nil

local messagesPass = {}

function BattlePass.Init()
    if battlePassSwitch then
        messagesPass = messagesBattlePass[GetLanguage()]
        
        InterfaceController.MainProc(BattlePass.MainProc)
        InterfaceController.InterfaceClickEvent(BattlePass.InterfaceClickEvent)
        InterfaceController.MainProcWorldKey(BattlePass.InterfaceMainProcWorldKey)

        maxIndexListItem = #battlePass_configItensPremium
        minIndexListItem = ((#battlePass_configItensPremium-#battlePass_configItensPremium) + 1)
    end
end

function BattlePass.MainProc()

    player = UtilsBattlePass.GetInfoUser(UserGetIndex())

    if UICustomInterface == battlePassWindow then
        Utils.EnableAlpha()

        BattlePass.MakeMainView()
        BattlePass.MakeImages()
        BattlePass.MakeItens()

        Utils.DisableAlpha()
    else 
        BattlePass.MakePassIcon()
    end
end

function BattlePass.MakePassIcon()
    Utils.CreateButton(103, 83, 19, 22, 28, battles_pass_button)
    RenderImage2(images_battlePass[1].iconPass, 83, 19, 22, 28, 0.011000, 0.002000, 0.782000, 0.893000, 1, 1, 1)
    if Utils.CheckButton(103, MousePosX(), MousePosY(), battles_pass_button) then
        SetFontType(1)
	    SetTextBg(0, 0, 0, 255)
        SetTextColor(255, 255, 255, 255)
        RenderText2(MousePosX()+3, MousePosY()-7, string.format(messagesPass[01]), 60, ALIGN_CENTER)
        RenderText2(MousePosX()+3, MousePosY(), string.format(messagesPass[02]), 60, ALIGN_CENTER)

        SetLockInterfaces()
    else 
        SetUnlockInterfaces()
    end
end

function BattlePass.MakeImages()

    RenderImage2(images_battlePass[1].topImage, 150, 96, 350, 78, -0.003000, -0.039000, 0.575000, 1.007000, 1, 1, 1)
    
    RenderImage2(images_battlePass[1].boxItem, 125, 187, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)
    RenderImage2(images_battlePass[1].boxItem, 227, 187, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)
    RenderImage2(images_battlePass[1].boxItem, 329, 187, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)
    RenderImage2(images_battlePass[1].boxItem, 431, 187, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)

    RenderImage2(images_battlePass[1].boxItem, 125, 288, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)
    RenderImage2(images_battlePass[1].boxItem, 227, 288, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)
    RenderImage2(images_battlePass[1].boxItem, 329, 288, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)
    RenderImage2(images_battlePass[1].boxItem, 431, 288, 97, 75, 0.082000, 0.196000, 0.405000, 0.585000, 1, 1, 1)

    if (initalList > minIndexListItem) then 
        Utils.CreateButton(100, 220, 265, 25, 25, battles_pass_button)
        if Utils.CheckButton(100, MousePosX(), MousePosY(), battles_pass_button) then
            RenderImage2(images_battlePass[1].bottomLeftHover, 220, 265, 25, 25, 0.024000, 0.080000, 1.030000, 1.026000, 1, 1, 1)
        else 
            RenderImage2(images_battlePass[1].bottomLeftNormal, 220, 265, 25, 25, 0.024000, 0.080000, 1.030000, 1.026000, 1, 1, 1)
        end
    end
    
    if (initalList < maxIndexListItem) then 
        Utils.CreateButton(101, 418, 265, 25, 25, battles_pass_button)
        if Utils.CheckButton(101, MousePosX(), MousePosY(), battles_pass_button) then
            RenderImage2(images_battlePass[1].bottomRigthHover, 418, 265, 25, 25, 0.024000, 0.080000, 1.030000, 1.026000, 1, 1, 1)
        else 
            RenderImage2(images_battlePass[1].bottomRigthNormal, 418, 265, 25, 25, 0.024000, 0.080000, 1.030000, 1.026000, 1, 1, 1)
        end
    end

    Utils.CreateButton(102, 114, 94, 15, 15, battles_pass_button)
    if Utils.CheckButton(102, MousePosX(), MousePosY(), battles_pass_button) then
        RenderImage2(images_battlePass[1].closeButtonHover, 114, 94, 15, 15, 0.020000, 0.249000, 0.687000, 0.561000, 1, 1, 1)

        SetFontType(1)
	    SetTextBg(0, 0, 0, 255)
        SetTextColor(255, 255, 255, 255)
        RenderText2(124, 84, string.format('Fechar tela'), 40, ALIGN_CENTER)
    else 
        RenderImage2(images_battlePass[1].closeButton, 114, 94, 15, 15, 0.020000, 0.249000, 0.687000, 0.561000, 1, 1, 1)
    end
 
end

function BattlePass.MakeItens()
    player = UtilsBattlePass.GetInfoUser(UserGetIndex())
    for index in ipairs(battlePass_configItensPremium[initalList]) do
        local item = battlePass_configItensPremium[initalList][index]
        if item.premiar then
            local itemDesription = battlePass_configItensDetailPremium[item.indexConfigItem]
            if itemDesription ~= nil then 
                Utils.CreateButton(index, item.vxdesc, item.vydesc, 94, 62, battles_pass_button)
                CreateItem(item.vx, item.vy, 94, 62, itemDesription.ItemIndex, 15, 0, 0)

                if item.showDescription then 
                    if Utils.CheckButton(index, MousePosX(), MousePosY(), battles_pass_button) then
                        if item.levelPass > player.level then
                            Utils.MakeDrawWindow(item.vxdesc, item.vydesc, 0.0, 0.67, 0.5025, 0.4, 94, 62)
                            ShowItemDescription(MousePosX(), MousePosY(), itemDesription.ItemIndex, itemDesription.Level, itemDesription.Op1, itemDesription.Op2, itemDesription.Life, itemDesription.SocketBonus, itemDesription.Exc, itemDesription.Ancient)                    
                        else
                            if player.battlePassActive == 0 then
                                Utils.MakeDrawWindow(item.vxdesc, item.vydesc, 0.0, 0.67, 0.5025, 0.2, 94, 62)
                                ShowItemDescription(MousePosX(), MousePosY(), itemDesription.ItemIndex, itemDesription.Level, itemDesription.Op1, itemDesription.Op2, itemDesription.Life, itemDesription.SocketBonus, itemDesription.Exc, itemDesription.Ancient)                    
                            else 
                                Utils.MakeDrawWindow(item.vxdesc+7, item.vydesc+3, 0, 0, 0, 1.0, 85, 30)
                                --Utils.MakeDrawWindow(item.vxdesc, item.vydesc, 1, 0, 0.0667, 0.2, 94, 62)
                                RenderText2(item.vxdesc+7, item.vydesc+3, string.format(messagesPass[10]), 85, ALIGN_CENTER)
                                RenderText2(item.vxdesc+7, item.vydesc+12, string.format(messagesPass[11], GetNameByIndex(itemDesription.ItemIndex)), 85, ALIGN_CENTER)
                                RenderText2(item.vxdesc+7, item.vydesc+22, string.format(messagesPass[12]), 85, ALIGN_CENTER)
                            end
                        end
                    end
                end
                
                local frame = configXY_Text_Level[item.configXY]
                local XP = battlePass_configXPFromLevel[item.levelPass]
                
                SetFontType(1)
                SetTextBg(255, 255, 255, 0)
                SetTextColor(170, 255, 0, 255)
                RenderText2(frame.x, frame.y, string.format(messagesPass[04], item.levelPass, XP.xpLevelPassString), frame.size, ALIGN_CENTER) 
            end
        end
    end

    for index in ipairs(battlePass_configItensFree[initalList]) do
        local item = battlePass_configItensFree[initalList][index]
        if item.premiar then
            local itemDesription = battlePass_configItensDetailFree[item.indexConfigItem]
            if itemDesription ~= nil then
                Utils.CreateButton(index, item.vxdesc, item.vydesc, 94, 62, battles_pass_button)
                CreateItem(item.vx, item.vy, 94, 62, itemDesription.ItemIndex, 15, 0, 0)

                if item.showDescription then 
                    if Utils.CheckButton(index, MousePosX(), MousePosY(), battles_pass_button) then
                        if item.levelPass > player.level then 
                            Utils.MakeDrawWindow(item.vxdesc, item.vydesc, 0.0, 0.67, 0.5025, 0.2, 94, 62)
                            ShowItemDescription(MousePosX(), MousePosY(), itemDesription.ItemIndex, itemDesription.Level, itemDesription.Op1, itemDesription.Op2, itemDesription.Life, itemDesription.SocketBonus, itemDesription.Exc, itemDesription.Ancient)                    
                        else 
                            Utils.MakeDrawWindow(item.vxdesc+7, item.vydesc+3, 0, 0, 0, 1.0, 85, 30)
                            --Utils.MakeDrawWindow(item.vxdesc, item.vydesc, 1, 0, 0.0667, 0.2, 94, 62)
                            RenderText2(item.vxdesc+7, item.vydesc+3, string.format(messagesPass[10]), 85, ALIGN_CENTER)
                            RenderText2(item.vxdesc+7, item.vydesc+12, string.format(messagesPass[11], GetNameByIndex(itemDesription.ItemIndex)), 85, ALIGN_CENTER)
                            RenderText2(item.vxdesc+7, item.vydesc+22, string.format(messagesPass[12]), 85, ALIGN_CENTER)
                        end
                    end
                end
                
                local frame = configXY_Text_Level[item.configXY]
                local XP = battlePass_configXPFromLevel[item.levelPass]
                
                SetFontType(1)
                SetTextBg(255, 255, 255, 0)
                SetTextColor(170, 255, 0, 255)
                RenderText2(frame.x, frame.y, string.format(messagesPass[14], item.levelPass, XP.xpLevelPassString), frame.size, ALIGN_CENTER)
            end
        end
    end
end

function BattlePass.MakeMainView()
    SetFontType(1)

	SetTextBg(255, 255, 255, 0)

    SetTextColor(170, 255, 0, 255)

    Utils.MakeDrawWindow(107, 86, 0.16, 0.16, 0.16, 1.0, 437, 308)
    Utils.MakeDrawWindow(110, 90, 0.0, 0.0, 0.0, 1, 430, 300)

    SetTextColor(170, 255, 0, 255)
    RenderText2(125, 175, string.format(messagesPass[05]), 300, ALIGN_LEFT)
    RenderText2(125, 275, string.format(messagesPass[06]), 300, ALIGN_LEFT)

    local passText = messagesPass[07]
    if player.battlePassActive == 1 then
        passText = messagesPass[08]
    end

    RenderText2(112, 380, string.format(messagesPass[09], player.name, player.vipName, player.level, player.xpPass, passText, battlePassCommandNPCItens), 430, ALIGN_LEFT)
end

function BattlePass.InterfaceClickEvent()
    if UICustomInterface == battlePassWindow then 
        if Utils.CheckButton(100, MousePosX(), MousePosY(), battles_pass_button) and (initalList > minIndexListItem) then
            initalList = initalList - 1

            return true
        end
    
        if Utils.CheckButton(101, MousePosX(), MousePosY(), battles_pass_button) and (initalList < maxIndexListItem) then
            initalList = initalList + 1

            return true
        end
    
        if Utils.CheckButton(102, MousePosX(), MousePosY(), battles_pass_button) then
            if UICustomInterface == battlePassWindow then 
                UICustomInterface = 0

                SetUnlockInterfaces()
            end

            return true
        end
    else 
        if Utils.CheckButton(103, MousePosX(), MousePosY(), battles_pass_button) then
            if UICustomInterface ~= battlePassWindow then
                UICustomInterface = battlePassWindow

                SetLockInterfaces()
            end

            return true
        end
    end
end

function BattlePass.InterfaceMainProcWorldKey(key)
    if UICustomInterface == battlePassWindow then 
        if key == Keys.Escape then
            if UICustomInterface == battlePassWindow then 
                UICustomInterface = 0

                SetUnlockInterfaces()
            end

            return true
        end
    end
end

BattlePass.Init()

return BattlePass

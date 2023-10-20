UtilsBattlePass = {}

local player = {}
local packetUtilsNumber = 0x77
local packetUtilsNameEnter = "UtilsEnter_%s"
local packetUtilsNameBack = "UtilsBack_%s"

function UtilsBattlePass.Init()
    InterfaceController.ClientProtocol(UtilsBattlePass.ClientProtocol)
end

function UtilsBattlePass.ClientProtocol(packet, packetName)
    local name = UserGetName()
	local pNameEnter = string.format(packetUtilsNameEnter, name)
    local pNameBack = string.format(packetUtilsNameBack, name)

    if packet == packetUtilsNumber then
        if packetName == pNameEnter then
            local vip = GetBytePacket(packetName, -1)
            local sizeVipName = GetBytePacket(packetName, -1)
            local vipName = GetCharPacketLength(packetName, -1, sizeVipName)
            local xpPass = GetDwordPacket(packetName, -1)
            local battlePassActive = GetBytePacket(packetName, -1)
            local levelPass = GetBytePacket(packetName, -1)

            UtilsBattlePass.SetInfoUser(UserGetIndex(), name, vip, vipName, levelPass, xpPass, battlePassActive, player, true)

            ClearPacket(pNameEnter)
        elseif packetName == pNameBack then
            UtilsBattlePass.SetInfoUser(UserGetIndex(), nil, nil, nil, nil, nil, nil, player, false)
            ClearPacket(pNameBack)
        end
    end
end

function UtilsBattlePass.GetInfoUser(aIndex)
    return player[aIndex]
end

function UtilsBattlePass.SetInfoUser(aIndex, name, vip, vipName, levelPass, xpPass, battlePassActive, tableParam, isInsert)
	if isInsert then
        if tableParam[aIndex] == nil then
            table.insert(tableParam, aIndex)
        end
        tableParam[aIndex] = {aIndex = aIndex, name = name, vip = vip, vipName = vipName, level = levelPass, xpPass = xpPass, battlePassActive = battlePassActive}
    else
        tableParam[aIndex] = nil
        table.remove(tableParam, aIndex)
    end
end

UtilsBattlePass.Init()

return UtilsBattlePass

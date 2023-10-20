VipCard = {}

function VipCard.Init()
	if VipCard_Config.Enabled then
		InterfaceController.InterfaceClickRightEvent(VipCard.RightClick)
	end
end

function VipCard.RightClick()
   if CheckRepeatKey(Keys.ControlKey) ~= 0 then
        local slot = GetInventoryMouseItemSlot()
	    if slot >= 12 then
            local PacketName = string.format("1-%s-%d", UserGetName(),UserGetIndex())
	    	CreatePacket(PacketName, VipCard_Config.Packet)
	    	SetBytePacket(PacketName, slot)
	    	SendPacket(PacketName)
	    	ClearPacket(PacketName)
	    	return
	    end
   end
end

VipCard.Init()

return VipCard
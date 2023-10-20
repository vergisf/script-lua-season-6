VipCard = {}

function VipCard.Init()
	if VipCard_Config.Enabled then
		GameServerFunctions.GameServerProtocol(VipCard.Protocol)
	end
end

function VipCard.Try(p, slot)
	local pInv = Inventory.new(p:getIndex())
	local acc = p:getAccountID()

	LogAddC(2, string.format("SLOT QUE CHEGOU %d", slot))
	if pInv:isItem(slot) ~= 0 then
		LogAddC(2, string.format("DEPOIS DO IF SLOT QUE CHEGOU %d", slot))
		for i in ipairs(VipCard_Config.Cards) do
			local Card = VipCard_Config.Cards[i]
			if pInv:getIndex(slot) == GET_ITEM(Card.Section, Card.Index) then
				local currentVip = p:getVip()
				if currentVip > Card.Vip then
					SendMessage(VipCard_Config.Message[p:getLanguage()][2], p:getIndex(), 1)
					return
				end

				if currentVip < Card.Vip then
					p:setVip(Card.Vip)
					local query = string.format("UPDATE %s set %s = (GETDATE() + %d) where %s = '%s'", TABLE_VIP, VipCard_Config.ExpireDateColumn, Card.Days, WHERE_VIP, acc)
					CreateAsyncQuery('updatevencimentovip', query, -1, 0)
					DataBaseAsync.SetValue(TABLE_VIP, COLUMN_VIP, Card.Vip, WHERE_VIP, acc)
					DeleteItemCount(p:getIndex(), GET_ITEM(Card.Section, Card.Index), -1, 1)
					SendMessage(string.format(VipCard_Config.Message[p:getLanguage()][3], Card.Name), p:getIndex(), 1)	
					SendMessage(string.format(VipCard_Config.Message[p:getLanguage()][1], Card.Days), p:getIndex(), 1)
					return
				end

				local query = string.format("UPDATE %s set %s = %s + %d where %s = '%s'", TABLE_VIP, VipCard_Config.ExpireDateColumn, VipCard_Config.ExpireDateColumn, Card.Days, WHERE_VIP, acc)
				CreateAsyncQuery('updatevencimentovip', query, -1, 0)
				DeleteItemCount(p:getIndex(), GET_ITEM(Card.Section, Card.Index), -1, 1)
				SendMessage(string.format(VipCard_Config.Message[p:getLanguage()][1], Card.Days), p:getIndex(), 1)
				return
			end
		end
	end
end

function VipCard.Protocol(aIndex, Packet, PacketName)
	if Packet ~= VipCard_Config.Packet then return false end

	local p = User.new(aIndex)
	local pInv = Inventory.new(aIndex)
	
	if PacketName == string.format("1-%s-%d", p:getName(), aIndex) then
		local slot = GetBytePacket(PacketName, -1)
		ClearPacket(PacketName)
		LogAddC(2, string.format("SLOT QUE CHEGOU %d", pInv:isItem(slot)))
		VipCard.Try(p, slot)
		return true
	end
end

VipCard.Init()

return VipCard
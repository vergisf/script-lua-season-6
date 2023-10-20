LimparInventario = {}

function LimparInventario.Init()
	
	if LimparInventario_Ativado then
		GameServerFunctions.GameServerProtocol(LimparInventario.GetPacket)
		Timer.TimeOut(2, LimparInventario.CreateLog)
	end
end

function LimparInventario.CreateLog()
	os.execute("mkdir LOGS\\CLEAR_INVENTORY_LOG")
end

function LimparInventario.GetPacket(aIndex, Packet, PacketName)
	if Packet == LimparInventario_Packet then
		if PacketName == "ClearInv" then
			ClearPacket(PacketName)
			local player = User.new(aIndex)
			local Lang = player:getLanguage()
			local vip = Utils.GetVip(aIndex)
			
			if not LimparInventario_Vip[vip] then
				SendMessage(LimparInventario_Textos[Lang][1],aIndex, 1)				
				return true
			end
			
			local Acc = player:getAccountID()
			local Name = player:getName()
			
			if LimparInventario_Central then
				if LimparInventario_CentralAtivada then
					if not Central.CheckAtivado(Acc) then
						SendMessage(LimparInventario_Textos[Lang][2],aIndex, 1)
						return true
					end
				end
				
				if LimparInventario_CentralLiberada then
					local HWID = Utils.UserGetHWID(aIndex)
					if Central.CheckAtivado(Acc) then
						if not Central.CheckHWID(Acc, HWID) then
							SendMessage(LimparInventario_Textos[Lang][3], aIndex, 1)
							return true
						end
					end
				end
			end
			
			local file = 0
			
			if LimparInventario_Log then
				local dia = os.date("%Y-%m-%d")
				local hora = os.date("%H:%M:%S")
				file = io.open(string.format("LOGS\\CLEAR_INVENTORY_LOG\\%s.txt", dia), 'a')
				file:write(string.format("\n%s [%s][%s] Limpou o inventário, os seguintes itens foram removidos:", hora, Acc, Name))
			end
			local pInv = Inventory.new(aIndex)
			for slot = 12, 75 do
				if pInv:isItem(slot) ~= 0 then
					if LimparInventario_Log then			
						local item = Utils.InventoryGetItemTable(aIndex, slot)
						file:write(string.format("\n	Nome: %s, Serial: %d, Section: %d, Index: %d, Level: %d, Skill: %d, Luck: %d, JoL: %d, Exc: %d, Anciente: %d", item.Nome, item.Serial, item.Section, item.Index, item.Level, item.Skill, item.Luck, item.Option, item.Exc, item.Ancient))
					end
					
					InventoryDeleteItem(aIndex, slot)
					SendInventoryDeleteItem(aIndex, slot)			
				end
			end
			
			if LimparInventario_Log then
				file:write(string.format("\n"))
				file:close()
			end
			
			SendMessage(LimparInventario_Textos[Lang][4], aIndex, 1)
			return true
		end
	end
end

LimparInventario.Init()

return LimparInventario
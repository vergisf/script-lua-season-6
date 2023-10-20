ComprarBau = {}

function ComprarBau.Init()
		
	if ComprarBau_Ativado then
		Commands.Register(ComprarBau_Comando, ComprarBau.Comando)
	end	
end

function ComprarBau.Comando(aIndex)	
	local vip = Utils.GetVip(aIndex)
	local player = User.new(aIndex)
	local baus = DataBase.GetValue(TABLE_MULT_WAREHOUSE, COLUMN_MULT_WAREHOUSE, WHERE_MULT_WAREHOUSE, player:getAccountID())
	
	if baus >= ComprarBau_Maximo[vip] then
		SendMessage(string.format(ComprarBau_Msg1.Texto), aIndex, ComprarBau_Msg1.Cor)
		return
	end
	
	local tp = ""
	if ComprarBau_Moeda[vip].Tipo == 0 then
		tp = player:getAccountID()
	else
		tp = player:getName()
	end
	
	local saldo = DataBase.GetValue(ComprarBau_Moeda[vip].Tabela, ComprarBau_Moeda[vip].Coluna, ComprarBau_Moeda[vip].Where, tp)
	
	if saldo < ComprarBau_Valor[vip] then
		SendMessage(string.format(ComprarBau_Msg2.Texto, ComprarBau_Valor[vip], ComprarBau_Moeda[vip].Nome), aIndex, ComprarBau_Msg2.Cor)
		return
	end
	
	DataBase.SetDecreaseValue(ComprarBau_Moeda[vip].Tabela, ComprarBau_Moeda[vip].Coluna, ComprarBau_Valor[vip], ComprarBau_Moeda[vip].Where, tp)
	DataBase.SetAddValue(TABLE_MULT_WAREHOUSE, COLUMN_MULT_WAREHOUSE, 1, WHERE_MULT_WAREHOUSE, player:getAccountID())
	
	if ComprarBau_UpdateBalance then
		CoinBalanceInterface.UpdateBalance(aIndex)
	end
	SendMessage(string.format(ComprarBau_Msg3.Texto), aIndex, ComprarBau_Msg3.Cor)
	SendMessage(string.format(ComprarBau_Msg4.Texto, baus + 1), aIndex, ComprarBau_Msg4.Cor)
	
	return
end

ComprarBau.Init()

return ComprarBau
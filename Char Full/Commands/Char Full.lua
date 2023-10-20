CharFull = {}

function CharFull.Init()
		
	if not CharFull_Ativado then return end
	
	Commands.Register(CharFull_ComandoPlayer, CharFull.ComandoPlayer)
	Commands.Register(CharFull_ComandoStaff, CharFull.ComandoStaff)
end

function CharFull.ComandoPlayer(aIndex)
	local p = User.new(aIndex)
	local tipo = ""
	if CharFull_Tipo == 0 then tipo = p:getAccountID() else tipo = p:getName() end
	local vip = Utils.GetVip(aIndex)
	local uso = DataBase.GetValue(CharFull_Tabela, CharFull_Coluna, CharFull_Where, tipo)
	
	if uso >= CharFull_MaximoDeUso[vip] then
		SendMessage(string.format(" Vocù atingiu o limite de uso do %s", CharFull_ComandoPlayer), aIndex, ERROR_COLOR)
		return
	end
		
	DataBase.SetAddValue(CharFull_Tabela, CharFull_Coluna, 1, CharFull_Where, tipo)
	
	p:setLevelUpPoint(0)
	p:setStrength(CharFull_Pontos[vip])
	p:setDexterity(CharFull_Pontos[vip])
	p:setEnergy(CharFull_Pontos[vip])
	p:setVitality(CharFull_Pontos[vip])
	
	if p:getClass() == 4 then
		p:setLeaderShip(CharFull_Pontos[vip])
	end
	
	p:setLevel(CharFull_Level[vip])
	
	MoneySend(aIndex)
	SetBP(aIndex)
	CalCharacter(aIndex)
	LevelUpSend(aIndex)

	return
end

function CharFull.ComandoStaff(aIndex, Arguments)
	local p = User.new(aIndex)
	if p:getAuthority() <= 1 then return end
	
	local nick = command:getString(Arguments, 1, 0)
	local tIndex = GetIndex(nick)
	
	if tIndex == -1 then
		SendMessage(string.format("Jogador %s nùo foi localizado", nick), aIndex, 1)
		return
	end
	
	local t = User.new(tIndex)
	t:setLevelUpPoint(0)
	t:setStrength(CharFull_PontosStaff)
	t:setDexterity(CharFull_PontosStaff)
	t:setEnergy(CharFull_PontosStaff)
	t:setVitality(CharFull_PontosStaff)
	
	if t:getClass() == 4 then
		t:setLeaderShip(CharFull_PontosStaff)
	end
	
	t:setLevel(CharFull_LevelStaff)
	
	MoneySend(aIndex)
	SetBP(aIndex)
	CalCharacter(aIndex)
	LevelUpSend(aIndex)
	SendMessage(string.format("Jogador evoluido com sucesso", nick), aIndex, 1)
end

CharFull.Init()

return CharFull
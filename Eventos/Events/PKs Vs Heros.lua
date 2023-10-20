PKsVsHeros = {}

local Participantes = {}
local idtimer = -1
local timer = nil
local started = false
local ComandoOn = false
local timer_check = nil
local timer_finish = nil
local timer_vivos = nil
local timer_contar = nil
local timer_contar2 = nil
local gm = ''
local player1 = ''
local player2 = ''
local player3 = ''
local player4 = ''
local player5 = ''
local player6 = ''
local player1_morto = false
local player2_morto = false
local player3_morto = false
local player4_morto = false
local player5_morto = false
local player6_morto = false

function PKsVsHeros.Init()

	
	if PKsVsHeros_SWITCH ~= 1 then
		return
	end
	
	Commands.Register(PKsVsHeros_COMMAND_OPEN, PKsVsHeros.CommandOpen)
	Commands.Register(PKsVsHeros_COMMAND_GO, PKsVsHeros.CommandGo)
	GameServerFunctions.PlayerDie(PKsVsHeros.Morte)
	
	for i in ipairs(EVENT_PKsVsHeros) do
		if EVENT_PKsVsHeros[i]._DayOfWeek ~= -1
		then
			Schedule.SetDayOfWeek(EVENT_PKsVsHeros[i]._DayOfWeek, EVENT_PKsVsHeros[i]._Hour, EVENT_PKsVsHeros[i]._Minute, PKsVsHeros.CommandOpen_Auto)
		elseif EVENT_PKsVsHeros[i]._Day ~= -1
		then
			Schedule.SetDayAndHourAndMinute(EVENT_PKsVsHeros[i]._Day, EVENT_PKsVsHeros[i]._Hour, EVENT_PKsVsHeros[i]._Minute, PKsVsHeros.CommandOpen_Auto)
		else
			Schedule.SetHourAndMinute(EVENT_PKsVsHeros[i]._Hour, EVENT_PKsVsHeros[i]._Minute, PKsVsHeros.CommandOpen_Auto)
		end
	end	
end
	
function PKsVsHeros.CommandOpen_Auto()
	timer_check = nil
	timer_finish = nil
	timer_vivos = nil
	timer_contar = nil
	timer_contar2 = nil
	gm = ''
	player1 = ''
	player2 = ''
	player3 = ''
	player4 = ''
	player5 = ''
	player6 = ''
	player1_morto = false
	player2_morto = false
	player3_morto = false
	player4_morto = false
	player5_morto = false
	player6_morto = false

	Participantes = {}
	
	timer = PKsVsHeros_TIMER_OPEN
		
	started = false
	ComandoOn = true
	
	idtimer = Timer.Repeater(1, timer, PKsVsHeros.Running)
	
	SendMessageGlobal(string.format("[Sistema] Evento PKs vs Heros!"), 0)
	SendMessageGlobal(string.format("Digite: %s para vir.", PKsVsHeros_COMMAND_GO), 0)
	
	
end

function PKsVsHeros.CheckLimpar(nome)
	if not started then return false end
	
	for i, name in ipairs(Participantes) do 
		if nome == name then
			return true
		end
	end
	
	return false
end

function PKsVsHeros.CheckUser()
	if not started then return end

	for i, name in ipairs(Participantes) do 
		local index = Participantes[name]
		local player = User.new(index)
		
		if player:getConnected() == 3 then
			if player:getMapNumber() == PKsVsHeros_Mapa then
				if player:getX() >= PKsVsHeros_AreaEvento.X1 and player:getX() <= PKsVsHeros_AreaEvento.X2 and player:getY() >= PKsVsHeros_AreaEvento.Y1 and player:getY() <= PKsVsHeros_AreaEvento.Y2
				then
					goto continue
				end
			end
		end

		local NickRemover = player:getName()
		
		PKsVsHeros.RemoveUser(NickRemover)
		
		if NickRemover == player1
		then
			player1_morto = true
			
		elseif NickRemover == player2
		then
			player2_morto = true
			
		elseif NickRemover == player3
		then
			player3_morto = true
			
		elseif NickRemover == player4
		then
			player4_morto = true
			
		elseif NickRemover == player5
		then
			player5_morto = true
			
		elseif NickRemover == player6
		then
			player6_morto = true
		end

		PKsVsHeros.CheckVivos()			
		
		if player:getConnected() == 3 then
			SendMessage(string.format("[Sistema] Você saiu do evento!"), index, 1)
			Teleport(index, 0, 125, 125)
		end
		
		::continue::	
	end
end

function PKsVsHeros.CheckVivos()
	if not started then return end

	if player1_morto and player2_morto and player3_morto or player4_morto and player5_morto and player6_morto then
		PKsVsHeros.FinishEvent()
	end
end

function PKsVsHeros.FinishEvent()
	SendMessageGlobal(string.format("[Sistema] PKs vs Heros finalizado!"), 0)

	if #Participantes < 1 or player1_morto and player2_morto and player3_morto and player4_morto and player5_morto and player6_morto then
	
		SendMessageGlobal(string.format("(Os players demoraram para se matar ou todos saíram do mapa/jogo)."), 0)
		
		for i, name in ipairs(Participantes) do
			local p = User.new(Participantes[name])
			if p:getConnected() ~= 3
			then
				PKsVsHeros.RemoveUser(name)
			end
			Teleport(Participantes[name], 0, 125, 125)
		end
	else
		local p1,p2,p3 = "","",""
		for i, name in ipairs(Participantes) do
			local p = User.new(Participantes[name])
			if p:getName() == player1 or p:getName() == player2 or p:getName() == player3 then
				SendMessageGlobal(string.format("PKs Venceram!"), 0)
				local indexDoPlayer1 = GetIndex(player1)
				local indexDoPlayer2 = GetIndex(player2)
				local indexDoPlayer3 = GetIndex(player3)
				p1 = User.new(indexDoPlayer1)
				p2 = User.new(indexDoPlayer2)
				p3 = User.new(indexDoPlayer3)
			else
				SendMessageGlobal(string.format("HEROs Venceram!"), 0)
				local indexDoPlayer1 = GetIndex(player4)
				local indexDoPlayer2 = GetIndex(player5)
				local indexDoPlayer3 = GetIndex(player6)
				p1 = User.new(indexDoPlayer1)
				p2 = User.new(indexDoPlayer2)
				p3 = User.new(indexDoPlayer3)
			end
			
			Teleport(Participantes[name], 0, 125, 125)
		end
		
		SendMessageGlobal(string.format("~> Prêmios adicionados! <~"), 0)
		
		DataBase.SetAddValue("MEMB_INFO", PKsVsHeros_PremioMoeda1.Coluna, PKsVsHeros_PremioMoeda1.Quantidade, "memb___id", p1:getAccountID())
		DataBase.SetAddValue("Character", PKsVsHeros_PremioPonto1.Coluna, PKsVsHeros_PremioPonto1.Quantidade, "Name", p1:getName())
		DataBase.SetAddValue("Character", PKsVsHeros_Premio2Ponto1.Coluna, PKsVsHeros_Premio2Ponto1.Quantidade, "Name", p1:getName())

		DataBase.SetAddValue("MEMB_INFO", PKsVsHeros_PremioMoeda2.Coluna, PKsVsHeros_PremioMoeda2.Quantidade, "memb___id", p2:getAccountID())
		DataBase.SetAddValue("Character", PKsVsHeros_PremioPonto2.Coluna, PKsVsHeros_PremioPonto2.Quantidade, "Name", p2:getName())	
		DataBase.SetAddValue("Character", PKsVsHeros_Premio2Ponto2.Coluna, PKsVsHeros_Premio2Ponto2.Quantidade, "Name", p2:getName())	
	
		DataBase.SetAddValue("MEMB_INFO",PKsVsHeros_PremioMoeda3.Coluna, PKsVsHeros_PremioMoeda3.Quantidade, "memb___id", p3:getAccountID())
		DataBase.SetAddValue("Character", PKsVsHeros_PremioPonto3.Coluna, PKsVsHeros_PremioPonto3.Quantidade, "Name", p3:getName())
		DataBase.SetAddValue("Character", PKsVsHeros_Premio2Ponto3.Coluna, PKsVsHeros_Premio2Ponto3.Quantidade, "Name", p3:getName())	
	end
	
	started = false
	ComandoOn = false
	
	if timer_finish ~= nil
	then
		Timer.Cancel(timer_finish)
		timer_finish = nil
	end
	
	if timer_vivos ~= nil
	then
		Timer.Cancel(timer_vivos)
		timer_vivos = nil
	end
	
	if timer_contar ~= nil
	then
		Timer.Cancel(timer_contar)
		timer_contar = nil
	end
	
	if timer_contar2 ~= nil
	then
		Timer.Cancel(timer_contar2)
		timer_contar2 = nil
	end

	if timer_check ~= nil
	then
		Timer.Cancel(timer_check)
		timer_check = nil
	end
end

function PKsVsHeros.Running()
	if timer == 0 then		
		timer_check = Timer.Interval(2, PKsVsHeros.CheckUser)
		timer_vivos = Timer.Interval(3, PKsVsHeros.CheckVivos)
		timer_finish = Timer.TimeOut(5 * 60, PKsVsHeros.FinishEvent)
		
		started = true
		ComandoOn = false
		
		local indexPlayer1 = GetIndex(player1)
		local indexPlayer2 = GetIndex(player2)
		local indexPlayer3 = GetIndex(player3)
		local indexPlayer4 = GetIndex(player4)
		local indexPlayer5 = GetIndex(player5)
		local indexPlayer6 = GetIndex(player6)
		
		local p1 = User.new(indexPlayer1)
		local p2 = User.new(indexPlayer2)
		local p3 = User.new(indexPlayer3)
		local p4 = User.new(indexPlayer4)
		local p5 = User.new(indexPlayer5)
		local p6 = User.new(indexPlayer6)
		
		if p1:getConnected() == 3 then
			InsertKey(Participantes, player1)
			Participantes[player1] = indexPlayer1
		end
		
		if p2:getConnected() == 3 then
			InsertKey(Participantes, player2)
			Participantes[player2] = indexPlayer2
		end
		
		if p3:getConnected() == 3 then
			InsertKey(Participantes, player3)
			Participantes[player3] = indexPlayer3
		end
		
		if p4:getConnected() == 3 then
			InsertKey(Participantes, player4)
			Participantes[player4] = indexPlayer4
		end
		
		if p5:getConnected() == 3 then
			InsertKey(Participantes, player5)
			Participantes[player5] = indexPlayer5
		end
		
		if p6:getConnected() == 3 then
			InsertKey(Participantes, player6)
			Participantes[player6] = indexPlayer6
		end
			
		if #Participantes < 6
		then
			SendMessageGlobal(string.format("[Sistema] O evento não pode iniciar"), 0)
			SendMessageGlobal(string.format("porque vieram menos de 6 players!"), 0)
			
			for i, name in ipairs(Participantes) do
				PKsVsHeros.RemoveUser(name)
				local p = User.new(Participantes[name])								
				if p:getConnected() ~= 3
				then
					Teleport(Participantes[name], 0, 125, 125)
				end
			end
			
			started = false
			ComandoOn = false
			
			if timer_finish ~= nil
			then
				Timer.Cancel(timer_finish)
				timer_finish = nil
			end
			
			if timer_vivos ~= nil
			then
				Timer.Cancel(timer_vivos)
				timer_vivos = nil
			end
			
			if timer_contar ~= nil
			then
				Timer.Cancel(timer_contar)
				timer_contar = nil
			end
			
			if timer_contar2 ~= nil
			then
				Timer.Cancel(timer_contar2)
				timer_contar2 = nil
			end
			
			if timer_check ~= nil
			then
				Timer.Cancel(timer_check)
				timer_check = nil
			end
			
			return
		end
		
		-- Mover Time PK
		Teleport(indexPlayer1, PKsVsHeros_Mapa, PKsVsHeros_MoveTimeA.X, PKsVsHeros_MoveTimeA.Y)
		Teleport(indexPlayer2, PKsVsHeros_Mapa, PKsVsHeros_MoveTimeA.X, PKsVsHeros_MoveTimeA.Y)
		Teleport(indexPlayer3, PKsVsHeros_Mapa, PKsVsHeros_MoveTimeA.X, PKsVsHeros_MoveTimeA.Y)
		
		p1:setPKLevel(6)
		PkLevelSend(indexPlayer1, 6)
		
		p2:setPKLevel(6)
		PkLevelSend(indexPlayer2, 6)
		
		p3:setPKLevel(6)
		PkLevelSend(indexPlayer3, 6)
		
		-- Mover Time HERO
		Teleport(indexPlayer4, PKsVsHeros_Mapa, PKsVsHeros_MoveTimeB.X, PKsVsHeros_MoveTimeB.Y)
		Teleport(indexPlayer5, PKsVsHeros_Mapa, PKsVsHeros_MoveTimeB.X, PKsVsHeros_MoveTimeB.Y)
		Teleport(indexPlayer6, PKsVsHeros_Mapa, PKsVsHeros_MoveTimeB.X, PKsVsHeros_MoveTimeB.Y)
		
		p4:setPKLevel(1)
		PkLevelSend(indexPlayer4, 1)
		
		p5:setPKLevel(1)
		PkLevelSend(indexPlayer5, 1)
		
		p6:setPKLevel(1)
		PkLevelSend(indexPlayer6, 1)
		
		SendMessageGlobal(string.format("Move %s fechou!", PKsVsHeros_COMMAND_GO), 0)
		SendMessageGlobal(string.format("Aguarde o próximo evento."), 0)
		
		timer_contar = Timer.TimeOut(5, PKsVsHeros.Contagem)
		
	else
		SendMessageGlobal(string.format("[Sistema] Move %s fecha em %d segundo(s)", PKsVsHeros_COMMAND_GO, timer), 0)
		timer = timer - 1
	end
	
end

function PKsVsHeros.Contagem()
	if not started then return end
	SendMessageGlobal(string.format(" "), 0)
	SendMessageGlobal(string.format("[PKs vs Heros]"), 0)
	SendMessageGlobal(string.format(" "), 0)
	SendMessageGlobal(string.format("PKs: %s, %s e %s", player1, player2, player3), 0)
	SendMessageGlobal(string.format("HEROs: %s, %s e %s", player4, player5, player6), 0)
	SendMessageGlobal(string.format(" "), 0)
	timer_contar2 = Timer.TimeOut(10, PKsVsHeros.Contagem2)
end

function PKsVsHeros.Contagem2()
	if not started == false then return end
	
	SendMessageGlobal(string.format("[Sistema]"), 0)
	SendMessageGlobal(string.format("ATENÇÃO - JAH!!!"), 0)

	for i, name in ipairs(Participantes) do 
		local p = User.new(Participantes[name])		
		if p:getConnected() ~= 3 then
			PKsVsHeros.RemoveUser(name)
		end
	end

end

function PKsVsHeros.CommandOpen(aIndex, Arguments)
	local p = User.new(aIndex)
	if p:getAuthority() == 1 then return end

	timer_check = nil
	timer_finish = nil
	timer_vivos = nil
	timer_contar = nil
	timer_contar2 = nil
	gm = p:getName()
	player1 = ''
	player2 = ''
	player3 = ''
	player4 = ''
	player5 = ''
	player6 = ''
	player1_morto = false
	player2_morto = false
	player3_morto = false
	player4_morto = false
	player5_morto = false
	player6_morto = false
	
	Participantes = {}
	
	timer = command:getNumber(Arguments, 1)
	
	if timer == 0
	then
		SendMessage(string.format("[Sistema] Uso %s tempo", PKsVsHeros_COMMAND_OPEN), aIndex, 1)
		return
	end
	
	if timer > 30
	then
		SendMessage(string.format("[Sistema] O tempo máximo para abrir é de 30 segundos!"), aIndex, 1)
		return
	end
		
	started = false
	ComandoOn = true
	
	idtimer = Timer.Repeater(1, timer, PKsVsHeros.Running)
	Teleport(aIndex, PKsVsHeros_Mapa, PKsVsHeros_MoveGm.X, PKsVsHeros_MoveGm.Y)
	SendMessageGlobal(string.format("[Sistema] %s abriu %s", gm, PKsVsHeros_COMMAND_GO), 1)
end

function PKsVsHeros.CommandGo(aIndex, Arguments)
	local p = User.new(aIndex)
	if p:getAuthority() ~= 1 then
		SendMessage(string.format("[Sistema] STAFFERs não podem participar de eventos!"), aIndex, 1)
		return
	end
	
	if ComandoOn == false
	then
		SendMessage(string.format("[Sistema] PKs vs Heros não está aberto neste momento."), aIndex, 1)
		return
	end
	
	local nome = p:getName()
	
	if player1 ~= '' and player2 ~= '' and player3 ~= '' and player4 ~= '' and player5 ~= '' and player6 ~= '' then
		SendMessage(string.format("[Sistema] Desculpe, mas o evento já atingiu o limite de 6 participantes."), aIndex, 1)
		return
	end
	
	if player1 == nome or player2 == nome or player3 == nome or player4 == nome or player5 == nome or player6 == nome then
		goto fim
	end
	
	if player1 == '' then
		player1 = nome
		goto fim
	end
	
	if player2 == '' then
		player2 = nome
		goto fim
	end
	
	if player3 == '' then
		player3 = nome
		goto fim
	end
	
	if player4 == '' then
		player4 = nome
		goto fim
	end
	
	if player5 == '' then
		player5 = nome
		goto fim
	end
	
	if player6 == '' then
		player6 = nome
		goto fim
	end
	
	::fim::

	SendMessage(string.format("[Sistema] Você será movido em alguns segundos..."), aIndex, 1)
	
	if nome == player1 or nome == player2 or nome == player3 then
		SendMessage(string.format("--> Seu lado é: PK"), aIndex, 1)
		p:setPKLevel(6)
		PkLevelSend(aIndex, 6)
	else
		SendMessage(string.format("--> Seu lado é: HERO"), aIndex, 1)
		p:setPKLevel(1)
		PkLevelSend(aIndex, 1)
	end	
end

function PKsVsHeros.Morte(aIndex, TargetIndex)
	if not started then return end
	
	local p = User.new(aIndex)
	local t = User.new(TargetIndex)
	
	local nomep = p:getName()
	local nomet = t:getName()
		
	if Participantes[nomep] ~= nil and Participantes[nomet] ~= nil then 
		SendMessage(string.format("[PKs vs Heros] Você matou %s", nomet), aIndex, 1)
		SendMessage(string.format("[PKs vs Heros] %s matou você!", nomep), TargetIndex, 1)
		
		if nomep == player1 or nomep == player2 or nomep == player3
		then
			SendMessageGlobal(string.format("[PKs] %s matou %s",nomep, nomet), 0)
		else
			SendMessageGlobal(string.format("[Heros] %s matou %s", nomep, nomet), 0)
		end
		
		Teleport(TargetIndex, 0, 125, 125)
		PKsVsHeros.RemoveUser(nomet)
		
		if nomet == player1	then
			player1_morto = true
			goto fim
		elseif nomet == player2	then
			player2_morto = true		
			goto fim			
		elseif nomet == player3	then
			player3_morto = true
			goto fim			
		elseif nomet == player4 then
			player4_morto = true
			goto fim
		elseif nomet == player5	then
			player5_morto = true
			goto fim
		elseif nomet == player6 then
			player6_morto = true		
		end
		::fim::
		PKsVsHeros.CheckVivos()	
	end
end

function PKsVsHeros.RemoveUser(Name)
	for i, key in ipairs(Participantes) do
		if key == Name
		then
			table.remove(Participantes, i)
		end
	end
end

PKsVsHeros.Init()

return PKsVsHeros
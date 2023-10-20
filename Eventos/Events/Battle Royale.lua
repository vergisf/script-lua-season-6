BattleRoyale = {}

local Players = {}
local Participantes = {}
local idtimer = -1
local timer = nil
local started = false
local ComandoOn = false
local timer_check = nil
local timer_finish = nil
local timer_vivos = nil
local timer_vivos2 = nil
local gm = ''
local timer_hp = nil
local timer_hp2 = nil
local timer_areaprotegida = nil
local timer_areaprotegida2 = nil
local timer_areaprotegida3 = nil

function BattleRoyale.Init()
	
	if BattleRoyale_SWITCH ~= 1 then
		return
	end
	
	Commands.Register(BattleRoyale_COMANDO_ABRIR, BattleRoyale.CommandOpen)
	Commands.Register(BattleRoyale_COMANDO_IR, BattleRoyale.CommandGo)
	GameServerFunctions.PlayerDie(BattleRoyale.Morte)


	for i in ipairs(EVENT_BattleRoyale) do
		if EVENT_BattleRoyale[i]._DayOfWeek ~= -1
		then
			Schedule.SetDayOfWeek(EVENT_BattleRoyale[i]._DayOfWeek, EVENT_BattleRoyale[i]._Hour, EVENT_BattleRoyale[i]._Minute, BattleRoyale.CommandOpen_Auto)
		elseif EVENT_BattleRoyale[i]._Day ~= -1
		then
			Schedule.SetDayAndHourAndMinute(EVENT_BattleRoyale[i]._Day, EVENT_BattleRoyale[i]._Hour, EVENT_BattleRoyale[i]._Minute, BattleRoyale.CommandOpen_Auto)
		else
			Schedule.SetHourAndMinute(EVENT_BattleRoyale[i]._Hour, EVENT_BattleRoyale[i]._Minute, BattleRoyale.CommandOpen_Auto)
		end
	end	
end

function BattleRoyale.CommandOpen_Auto()
	timer_check = nil
	timer_finish = nil
	timer_vivos = nil
	timer_vivos2 = nil
	gm = ''

	Players = {}
	Participantes = {}
	math.randomseed(os.clock()*os.time()/GetTick())
	timer = BattleRoyale_TIMER_OPEN
		
	started = false
	ComandoOn = true
	
	
	idtimer = Timer.Repeater(1, timer, BattleRoyale.Running)
	
	SendMessageGlobal(string.format("[Sistema] Battle Royale está aberto!"), 1)
end

function BattleRoyale.CheckUser()
	if started == false
	then
		return
	end

	for i, name in ipairs(Participantes) do 
		local index = Participantes[name].Index
		local player = User.new(index)
		local NickRemover = player:getName()
			
		if player:getConnected() ~= 3
		then
			BattleRoyale.RemoveUser(i)
			BattleRoyale.CheckVivos()
		end
		
		if player:getMapNumber() ~= BattleRoyale_MapNumber
		then
			SendMessage(string.format("[Sistema] Você saiu do evento!"), index, 1)
			player:setStrength(Participantes[name].Str)
			player:setDexterity(Participantes[name].Agi)
			player:setVitality(Participantes[name].Vit)
			player:setEnergy(Participantes[name].Ene)
			player:setLeaderShip(Participantes[name].Cmd)
			player:setLevelUpPoint(Participantes[name].Points)
			LevelUpSend(Participantes[name].Index)
			RefreshCharacter(index)
			BattleRoyale.RemoveUser(NickRemover)
			BattleRoyale.CheckVivos()
		else
			if player:getX() >= BattleRoyale_PvpArea.X1 and player:getX() <= BattleRoyale_SafeArea.X2 and player:getY() >= BattleRoyale_PvpArea.Y1 or player:getY() <= BattleRoyale_SafeArea.Y2 then
			
			else
				SendMessage(string.format("[Sistema] Você saiu do evento!"), index, 1)
				player:setStrength(Participantes[name].Str)
				player:setDexterity(Participantes[name].Agi)
				player:setVitality(Participantes[name].Vit)
				player:setEnergy(Participantes[name].Ene)
				player:setLeaderShip(Participantes[name].Cmd)
				player:setLevelUpPoint(Participantes[name].Points)
				LevelUpSend(Participantes[name].Index)
				RefreshCharacter(index)
				Teleport(index, 0, 125, 125)
				BattleRoyale.RemoveUser(NickRemover)
				BattleRoyale.CheckVivos()
			end
		end		
	end
end

function BattleRoyale.CheckBau(nome)
	if not started then return false end
	
	for i, name in ipairs(Participantes) do 
		if nome == name then
			return true
		end
	end
	
	return false
end

function BattleRoyale.TirarHP()
	if started == false
	then
		return
	end
	
	SendMessageGlobal(string.format(" "), 0)
	SendMessageGlobal(string.format("[Battle Royale] O mapa agora vai começar a tirar HP!"), 0)
	SendMessageGlobal(string.format("CORRA para o centro do mapa %d %d para não perder HP!!!", BattleRoyale_PvpCentro.X, BattleRoyale_PvpCentro.Y), 0)
	
	timer_hp2 = Timer.Interval(3, BattleRoyale.TirarHP2)
end

function BattleRoyale.TirarHP2()
	if started == false
	then
		return
	end

	for i, name in ipairs(Participantes) do 
		local index = Participantes[name].Index
		local player = User.new(index)
		local NickRemover = player:getName()
			
		if player:getMapNumber() == BattleRoyale_MapNumber
		then
			if player:getX() >= BattleRoyale_PvpCentro.X-3 and player:getX() <= BattleRoyale_PvpCentro.X+3 and player:getY() >= BattleRoyale_PvpCentro.Y-3 and player:getY() <= BattleRoyale_PvpCentro.Y+3 then
				
			else				
				SendMessage(string.format("[Sistema] Vá para o centro do mapa %d %d para não perder HP!", BattleRoyale_PvpCentro.X, BattleRoyale_PvpCentro.Y), 1)
				player:setAddLife((math.floor(player:getAddLife() - 5000)))
				LifeUpdate(index, player:getAddLife())
			end
		end
		
	end
			
			
end

function BattleRoyale.AreaProtegida()
	if started == false
	then
		return
	end
	
	SendMessageGlobal(string.format(" "), 0)
	SendMessageGlobal(string.format("[Battle Royale] Todos devem sair AGORA da área protegida!"), 0)
	SendMessageGlobal(string.format("Quem permanecer por mais de 30 segundos, será movido!!!!"), 0)
	SendMessageGlobal(string.format("(Venham para %d %d e se matem!)", BattleRoyale_PvpCentro.X, BattleRoyale_PvpCentro.Y), 0)
	
	timer_areaprotegida2 = Timer.TimeOut(30, BattleRoyale.AreaProtegida2)
end

function BattleRoyale.AreaProtegida2()
	if started == false
	then
		return
	end
	
	timer_areaprotegida3 = Timer.Interval(1, BattleRoyale.AreaProtegida3)	
end

function BattleRoyale.AreaProtegida3()
	if started == false
	then
		return
	end

	for i, name in ipairs(Participantes) do 
		local index = Participantes[name].Index
		local player = User.new(index)
		local NickRemover = player:getName()
			
		if player:getMapNumber() == BattleRoyale_MapNumber then
			if player:getX() >= BattleRoyale_SafeArea.X1 and player:getX() <= BattleRoyale_SafeArea.X2 and player:getY() >= BattleRoyale_SafeArea.Y1 and player:getY() <= BattleRoyale_SafeArea.Y2 then
				SendMessage(string.format("[Sistema] Você foi movido por permanecer na área protegida!"), index, 1)
				SendMessageGlobal(string.format("[Battle Royale] %s movido porque ficou na área protegida!", NickRemover), 0)
				player:setStrength(Participantes[name].Str)
				player:setDexterity(Participantes[name].Agi)
				player:setVitality(Participantes[name].Vit)
				player:setEnergy(Participantes[name].Ene)
				player:setLeaderShip(Participantes[name].Cmd)
				player:setLevelUpPoint(Participantes[name].Points)
				LevelUpSend(Participantes[name].Index)
				RefreshCharacter(index)
				Teleport(index, 0, 125, 125)
				table.remove(Participantes, i)
			end
		end
	end
end

function BattleRoyale.CheckVivos()
	if started == false
	then
		return
	end
	
	if #Participantes <= 3 and #Participantes > 1
	then
		SendMessageGlobal(string.format("[Battle Royale] Restam %d players vivos!", #Participantes), 0)
	end
	
	if #Participantes == 1
	then
	
		if timer_vivos2 ~= nil
		then
			Timer.Cancel(timer_vivos2)
			timer_vivos2 = nil
		end
		
		BattleRoyale.FinishEvent()	
	end	
end

function BattleRoyale.CheckVivos2()
	if started == false
	then
		return
	end
	
	if #Participantes == 1
	then
		BattleRoyale.FinishEvent()
	end
end

function BattleRoyale.FinishEvent()
	SendMessageGlobal(string.format("[Sistema] Battle Royale finalizado!"), 0)
	
	if #Participantes >= 2 or #Participantes < 1
	then
	
		SendMessageGlobal(string.format("(Os players demoraram para se matar ou todos saíram do mapa/jogo)."), 0)
		
		for i, name in ipairs(Participantes) do 
			local index = Participantes[name].Index
			local player = User.new(index)
			local NickRemover = player:getName()
				
			if player:getConnected() ~= 3
			then
				BattleRoyale.RemoveUser(NickRemover)
			end
			player:setStrength(Participantes[name].Str)
			player:setDexterity(Participantes[name].Agi)
			player:setVitality(Participantes[name].Vit)
			player:setEnergy(Participantes[name].Ene)
			player:setLeaderShip(Participantes[name].Cmd)
			player:setLevelUpPoint(Participantes[name].Points)
			LevelUpSend(Participantes[name].Index)
			RefreshCharacter(index)
			Teleport(Participantes[name].Index, 0, 125, 125)
		end
			
	elseif #Participantes == 1
	then
	
		for i, name in ipairs(Participantes) do 
			local index = Participantes[name].Index
			local player = User.new(index)
			SendMessageGlobal(string.format("Vencedor: %s", player:getName()), 0)
			
			local tipo = ""
			if BattleRoyale_Premio.Tipo == 0 then
				tipo = player:getAccountID()
			else
				tipo = player:getName()
			end						
			DataBase.SetAddValue(BattleRoyale_Premio.Tabela, BattleRoyale_Premio.Coluna, BattleRoyale_Premio.Valor, BattleRoyale_Premio.Where, tipo)
			
			if BattleRoyale_Pontos.Tipo == 0 then
				tipo = player:getAccountID()
			else
				tipo = player:getName()
			end	
			DataBase.SetAddValue(BattleRoyale_Pontos.Tabela, BattleRoyale_Pontos.Coluna, BattleRoyale_Pontos.Valor, BattleRoyale_Pontos.Where, tipo)
			
			if BattleRoyale_Pontos2.Tipo == 0 then
				tipo = player:getAccountID()
			else
				tipo = player:getName()
			end	
			DataBase.SetAddValue(BattleRoyale_Pontos2.Tabela, BattleRoyale_Pontos2.Coluna, BattleRoyale_Pontos2.Valor, BattleRoyale_Pontos2.Where, tipo)
			
			SendMessageGlobal(string.format("~> Prêmio: %d %s! <~", BattleRoyale_Premio.Valor, BattleRoyale_Premio.Nome), 0)
			player:setStrength(Participantes[name].Str)
			player:setDexterity(Participantes[name].Agi)
			player:setVitality(Participantes[name].Vit)
			player:setEnergy(Participantes[name].Ene)
			player:setLeaderShip(Participantes[name].Cmd)
			player:setLevelUpPoint(Participantes[name].Points)
			LevelUpSend(Participantes[name].Index)
			RefreshCharacter(Participantes[name].Index)
			Teleport(index, 0, 125, 125)

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
	
	if timer_vivos2 ~= nil
	then
		Timer.Cancel(timer_vivos2)
		timer_vivos2 = nil
	end
	
	if timer_check ~= nil
	then
		Timer.Cancel(timer_check)
		timer_check = nil
	end
	
	if timer_hp ~= nil
	then
		Timer.Cancel(timer_hp)
		timer_hp = nil
	end
	
	if timer_hp2 ~= nil
	then
		Timer.Cancel(timer_hp2)
		timer_hp2 = nil
	end
	
	if timer_areaprotegida ~= nil
	then
		Timer.Cancel(timer_areaprotegida)
		timer_areaprotegida = nil
	end
	
	if timer_areaprotegida2 ~= nil
	then
		Timer.Cancel(timer_areaprotegida2)
		timer_areaprotegida2 = nil
	end
	
	if timer_areaprotegida3 ~= nil
	then
		Timer.Cancel(timer_areaprotegida3)
		timer_areaprotegida3 = nil
	end

end

function BattleRoyale.Running()
	if timer == 0
	then	
		timer_check = Timer.Interval(2, BattleRoyale.CheckUser)
		timer_vivos = Timer.Interval(15, BattleRoyale.CheckVivos)
		timer_vivos2 = Timer.Interval(3, BattleRoyale.CheckVivos2)
		timer_finish = Timer.TimeOut(5 * 60, BattleRoyale.FinishEvent)
		
		started = true
		ComandoOn = false

		timer_areaprotegida = Timer.TimeOut(30, BattleRoyale.AreaProtegida)
		timer_hp = Timer.TimeOut(2 * 60, BattleRoyale.TirarHP)
		
		for i, name in ipairs(Players) do 
			local index = Players[name].Index
			local player = User.new(index)
			local NickRemover = player:getName()
			
			if player:getConnected() ~= 3
			then
				BattleRoyale.RemoveUserPlayers(NickRemover)
			end
			
			InsertKey(Participantes, player:getName())
			Participantes[player:getName()] = {Index = Players[name].Index, Str = Players[name].Str, Agi = Players[name].Agi, Vit = Players[name].Vit, Ene = Players[name].Ene, Cmd = Players[name].Cmd, Points = Players[name].Points}
			Teleport(Participantes[name].Index, BattleRoyale_MapNumber, BattleRoyale_SafeCentro.X, BattleRoyale_SafeCentro.Y)
							
			ItemSerialCreate(Participantes[name].Index, 236, 0, 0, GET_ITEM(14, 3), 0, 255, 0, 0, 0, 0)
			
			player:setReqWarehouseOpen(0)
			
		end
		
		if #Participantes < 2
		then
			SendMessageGlobal(string.format("[Sistema] O evento não pode iniciar"), 0)
			SendMessageGlobal(string.format("porque vieram menos de 2 players!"), 0)
			
			for i, name in ipairs(Participantes) do 
				local index = Participantes[name].Index
				local player = User.new(index)
				local NickRemover = player:getName()
				
				if player:getConnected() ~= 3
				then
					BattleRoyale.RemoveUser(NickRemover)
				end
				
				player:setStrength(Participantes[name].Str)
				player:setDexterity(Participantes[name].Agi)
				player:setVitality(Participantes[name].Vit)
				player:setEnergy(Participantes[name].Ene)
				player:setLeaderShip(Participantes[name].Cmd)
				player:setLevelUpPoint(Participantes[name].Points)

				LevelUpSend(Participantes[name].Index)
				RefreshCharacter(Participantes[name].Index)
				
				Teleport(Participantes[name].Index, 0, 125, 125)				
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
			
			if timer_vivos2 ~= nil
			then
				Timer.Cancel(timer_vivos2)
				timer_vivos2 = nil
			end
			
			if timer_check ~= nil
			then
				Timer.Cancel(timer_check)
				timer_check = nil
			end
			
			if timer_hp ~= nil
			then
				Timer.Cancel(timer_hp)
				timer_hp = nil
			end
			
			if timer_hp2 ~= nil
			then
				Timer.Cancel(timer_hp2)
				timer_hp2 = nil
			end
			
			if timer_areaprotegida ~= nil
			then
				Timer.Cancel(timer_areaprotegida)
				timer_areaprotegida = nil
			end
			
			if timer_areaprotegida2 ~= nil
			then
				Timer.Cancel(timer_areaprotegida2)
				timer_areaprotegida2 = nil
			end
			
			if timer_areaprotegida3 ~= nil
			then
				Timer.Cancel(timer_areaprotegida3)
				timer_areaprotegida3 = nil
			end
		
			return
			
		end
		
		for i in ipairs(EVENT_DROP_ITEM_BATTLE) do
			for n = 1, EVENT_DROP_ITEM_BATTLE[i].DropCount do
				local x = math.random(BattleRoyale_SafeArea.X1, BattleRoyale_SafeArea.X2)
				local y = math.random(BattleRoyale_SafeArea.Y1, BattleRoyale_SafeArea.Y2)
					
				ItemSerialCreate(13000,BattleRoyale_MapNumber, x, y, GET_ITEM(EVENT_DROP_ITEM_BATTLE[i].Section, EVENT_DROP_ITEM_BATTLE[i].ID), math.random(0,5), 255, 1, 1, 1, 0)

			end
		end
		
		
		SendMessageGlobal(string.format("Move %s fechou!", BattleRoyale_COMANDO_IR), 0)
		SendMessageGlobal(string.format("Aguarde o próximo evento."), 0)
		BattleRoyale.CheckVivos()
	else
		SendMessageGlobal(string.format("Move %s fecha em %d segundo(s)", BattleRoyale_COMANDO_IR, timer), 0)
		timer = timer - 1
	end
	
end

function BattleRoyale.CommandOpen(aIndex, Arguments)	
	local player = User.new(aIndex)
	
	if player:getAuthority() == 1
	then
		return
	end

	timer_check = nil
	timer_finish = nil
	timer_vivos = nil
	timer_vivos2 = nil
	gm = player:getName()
	
	Players = {}
	Participantes = {}
	
	timer = command:getNumber(Arguments, 1)
	
	if timer == 0
	then
		SendMessage(string.format("[Sistema] Uso %s tempo", BattleRoyale_COMANDO_ABRIR), aIndex, 1)
		return
	end
	
	if timer > 60
	then
		SendMessage(string.format("[Sistema] O tempo máximo para abrir é de 60 segundos!"), aIndex, 1)
		return
	end
	
	math.randomseed(os.clock()*os.time()/GetTick())
	
	started = false
	ComandoOn = true
	
	
	idtimer = Timer.Repeater(1, timer, BattleRoyale.Running)
	
	SendMessageGlobal(string.format("[Sistema] %s abriu %s", player:getName(), BattleRoyale_COMANDO_IR), 1)
	
end

function BattleRoyale.CommandGo(aIndex, Arguments)
	local player = User.new(aIndex)
	local pInv = Inventory.new(aIndex)

	if player:getAuthority() ~= 1
	then
		SendMessage(string.format("[Sistema] STAFFERs não podem participar de eventos!"), aIndex, 1)
		return
	end
	
	if player:getLevel() < BattleRoyale_LevelMinimo then
		SendMessage(string.format("Você precisa estar no level %d para participar", BattleRoyale_LevelMinimo), aIndex, 1)
		return
	end
	
	if ComandoOn == false
	then
		SendMessage(string.format("[Sistema] Battle Royale não está aberto neste momento."), aIndex, 1)
		return
	end
	
	if not BattleRoyale_Classepermitida[player:getClass()]
	then
		SendMessage(string.format("[Sistema] Sua classe não é permitida no evento"), aIndex, 1)
		return
	end
	
	for i = 0, 75 do
		if pInv:isItem(i) ~= 0
		then
			SendMessage(string.format("[Sistema] Seu inventário precisa estar vazio, sem NENHUM item!"), aIndex, 1)
			SendMessage(string.format("--> Guarde todos os seus itens no Baú."), aIndex, 1)
			return
		end
	end
		
	local Name = player:getName()
	
	if player:getInterfaceUse() ~= 0 or player:getState() == 32 or player:getDieRegen() ~= 0 or player:getTeleport() ~= 0
	then
		SendMessage(string.format("[Sistema] Feche o Baú ou outras janelas que estiverem abertas!"), aIndex, 1)
		return
	end
	
	if Players[player:getName()] == nil
	then
		InsertKey(Players, player:getName())
		local str = player:getStrength()
		local agi = player:getDexterity()
		local vit = player:getVitality()
		local ene = player:getEnergy()
		local cmd = player:getLeaderShip()
		local points = player:getLevelUpPoint()
		
		player:setStrength(0)
		player:setDexterity(0)
		player:setVitality(0)
		player:setEnergy(0)
		player:setLeaderShip(0)
		player:setLevelUpPoint(BattleRoyale_Points)
		LevelUpSend(aIndex)
		RefreshCharacter(aIndex)
		
		Players[player:getName(aIndex)] = {Index = aIndex, Str = str, Agi = agi, Vit = vit, Ene = ene, Cmd = cmd, Points = points}
		
		SendMessage(string.format("[Sistema] Você será movido em alguns segundos..."), aIndex, 1)
		SendMessage(string.format("Não relogue, não mova ou será eliminado"), aIndex, 1)
		player:setReqWarehouseOpen(1)
		Teleport(aIndex, BattleRoyale_MapNumber, BattleRoyale_SafeCentro.X, BattleRoyale_SafeCentro.Y)

	else
		SendMessage(string.format("[Sistema] Você será movido em alguns segundos..."), aIndex, 1)
		player:setReqWarehouseOpen(1)
		Teleport(aIndex, BattleRoyale_MapNumber, BattleRoyale_SafeCentro.X, BattleRoyale_SafeCentro.Y)
	end
	
end

function BattleRoyale.Morte(aIndex, TargetIndex)
	if started == false
	then
		return
	end
	local player1 = User.new(aIndex)
	local player2 = User.new(TargetIndex)
	local nomeMatador = player1:getName()
	local nomeRemover = player2:getName()
	
	if Participantes[nomeMatador] ~= nil and Participantes[nomeRemover] ~= nil
	then
		SendMessageGlobal(string.format("[Battle Royale] %s matou %s", nomeMatador, nomeRemover), 0)
		
		SendMessage(string.format("[Battle Royale] Você matou %s", nomeRemover), aIndex, 1)
		SendMessage(string.format("[Battle Royale] %s matou você!", nomeMatador), TargetIndex, 1)
				
		player2:setStrength(Participantes[nomeRemover].Str)
		player2:setDexterity(Participantes[nomeRemover].Agi)
		player2:setVitality(Participantes[nomeRemover].Vit)
		player2:setEnergy(Participantes[nomeRemover].Ene)
		player2:setLeaderShip(Participantes[nomeRemover].Cmd)
		player2:setLevelUpPoint(Participantes[nomeRemover].Points)
		
		Teleport(TargetIndex, 0, 125, 125)		
		BattleRoyale.RemoveUser(nomeRemover)
		BattleRoyale.CheckVivos()
	end
end

function BattleRoyale.RemoveUser(Name)
	for i, key in ipairs(Participantes) do
		if key == Name
		then
			table.remove(Participantes, i)
		end
	end
end

function BattleRoyale.RemoveUserPlayers(Name)
	for i, key in ipairs(Players) do
		if key == Name
		then
			table.remove(Players, i)
		end
	end
end

BattleRoyale.Init()

return BattleRoyale
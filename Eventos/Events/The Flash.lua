TheFlash = {}
local running = false
local lugar = -1
local vencedor = -1
local flashNpc = -1
local timerRunning = -1
local timerFinish = -1

function TheFlash.Init()

	if not TheFlash_Ativado then return end
	Commands.Register(TheFlash_CommandOpen,TheFlash.ComandoAbrir)
	Commands.Register(TheFlash_CommandCancel,TheFlash.ComandoCancelar)
	GameServerFunctions.NpcTalk(TheFlash.NpcTalk)
	TheFlash.Agenda()
end

function TheFlash.Agenda()
	for i in ipairs(TheFlash_Agenda) do
		if TheFlash_Agenda[i].DiaDaSemana ~= -1 then
			Schedule.SetDayOfWeek(TheFlash_Agenda[i].DiaDaSemana, TheFlash_Agenda[i].Hora, TheFlash_Agenda[i].Minuto, TheFlash.AbrirEvento)
		elseif TheFlash_Agenda[i].DiaDoMes ~= -1 then
			Schedule.SetDayAndHourAndMinute(TheFlash_Agenda[i].DiaDoMes, TheFlash_Agenda[i].Hora, TheFlash_Agenda[i].Minuto, TheFlash.AbrirEvento)
		else
			Schedule.SetHourAndMinute(TheFlash_Agenda[i].Hora, TheFlash_Agenda[i].Minuto, TheFlash.AbrirEvento)
		end
	end
end

function TheFlash.AbrirEvento()
	if running then return end
	math.randomseed(os.clock()*os.time()/GetTick())
	lugar = TheFlash_Mapas[math.random(1, #TheFlash_Mapas)]
	
	flashNpc = AddMonster(lugar.Mapa)
	
	if flashNpc == -1 then
		LogAdd(string.format("Erro ao criar o NPC The Flash"))
		lugar = -1
		item = -1
		vencedor = -1
		return
	end
	local x = math.random(lugar.X1, lugar.X2)
	local y = math.random(lugar.Y1, lugar.Y2)
	
	lugar.X = x
	lugar.Y = y
	
	local p = User.new(flashNpc)
	
	SetMapMonster(flashNpc, lugar.Mapa, x, y)
	p:setDir(2)
	SetMonster(flashNpc, TheFlash_NpcClass)
	p:setType(3)
	
	running = true
	
	SendMessageGlobal(string.format("## Evento The Flash ##"), 0)
	SendMessageGlobal(string.format("%s ", lugar.Nome), 0)
	SendMessageGlobal(string.format("%d %d ", lugar.X, lugar.Y), 0)
	
	timerFinish = Timer.TimeOut(TheFlash_TempoMaximo*60, TheFlash.FimEvento)
	timerRunning = Timer.Interval(15, TheFlash.Running)
	
	return	
end

function TheFlash.Running()
	if not running then
		if timerFinish ~= -1 then
			Timer.Cancel(timerFinish)
			timerFinish = -1
		end
		if timerRunning ~= -1 then
			Timer.Cancel(timerRunning)
			timerRunning = -1
		end 	
		return
	end
	
	SendMessageGlobal(string.format("## Evento The Flash ##"), 0)
	SendMessageGlobal(string.format("%s ", lugar.Nome), 0)
	SendMessageGlobal(string.format("%d %d ", lugar.X, lugar.Y), 0)
end

function TheFlash.NpcTalk(Npc, Player)
	if not running then return 0 end
	
	if Npc == flashNpc then
		if vencedor == -1 then
			local p = User.new(Player)
			vencedor = {Nome = p:getName(), Login = p:getAccountID()}
			running = false
			TheFlash.FimEvento()		
		end
		return 1
	end
	
	return 0
end

function TheFlash.FimEvento()
	if vencedor == -1 then
		SendMessageGlobal(string.format("## Evento The Flash ##"), 0)
		SendMessageGlobal(string.format(" "), 0)
		SendMessageGlobal(string.format("Não houve vencedor!"), 0)
		
	else
		DataBase.SetAddValue("MEMB_INFO", TheFlash_PremioMoeda.Coluna, TheFlash_PremioMoeda.Quantidade, "memb___id", vencedor.Login)
		DataBase.SetAddValue("Character", TheFlash_PremioPonto.Coluna, TheFlash_PremioPonto.Quantidade, "Name", vencedor.Nome)
		DataBase.SetAddValue("Character", TheFlash_PremioPonto2.Coluna, TheFlash_PremioPonto2.Quantidade, "Name", vencedor.Nome)
	
		SendMessageGlobal(string.format("## Evento The Flash ##"), 0)
		SendMessageGlobal(string.format("Vencedor: %s", vencedor.Nome), 0)
		SendMessageGlobal(string.format("Prêmio: %d %s", TheFlash_PremioMoeda.Quantidade, TheFlash_PremioMoeda.Nome), 0)
	end
	
	if timerFinish ~= -1 then
		Timer.Cancel(timerFinish)
		timerFinish = -1
	end
	if timerRunning ~= -1 then
		Timer.Cancel(timerRunning)
		timerRunning = -1
	end
	
	running = false
	gObjDel(flashNpc)
	lugar = -1
	dica = 0
	vencedor = -1
	flashNpc = -1
	return
end

function TheFlash.ComandoAbrir(aIndex)
	local p = User.new(aIndex)
	if p:getAuthority() == 1 then return end
	
	if running then
		SendMessage(string.format("Já existe um The Flash aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para finalizar", TheFlash_CommandCancel), aIndex, 1)
		return
	end
	
	TheFlash.AbrirEvento()
	return
end

function TheFlash.ComandoCancelar(aIndex)
	local p = User.new(aIndex)
	if p:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Não existe um The Flash aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para começar", TheFlash_CommandOpen), aIndex, 1)
		return
	end
	
	TheFlash.FimEvento()
	return
end

TheFlash.Init()

return TheFlash
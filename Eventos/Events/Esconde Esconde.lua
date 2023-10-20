EscEsc = {}
local running = false
local lugar = -1
local vencedor = -1
local catNpc = -1
local timerRunning = -1
local timerFinish = -1
local dica = 0

function EscEsc.Init()

	if not EscEsc_Ativado then return end
	Commands.Register(EscEsc_CommandOpen,EscEsc.ComandoAbrir)
	Commands.Register(EscEsc_CommandCancel,EscEsc.ComandoCancelar)
	GameServerFunctions.NpcTalk(EscEsc.NpcTalk)
	EscEsc.Agenda()
end

function EscEsc.Agenda()
	for i in ipairs(EscEsc_Agenda) do
		if EscEsc_Agenda[i].DiaDaSemana ~= -1 then
			Schedule.SetDayOfWeek(EscEsc_Agenda[i].DiaDaSemana, EscEsc_Agenda[i].Hora, EscEsc_Agenda[i].Minuto, EscEsc.AbrirEvento)
		elseif EscEsc_Agenda[i].DiaDoMes ~= -1 then
			Schedule.SetDayAndHourAndMinute(EscEsc_Agenda[i].DiaDoMes, EscEsc_Agenda[i].Hora, EscEsc_Agenda[i].Minuto, EscEsc.AbrirEvento)
		else
			Schedule.SetHourAndMinute(EscEsc_Agenda[i].Hora, EscEsc_Agenda[i].Minuto, EscEsc.AbrirEvento)
		end
	end
end

function EscEsc.AbrirEvento()
	if running then return end
	math.randomseed(os.clock()*os.time()/GetTick())
	lugar = EscEsc_Mapas[math.random(1, #EscEsc_Mapas)]
	
	catNpc = AddMonster(lugar.Mapa)
	
	if catNpc == -1 then
		LogAdd(string.format("Erro ao criar o NPC Esconde-Esconde"))
		lugar = -1
		item = -1
		vencedor = -1
		return
	end
	
	local player = User.new(catNpc)
	
	local x = math.random(lugar.X1, lugar.X2)
	local y = math.random(lugar.Y1, lugar.Y2)
	
	lugar.X = x
	lugar.Y = y
	
	SetMapMonster(catNpc, lugar.Mapa, x, y)
	player:setDir(2)
	SetMonster(catNpc, EscEsc_NpcClass)
	player:setType(3)
	
	running = true
	
	SendMessageGlobal(string.format("## Evento Esconde-Esconde ##"), 0)
	SendMessageGlobal(string.format("%s", lugar.Nome), 0)
	
	timerFinish = Timer.TimeOut(EscEsc_TempoMaximo*60, EscEsc.FimEvento)
	timerRunning = Timer.Interval(15, EscEsc.Running)
	
	return	
end

function EscEsc.Running()
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
	
	SendMessageGlobal(string.format("## Evento Esconde-Esconde ##"), 0)
	SendMessageGlobal(string.format("%s", lugar.Nome), 0)
	dica = dica+1
	if dica >= 10 and dica <= 20 then
		SendMessageGlobal(string.format("~~> XXX %d  <~~", lugar.Y), 0)
	end
	
	if dica > 21 then
		SendMessageGlobal(string.format("~~> %d %d  <~~", lugar.X, lugar.Y), 0)
	end
end

function EscEsc.NpcTalk(Npc, Player)
	if not running then return 0 end
	
	if Npc == catNpc then
		if vencedor == -1 then
			local player = User.new(Player)
			vencedor = {Nome = player:getName(), Login = player:getAccountID()}
			running = false
			EscEsc.FimEvento()		
		end
		return 1
	end
	
	return 0
end

function EscEsc.FimEvento()
	if vencedor == -1 then
		SendMessageGlobal(string.format("## Evento Esconde-Esconde ##"), 0)
		SendMessageGlobal(string.format(" "), 0)
		SendMessageGlobal(string.format("Não houve vencedor!"), 0)
		
	else
		DataBase.SetAddValue("MEMB_INFO", EscEsc_PremioMoeda.Coluna, EscEsc_PremioMoeda.Quantidade, "memb___id", vencedor.Login)
		DataBase.SetAddValue("Character", EscEsc_PremioPonto.Coluna, EscEsc_PremioPonto.Quantidade, "Name", vencedor.Nome)
		DataBase.SetAddValue("Character", EscEsc_PremioPonto2.Coluna, EscEsc_PremioPonto2.Quantidade, "Name", vencedor.Nome)
	
		SendMessageGlobal(string.format("## Evento Esconde-Esconde ##"), 0)
		SendMessageGlobal(string.format("Vencedor: %s", vencedor.Nome), 0)
		SendMessageGlobal(string.format("Prêmio: %d %s", EscEsc_PremioMoeda.Quantidade, EscEsc_PremioMoeda.Nome), 0)
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
	gObjDel(catNpc)
	lugar = -1
	dica = 0
	vencedor = -1
	catNpc = -1
	return
end

function EscEsc.ComandoAbrir(aIndex)
	local player = User.new(aIndex)
	
	if player:getAuthority() == 1 then return end
	
	if running then
		SendMessage(string.format("Já existe um Esconde-Esconde aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para finalizar", EscEsc_CommandCancel), aIndex, 1)
		return
	end
	
	EscEsc.AbrirEvento()
	return
end

function EscEsc.ComandoCancelar(aIndex)
	local player = User.new(aIndex)
	
	if player:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Não existe um Esconde-Esconde aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para começar", EscEsc_CommandOpen), aIndex, 1)
		return
	end
	
	EscEsc.FimEvento()
	return
end

EscEsc.Init()

return EscEsc
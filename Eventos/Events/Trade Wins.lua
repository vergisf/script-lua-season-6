TradeWins = {}
local running = false
local lugar = -1
local vencedor = -1
local movNpc = -1
local timerRunning = -1
local timerFinish = -1
local dica = 0

function TradeWins.Init()

	if not TradeWins_Ativado then return end
	Commands.Register(TradeWins_CommandOpen,TradeWins.ComandoAbrir)
	Commands.Register(TradeWins_CommandCancel,TradeWins.ComandoCancelar)
	GameServerFunctions.NpcTalk(TradeWins.NpcTalk)
	TradeWins.Agenda()
end

function TradeWins.Agenda()
	for i in ipairs(TradeWins_Agenda) do
		if TradeWins_Agenda[i].DiaDaSemana ~= -1 then
			Schedule.SetDayOfWeek(TradeWins_Agenda[i].DiaDaSemana, TradeWins_Agenda[i].Hora, TradeWins_Agenda[i].Minuto, TradeWins.AbrirEvento)
		elseif TradeWins_Agenda[i].DiaDoMes ~= -1 then
			Schedule.SetDayAndHourAndMinute(TradeWins_Agenda[i].DiaDoMes, TradeWins_Agenda[i].Hora, TradeWins_Agenda[i].Minuto, TradeWins.AbrirEvento)
		else
			Schedule.SetHourAndMinute(TradeWins_Agenda[i].Hora, TradeWins_Agenda[i].Minuto, TradeWins.AbrirEvento)
		end
	end
end

function TradeWins.AbrirEvento()
	if running then return end
	math.randomseed(os.clock()*os.time()/GetTick())
	lugar = TradeWins_Mapas[math.random(1, #TradeWins_Mapas)]
	
	movNpc = AddMonster(lugar.Mapa)
	
	if movNpc == -1 then
		LogAdd(string.format("Erro ao criar o NPC Trade Wins"))
		lugar = -1
		item = -1
		vencedor = -1
		return
	end
	
	
	local p = User.new(movNpc)
	
	SetMapMonster(movNpc, lugar.Mapa, lugar.X, lugar.Y)
	p:setDir( 2)
	SetMonster(movNpc, TradeWins_NpcClass)
	p:setType( 3)
	
	running = true
	
	SendMessageGlobal(string.format("## Evento Trade Wins ##"), 0)
	SendMessageGlobal(string.format("~~>  %s  <~~", lugar.Nome), 0)
	
	timerFinish = Timer.TimeOut(TradeWins_TempoMaximo*60, TradeWins.FimEvento)
	timerRunning = Timer.Interval(15, TradeWins.Running)
	
	return	
end

function TradeWins.Running()
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
	
	SendMessageGlobal(string.format("## Evento Trade Wins ##"), 0)
	SendMessageGlobal(string.format("~~>  %s  <~~", lugar.Nome), 0)
end

function TradeWins.NpcTalk(Npc, Player)
	if not running then return 0 end
	local p = User.new(Player)
	if Npc == movNpc then
		if vencedor == -1 then
			vencedor = {Nome = p:getName(), Login = p:getAccountID()}
			running = false
			TradeWins.FimEvento()		
		end
		return 1
	end
	
	return 0
end

function TradeWins.FimEvento()
	if vencedor == -1 then
		SendMessageGlobal(string.format("## Evento Trade Wins Acabou ##"), 0)
		SendMessageGlobal(string.format(" "), 0)
		SendMessageGlobal(string.format("N�o houve vencedor!"), 0)
		
	else
		DataBase.SetAddValue("MEMB_INFO", TradeWins_PremioMoeda.Coluna, TradeWins_PremioMoeda.Quantidade, "memb___id", vencedor.Login)
		DataBase.SetAddValue("Character", TradeWins_PremioPonto.Coluna, TradeWins_PremioPonto.Quantidade, "Name", vencedor.Nome)
		DataBase.SetAddValue("Character", TradeWins_PremioPonto2.Coluna, TradeWins_PremioPonto2.Quantidade, "Name", vencedor.Nome)
	
		SendMessageGlobal(string.format("## Evento Trade Wins ##"), 0)
		SendMessageGlobal(string.format("Vencedor: %s", vencedor.Nome), 0)
		SendMessageGlobal(string.format("Pr�mio: %d %s", TradeWins_PremioMoeda.Quantidade, TradeWins_PremioMoeda.Nome), 0)
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
	gObjDel(movNpc)
	lugar = -1
	dica = 0
	vencedor = -1
	movNpc = -1
	return
end

function TradeWins.ComandoAbrir(aIndex)
	local p = User.new(aIndex)
	if p:getAuthority() == 1 then return end
	
	if running then
		SendMessage(string.format("J� existe um Trade Wins aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para finalizar", TradeWins_CommandCancel), aIndex, 1)
		return
	end
	
	TradeWins.AbrirEvento()
	return
end

function TradeWins.ComandoCancelar(aIndex)
	local p = User.new(aIndex)
	if p:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("N�o existe um Trade Wins aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para come�ar", TradeWins_CommandOpen), aIndex, 1)
		return
	end
	
	TradeWins.FimEvento()
	return
end

TradeWins.Init()

return TradeWins
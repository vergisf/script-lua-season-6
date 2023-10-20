MoveuAchou = {}
local running = false
local lugar = -1
local vencedor = -1
local movNpc = -1
local timerRunning = -1
local timerFinish = -1
local dica = 0

function MoveuAchou.Init()
	if not MoveuAchou_Ativado then return end
	Commands.Register(MoveuAchou_CommandOpen,MoveuAchou.ComandoAbrir)
	Commands.Register(MoveuAchou_CommandCancel,MoveuAchou.ComandoCancelar)
	GameServerFunctions.NpcTalk(MoveuAchou.NpcTalk)
	MoveuAchou.Agenda()
end

function MoveuAchou.Agenda()
	for i in ipairs(MoveuAchou_Agenda) do
		if MoveuAchou_Agenda[i].DiaDaSemana ~= -1 then
			Schedule.SetDayOfWeek(MoveuAchou_Agenda[i].DiaDaSemana, MoveuAchou_Agenda[i].Hora, MoveuAchou_Agenda[i].Minuto, MoveuAchou.AbrirEvento)
		elseif MoveuAchou_Agenda[i].DiaDoMes ~= -1 then
			Schedule.SetDayAndHourAndMinute(MoveuAchou_Agenda[i].DiaDoMes, MoveuAchou_Agenda[i].Hora, MoveuAchou_Agenda[i].Minuto, MoveuAchou.AbrirEvento)
		else
			Schedule.SetHourAndMinute(MoveuAchou_Agenda[i].Hora, MoveuAchou_Agenda[i].Minuto, MoveuAchou.AbrirEvento)
		end
	end
end

function MoveuAchou.AbrirEvento()
	if running then return end
	math.randomseed(os.clock()*os.time()/GetTick())
	lugar = MoveuAchou_Mapas[math.random(1, #MoveuAchou_Mapas)]
	
	movNpc = AddMonster(lugar.Mapa)
	
	if movNpc == -1 then
		LogAdd(string.format("Erro ao criar o NPC Moveu Achou"))
		lugar = -1
		item = -1
		vencedor = -1
		return
	end
	
	local player = User.new(movNpc)
	
	SetMapMonster(movNpc, lugar.Mapa, lugar.X, lugar.Y)
	player:setDir( 2)
	SetMonster(movNpc, MoveuAchou_NpcClass)
	player:setType( 3)
	
	running = true
	
	SendMessageGlobal(string.format("## Evento Moveu Achou ##"), 0)
	SendMessageGlobal(string.format("mova-se para encontrar o NPC"), 0)
	
	timerFinish = Timer.TimeOut(MoveuAchou_TempoMaximo*60, MoveuAchou.FimEvento)
	timerRunning = Timer.Interval(15, MoveuAchou.Running)
	
	return	
end

function MoveuAchou.Running()
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
	
	SendMessageGlobal(string.format("## Evento Moveu Achou ##"), 0)
	SendMessageGlobal(string.format("mova-se para encontrar o NPC"), 0)
	dica = dica+1
	if dica > 21 then
		SendMessageGlobal(string.format("~~> Mapa: %s  <~~", lugar.Nome), 0)
	end
end

function MoveuAchou.NpcTalk(Npc, Player)
	if not running then return 0 end
	
	if Npc == movNpc then
		if vencedor == -1 then
			local player = User.new(Player)
			vencedor = {Nome = player:getName(), Login = player:getAccountID()}
			running = false
			MoveuAchou.FimEvento()		
		end
		return 1
	end
	
	return 0
end

function MoveuAchou.FimEvento()
	if vencedor == -1 then
		SendMessageGlobal(string.format("## Evento Moveu Achou ##"), 0)
		SendMessageGlobal(string.format(" "), 0)
		SendMessageGlobal(string.format("Não houve vencedor!"), 0)
		
	else
		DataBase.SetAddValue("MEMB_INFO", MoveuAchou_PremioMoeda.Coluna, MoveuAchou_PremioMoeda.Quantidade, "memb___id", vencedor.Login)
		DataBase.SetAddValue("Character", MoveuAchou_PremioPonto.Coluna, MoveuAchou_PremioPonto.Quantidade, "Name", vencedor.Nome)
		DataBase.SetAddValue("Character", MoveuAchou_PremioPonto2.Coluna, MoveuAchou_PremioPonto2.Quantidade, "Name", vencedor.Nome)
	
		SendMessageGlobal(string.format("## Evento Moveu Achou ##"), 0)
		SendMessageGlobal(string.format("Vencedor: %s", vencedor.Nome), 0)
		SendMessageGlobal(string.format("Prêmio: %d %s", MoveuAchou_PremioMoeda.Quantidade, MoveuAchou_PremioMoeda.Nome), 0)
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

function MoveuAchou.ComandoAbrir(aIndex)
	local player = User.new(aIndex)
	if player:getAuthority() == 1 then return end
	
	if running then
		SendMessage(string.format("Já existe um Moveu Achou aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para finalizar", MoveuAchou_CommandCancel), aIndex, 1)
		return
	end
	
	MoveuAchou.AbrirEvento()
	return
end

function MoveuAchou.ComandoCancelar(aIndex)
	local player = User.new(aIndex)
	if player:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Não existe um Moveu Achou aberto"), aIndex, 1)
		SendMessage(string.format("Utilize %s para começar", MoveuAchou_CommandOpen), aIndex, 1)
		return
	end
	
	MoveuAchou.FimEvento()
	return
end

MoveuAchou.Init()

return MoveuAchou
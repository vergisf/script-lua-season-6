RestaUm = {}

local aberto = false
local iniciado = false
local Participantes = {}
local minutesToStart = 0
local secondsToClose = 0
local timer = nil
local timerCheck = nil

function RestaUm.Init()
	
	if RESTA1_COMMAND_SWITCH == 1 then
		Commands.Register(RESTA1_COMMAND_OPEN, RestaUm.ComandoAbrir)
	end
	
	if RESTA1_AUTO_SWITCH == 1 then 
		for i in ipairs(RESTA1_DATA) do
			if RESTA1_DATA[i]._dayofweek ~= -1
			then
				Schedule.SetDayOfWeek(RESTA1_DATA[i]._dayofweek, RESTA1_DATA[i]._hour, RESTA1_DATA[i]._minute, RestaUm.Start)
			elseif RESTA1_DATA[i]._day ~= -1
			then
				Schedule.SetDayAndHourAndMinute(RESTA1_DATA[i]._day, RESTA1_DATA[i]._hour, RESTA1_DATA[i]._minute, RestaUm.Start)
			else
				Schedule.SetHourAndMinute(RESTA1_DATA[i]._hour, RESTA1_DATA[i]._minute, RestaUm.Start)
			end
		end
	end
	
	Commands.Register(RESTA1_COMMAND_GO, RestaUm.ComandoIr)
	GameServerFunctions.PlayerAttack(RestaUm.BlockAttack)
	GameServerFunctions.PlayerDie(RestaUm.PlayerDie)
end

function RestaUm.Start()
	if RESTA1_AUTO_SWITCH == 0 then return end
	
	if RESTA1_ANNOUNCE_MINUTES > 0 then
		SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d minuto(s)", RESTA1_ANNOUNCE_MINUTES), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Prepare-se!"), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		
		
		minutesToStart = RESTA1_ANNOUNCE_MINUTES
		timer = Timer.Repeater(60, 	RESTA1_ANNOUNCE_MINUTES, RestaUm.Running)
	else
		aberto = true
		RestaUm.RemovePlayers()
		timerCheck = Timer.Interval(2, RestaUm.CheckUser)
		SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d seg.", RESTA1_TIME_CLOSE), 0)
		SendMessageGlobal(string.format("Para participar digite:"), 0)
		SendMessageGlobal(string.format("%s",RESTA1_COMMAND_GO), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		secondsToClose = RESTA1_TIME_CLOSE
		timer = Timer.Repeater(1, RESTA1_TIME_CLOSE, RestaUm.ComandoIrTimer)
	end
end

function RestaUm.Running()	
	minutesToStart = minutesToStart - 1
	if minutesToStart <= 0
	then
		Timer.Cancel(timer)
		timer = nil
		aberto = true
		RestaUm.RemovePlayers()
		timerCheck = Timer.Interval(2, RestaUm.CheckUser)
		SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d seg.", RESTA1_TIME_CLOSE), 0)
		SendMessageGlobal(string.format("Para participar digite:"), 0)
		SendMessageGlobal(string.format("%s",RESTA1_COMMAND_GO), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		secondsToClose = RESTA1_TIME_CLOSE
		timer = Timer.Repeater(1, RESTA1_TIME_CLOSE, RestaUm.ComandoIrTimer)	
	else
		SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d minuto(s)", minutesToStart), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Prepare-se!"), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)		
	end
end

function RestaUm.ComandoAbrir(aIndex, Arguments)
	if RESTA1_COMMAND_SWITCH == 0 then return end
	
	local p = User.new(aIndex)
	if p:getAuthority() == 1 then return end
	
	if aberto or iniciado then
		SendMessage(string.format("[Resta 1]Aguarde o fim do evento atual.", RESTA1_COMMAND_OPEN), aIndex, 1)
		return
	end
	
	local tempo = command:getNumber(Arguments, 1)
	
	if tempo <= 0 or tempo == nil then
		SendMessage(string.format("[Resta 1] Use %s <tempo>", RESTA1_COMMAND_OPEN), aIndex, 1)
		return
	end
	
	aberto = true
	RestaUm.RemovePlayers()
	timerCheck = Timer.Interval(2, RestaUm.CheckUser)
	
	SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
	SendMessageGlobal(string.format("Início em:"), 0)
	SendMessageGlobal(string.format("%d seg.", tempo), 0)
	SendMessageGlobal(string.format("Para participar digite:"), 0)
	SendMessageGlobal(string.format("%s",RESTA1_COMMAND_GO), 0)
	SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
	
	secondsToClose = tempo
	
	timer = Timer.Repeater(1, tempo, RestaUm.ComandoIrTimer)		
end

function RestaUm.CheckUser()
	for i, name in ipairs(Participantes) do
		local index = Participantes[name].Index
		local p = User.new(index)
		if p:getConnected() ~= 3 then
			RemoverTable(Participantes, name)
		end
		
		local userMap = p:getMapNumber()
		if userMap ~= RESTA1_AREA.Map then
			RemoverTable(Participantes, name)
			SendMessage("[Resta 1] Você saiu do evento.", index, 1)
		end
		
		local userX = p:getX()
		local userY = p:getY()
		
		if userX < RESTA1_AREA.CoordX1 or userX > RESTA1_AREA.CoordX2 or userY < RESTA1_AREA.CoordY1 or userY > RESTA1_AREA.CoordY2 then
			RemoverTable(Participantes, name)
			Teleport(index, 0, 125, 125)
			SendMessage("[Resta 1] Você saiu da área do evento.", index, 1)
			if #Participantes == 1 then
				RestaUm.End()
				return
			end
		end	
	end
	
	if not aberto and iniciado then
		if CountTable(Participantes) == 1 then
			if timerCheck ~= nil then
				Timer.Cancel(timerCheck)
				timerCheck = nil
			end	
			RestaUm.End()
		end
	end
end

function RestaUm.RemovePlayers()
	for aIndex = 13000, 13999 do
		local p = User.new(aIndex)
		if p:getConnected() == 3
		then
			if p:getAuthority() == 1
			then
				if p:getMapNumber() == RESTA1_AREA.Map and p:getX() >= RESTA1_AREA.CoordX1 and p:getX() <= RESTA1_AREA.CoordX2 and p:getY() >= RESTA1_AREA.CoordY1 and p:getY() <= RESTA1_AREA.CoordY2
				then
					Teleport(aIndex, 0, 125, 125)
					SendMessage("[Resta 1] Você nao tem permissao para ficar nessa area.", aIndex, 1)
				end
			end
		end
	end
end

function RestaUm.End()	
	local Nome = 0
	local Index = 0
	local Account = 0
	local Mortes = 0
	
	for i, name in ipairs(Participantes) do
		Nome = Participantes[name].Name
		Index = Participantes[name].Index
		Account = Participantes[name].Account
		Mortes = Participantes[name].Mortes
	end
	
	SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
	SendMessageGlobal(string.format("«•»"), 0)
	SendMessageGlobal(string.format("  Vencedor: %s  ", Nome), 0)
	SendMessageGlobal(string.format("«•»"), 0)
	SendMessageGlobal(string.format("  Matou %d players  ", Mortes), 0)
	SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
	
	Teleport(Index, 0, 125, 125)
	local tp = ""
	if RESTA1_PREMIO_TIPO == 0 then tp = Account else tp = Nome end
	DataBase.SetAddValue(RESTA1_PREMIO_TABELA, RESTA1_PREMIO_COLUNA, RESTA1_PREMIO_VALOR, RESTA1_PREMIO_WHERE, tp)
	if RESTA1_PONTO_TIPO == 0 then tp = Account else tp = Nome end
	DataBase.SetAddValue(RESTA1_PONTO_TABELA, RESTA1_PONTO_COLUNA, RESTA1_PONTO_VALOR, RESTA1_PONTO_WHERE, tp)
	if RESTA1_PONTO2_TIPO == 0 then tp = Account else tp = Nome end
	DataBase.SetAddValue(RESTA1_PONTO2_TABELA, RESTA1_PONTO2_COLUNA, RESTA1_PONTO2_VALOR, RESTA1_PONTO2_WHERE, tp)
	SendMessage(string.format("[Sistema] Você recebeu %d %s.", RESTA1_PREMIO_VALOR, RESTA1_PREMIO_NOME), Index, 1)
	
	RestaUm.Clear()
end

function RestaUm.Clear()
	aberto = false
	iniciado = false
	Participantes = {}
	minutesToStart = 0
	secondsToClose = 0
	
	if timer ~= nil
	then
		Timer.Cancel(timer)
		timer = nil
	end
	
	if timerCheck ~= nil
	then
		Timer.Cancel(timerCheck)
		timerCheck = nil
	end
	
	return
end

function RestaUm.ComandoIrTimer()
	secondsToClose = secondsToClose - 1
	
	if secondsToClose <= 0 then
		Timer.Cancel(timer)
		timer = nil
		aberto = false
		
		if CountTable(Participantes) < RESTA1_MIN_PLAYERS
		then
			SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
			SendMessageGlobal(string.format("  Evento Cancelado!  "), 0)
			SendMessageGlobal(string.format("  Motivo:  "), 0)
			SendMessageGlobal(string.format("[ Falta de participantes ]"), 0)
			SendMessageGlobal(string.format("  Aguarde o próximo.  "), 0)
			SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)		
					
			if #Participantes > 0 then
				for i, Nome in ipairs(Participantes) do
					Teleport(Participantes[Nome].Index, 0, 125, 125)
				end
			end
			
			RestaUm.Clear()
			return
		end
	
		SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Evento Iniciado!"), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Aguarde o Anúncio do  vencedor."), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		iniciado = true
		return 0
	end
	
	SendMessageGlobal(string.format("× »»»»» Evento Resta 1 ««««« ×"), 0)
	SendMessageGlobal(string.format("Início em:"), 0)
	SendMessageGlobal(string.format("%d seg.", secondsToClose), 0)
	SendMessageGlobal(string.format("Para participar digite:"), 0)
	SendMessageGlobal(string.format("%s",RESTA1_COMMAND_GO), 0)
	SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
end

function RestaUm.ComandoIr(aIndex, Arguments)
	if not aberto then
		SendMessage(string.format("[Resta 1] Nenhum evento aberto"), aIndex, 1)
		return
	end	
	local p = User.new(aIndex)
	
	local Login = p:getAccountID()
	local Nome = p:getName()
	
	if p:getLevel() < RESTA1_LEVEL then
		SendMessage(string.format("[Resta 1] Você precisa estar acima do level %d", RESTA1_LEVEL), aIndex, 1)
		return
	end
	
	if DataBase.GetValue(TABLE_VIP, COLUMN_VIP, WHERE_VIP, Login) < RESTA1_VIP
	then
		SendMessage(string.format("[Resta 1] Somente usuários vip podem usar este comando!"), aIndex, 1)
		return
	end
	
	if DataBase.GetValue(TABLE_RESET, COLUMN_RESET[0], WHERE_RESET, Nome) < RESTA1_RESETS
	then
		SendMessage(string.format("[Resta 1] Você precisa de %d resets", RESTA1_RESETS), aIndex, 1)
		return
	end
	
	if DataBase.GetValue(TABLE_MRESET, COLUMN_MRESET[0], WHERE_MRESET, Nome) < RESTA1_MRESETS
	then
		SendMessage(string.format("[Resta 1] Você precisa de %d M.Resets", RESTA1_MRESETS), aIndex, 1)
		return
	end
	
	if not RESTA1_CLASSES_PERMITIDAS[p:getClass()] then
		SendMessage(string.format("[Resta 1] Sua classe não é permitida no evento."), aIndex, 1)
		return
	end
	
	if has_key(Participantes, Nome) then
		SendMessage("[Resta 1] Você já está participando.", aIndex, 1)
		return
	end	
	
	InsertKey(Participantes, Nome)
	Participantes[Nome] = {Name = Nome, Index = aIndex, Account = Login, Mortes = 0}
	Teleport(aIndex, RESTA1_AREA.Map, RESTA1_AREA.CoordX, RESTA1_AREA.CoordY)
	SendMessage("[Resta 1] Você foi movido.", aIndex, 1)
	SendMessage("Não mova ou relogue ou será desclassificado.", aIndex, 1)
end	

function RestaUm.BlockAttack(aIndex, TargetIndex)	
	local p = User.new(aIndex)
	local p2 = User.new(TargetIndex)
	
	if has_key(Participantes, p:getName()) and has_key(Participantes, p2:getName()) then
		if not iniciado then
			SendMessage("[Resta 1] Aguarde o inicio do evento.", aIndex, 1)
			return 1
		else
			return
		end
	end
	
	return
end

function RestaUm.PlayerDie(aIndex, TargetIndex)
	if not iniciado then return end
	local p = User.new(aIndex)
	local p2 = User.new(TargetIndex)
	local nome1 = p:getName()
	local nome2 = p2:getName()
	if has_key(Participantes, nome1) and has_key(Participantes, nome2) then
		Participantes[nome1].Mortes = Participantes[nome1].Mortes + 1
		RemoverTable(Participantes, nome2)		
		SendMessageGlobal(string.format(" [Resta 1] %s matou %s ", nome1, nome2), 0)		
		SendMessage(string.format("[Resta 1]Você foi morto por %s", nome1), TargetIndex, 1)
	end
end

RestaUm.Init()

return RestaUm
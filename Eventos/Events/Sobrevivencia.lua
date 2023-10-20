Sobrevivencia = {}

local aberto = false
local iniciado = false
local Participantes = {}
local minutesToStart = 0
local secondsToClose = 0
local timer = nil
local timerCheck = nil

function Sobrevivencia.Init()

	if SOBRE_COMMAND_SWITCH == 1 then
		
	Commands.Register(SOBRE_COMMAND_OPEN, Sobrevivencia.ComandoAbrir)
	end
	Commands.Register(SOBRE_COMMAND_GO, Sobrevivencia.ComandoIr)
	GameServerFunctions.PlayerAttack(Sobrevivencia.BlockAttack)
	GameServerFunctions.PlayerDie(Sobrevivencia.PlayerDie)
	
if SOBRE_AUTO_SWITCH == 1 then
	for i in ipairs(SOBRE_DATA) do
		if SOBRE_DATA[i]._dayofweek ~= -1
		then
			Schedule.SetDayOfWeek(SOBRE_DATA[i]._dayofweek, SOBRE_DATA[i]._hour, SOBRE_DATA[i]._minute, Sobrevivencia.Start)
		elseif SOBRE_DATA[i]._day ~= -1
		then
			Schedule.SetDayAndHourAndMinute(SOBRE_DATA[i]._day, SOBRE_DATA[i]._hour, SOBRE_DATA[i]._minute, Sobrevivencia.Start)
		else
			Schedule.SetHourAndMinute(SOBRE_DATA[i]._hour, SOBRE_DATA[i]._minute, Sobrevivencia.Start)
		end
	end
end
end

function Sobrevivencia.Start()
	if SOBRE_AUTO_SWITCH == 0 then return end
	
	if SOBRE_ANNOUNCE_MINUTES > 0 then
		SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d minuto(s)", SOBRE_ANNOUNCE_MINUTES), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Prepare-se!"), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		
		
		minutesToStart = SOBRE_ANNOUNCE_MINUTES
		timer = Timer.Repeater(60, 	SOBRE_ANNOUNCE_MINUTES, Sobrevivencia.Running)
	else
		aberto = true
		Sobrevivencia.RemovePlayers()
		timerCheck = Timer.Interval(2, Sobrevivencia.CheckUser)
		SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d seg.", SOBRE_TIME_CLOSE), 0)
		SendMessageGlobal(string.format("Para participar digite:"), 0)
		SendMessageGlobal(string.format("%s",SOBRE_COMMAND_GO), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		secondsToClose = SOBRE_TIME_CLOSE
		timer = Timer.Repeater(1, SOBRE_TIME_CLOSE, Sobrevivencia.ComandoIrTimer)
	end
end

function Sobrevivencia.Running()
	minutesToStart = minutesToStart - 1
	if minutesToStart <= 0
	then
		Timer.Cancel(timer)
		timer = nil
		aberto = true
		Sobrevivencia.RemovePlayers()
		timerCheck = Timer.Interval(2, Sobrevivencia.CheckUser)
		SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d seg.", SOBRE_TIME_CLOSE), 0)
		SendMessageGlobal(string.format("Para participar digite:"), 0)
		SendMessageGlobal(string.format("%s",SOBRE_COMMAND_GO), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		secondsToClose = SOBRE_TIME_CLOSE
		timer = Timer.Repeater(1, SOBRE_TIME_CLOSE, Sobrevivencia.ComandoIrTimer)	
	else
		SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
		SendMessageGlobal(string.format("Início em:"), 0)
		SendMessageGlobal(string.format("%d minuto(s)", minutesToStart), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Prepare-se!"), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)		
	end
end

function Sobrevivencia.ComandoAbrir(aIndex, Arguments)
	if SOBRE_COMMAND_SWITCH == 0 then return end
	
	local p = User.new(aIndex)
	if p:getAuthority() == 1 then return end
	
	if aberto or iniciado then
		SendMessage(string.format("[Sobre]Aguarde o fim do evento atual.", SOBRE_COMMAND_OPEN), aIndex, 1)
		return
	end
	
	local tempo = command:getNumber(Arguments, 1)
	
	if tempo <= 0 or tempo == nil then
		SendMessage(string.format("[Sobre] Use %s <tempo>", SOBRE_COMMAND_OPEN), aIndex, 1)
		return
	end
	
	aberto = true
	Sobrevivencia.RemovePlayers()
	timerCheck = Timer.Interval(2, Sobrevivencia.CheckUser)
	
	SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
	SendMessageGlobal(string.format("Início em:"), 0)
	SendMessageGlobal(string.format("%d seg.", tempo), 0)
	SendMessageGlobal(string.format("Para participar digite:"), 0)
	SendMessageGlobal(string.format("%s",SOBRE_COMMAND_GO), 0)
	SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
	
	secondsToClose = tempo
	
	timer = Timer.Repeater(1, tempo, Sobrevivencia.ComandoIrTimer)		
end

function Sobrevivencia.CheckUser()
	for i, name in ipairs(Participantes) do
		local index = Participantes[name].Index
		local p = User.new(index)
		if p:getConnected() ~= 3 then
			RemoverTable(Participantes, name)
		end
		
		local userMap = p:getMapNumber()
		if userMap ~= SOBRE_AREA.Map then
			RemoverTable(Participantes, name)
			SendMessage("[Sobrevivência] Você saiu do evento.", index, 1)
		end
		
		local userX = p:getX()
		local userY = p:getY()
		
		if userX < SOBRE_AREA.CoordX1 or userX > SOBRE_AREA.CoordX2 or userY < SOBRE_AREA.CoordY1 or userY > SOBRE_AREA.CoordY2 then
			RemoverTable(Participantes, name)
			Teleport(index, 0, 125, 125)
			SendMessage("[Sobrevivência] Você saiu da área do evento.", index, 1)
			if #Participantes == 1 then
				Sobrevivencia.End()
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
			Sobrevivencia.End()
		end
	end
end

function Sobrevivencia.RemovePlayers()
	for aIndex = 13000, 13999 do
		local p = User.new(aIndex)
		if p:getConnected() == 3
		then
			if p:getAuthority() == 1
			then
				if p:getMapNumber() == SOBRE_AREA.Map and p:getX() >= SOBRE_AREA.CoordX1 and p:getX() <= SOBRE_AREA.CoordX2 and p:getY() >= SOBRE_AREA.CoordY1 and p:getY() <= SOBRE_AREA.CoordY2
				then
					Teleport(aIndex, 0, 125, 125)
					SendMessage("[Sobrevivência] Você nao tem permissao para ficar nessa area.", aIndex, 1)
				end
			end
		end
	end
end

function Sobrevivencia.End()	
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
	
	SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
	SendMessageGlobal(string.format("«•»"), 0)
	SendMessageGlobal(string.format("  Vencedor: %s  ", Nome), 0)
	SendMessageGlobal(string.format("«•»"), 0)
	SendMessageGlobal(string.format("  Matou %d players  ", Mortes), 0)
	SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
	
	Teleport(Index, 0, 125, 125)
	local tp = ""
	if SOBRE_PREMIO_TIPO == 0 then tp = Account else tp = Nome end
	DataBase.SetAddValue(SOBRE_PREMIO_TABELA, SOBRE_PREMIO_COLUNA, SOBRE_PREMIO_VALOR, SOBRE_PREMIO_WHERE, tp)
	if SOBRE_PONTO_TIPO == 0 then tp = Account else tp = Nome end
	DataBase.SetAddValue(SOBRE_PONTO_TABELA, SOBRE_PONTO_COLUNA, SOBRE_PONTO_VALOR, SOBRE_PONTO_WHERE, tp)
	if SOBRE_PONTO2_TIPO == 0 then tp = Account else tp = Nome end
	DataBase.SetAddValue(SOBRE_PONTO2_TABELA, SOBRE_PONTO2_COLUNA, SOBRE_PONTO2_VALOR, SOBRE_PONTO2_WHERE, tp)
	SendMessage(string.format("[Sistema] Você recebeu %d %s.", SOBRE_PREMIO_VALOR, SOBRE_PREMIO_NOME), Index, 1)
	
	Sobrevivencia.Clear()
end

function Sobrevivencia.Clear()
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

function Sobrevivencia.ComandoIrTimer()
	secondsToClose = secondsToClose - 1
	
	if secondsToClose <= 0 then
		Timer.Cancel(timer)
		timer = nil
		aberto = false
		
		if CountTable(Participantes) < SOBRE_MIN_PLAYERS
		then
			SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
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
			
			Sobrevivencia.Clear()
			return
		end
	
		SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Evento Iniciado!"), 0)
		SendMessageGlobal(string.format("«•»"), 0)
		SendMessageGlobal(string.format("Aguarde o Anúncio do  vencedor."), 0)
		SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
		iniciado = true
		return 0
	end
	
	SendMessageGlobal(string.format("× »»»»» Evento Sobrevivência ««««« ×"), 0)
	SendMessageGlobal(string.format("Início em:"), 0)
	SendMessageGlobal(string.format("%d seg.", secondsToClose), 0)
	SendMessageGlobal(string.format("Para participar digite:"), 0)
	SendMessageGlobal(string.format("%s",SOBRE_COMMAND_GO), 0)
	SendMessageGlobal(string.format("× »»»»»»»»»»»»» • ««««««««««««« ×"), 0)
end

function Sobrevivencia.ComandoIr(aIndex, Arguments)
	if not aberto then
		SendMessage(string.format("[Sobrevivência] Nenhum evento aberto"), aIndex, 1)
		return
	end	
	local p = User.new(aIndex)
	
	local Login = p:getAccountID()
	local Nome = p:getName()
	
	if p:getLevel() < SOBRE_LEVEL then
		SendMessage(string.format("[Sobrevivência] Você precisa estar acima do level %d", SOBRE_LEVEL), aIndex, 1)
		return
	end
	
	if DataBase.GetValue(TABLE_VIP, COLUMN_VIP, WHERE_VIP, Login) < SOBRE_VIP
	then
		SendMessage(string.format("[Sobrevivência] Somente usuários vip podem usar este comando!"), aIndex, 1)
		return
	end
	
	if DataBase.GetValue(TABLE_RESET, COLUMN_RESET[0], WHERE_RESET, Nome) < SOBRE_RESETS
	then
		SendMessage(string.format("[Sobrevivência] Você precisa de %d resets", SOBRE_RESETS), aIndex, 1)
		return
	end
	
	if DataBase.GetValue(TABLE_MRESET, COLUMN_MRESET[0], WHERE_MRESET, Nome) < SOBRE_MRESETS
	then
		SendMessage(string.format("[Sobrevivência] Você precisa de %d M.Resets", SOBRE_MRESETS), aIndex, 1)
		return
	end
	
	if not SOBRE_CLASSES_PERMITIDAS[p:getClass()] then
		SendMessage(string.format("[Sobrevivência] Sua classe não é permitida no evento."), aIndex, 1)
		return
	end
	
	if has_key(Participantes, Nome) then
		SendMessage("[Sobrevivência] Você já está participando.", aIndex, 1)
		return
	end	
	
	InsertKey(Participantes, Nome)
	Participantes[Nome] = {Name = Nome, Index = aIndex, Account = Login, Mortes = 0}
	Teleport(aIndex, SOBRE_AREA.Map, SOBRE_AREA.CoordX, SOBRE_AREA.CoordY)
	SendMessage("[Sobrevivência] Você foi movido.", aIndex, 1)
	SendMessage("Não mova ou relogue ou será desclassificado.", aIndex, 1)
end	

function Sobrevivencia.BlockAttack(aIndex, TargetIndex)	
	local p = User.new(aIndex)
	local p2 = User.new(TargetIndex)
	
	if has_key(Participantes, p:getName()) and has_key(Participantes, p2:getName()) then
		if not iniciado then
			SendMessage("[Sobrevivência] Aguarde o inicio do evento.", aIndex, 1)
			return 1
		else
			return
		end
	end
	
	return
end

function Sobrevivencia.PlayerDie(aIndex, TargetIndex)
	if not iniciado then return end
	local p = User.new(aIndex)
	local p2 = User.new(TargetIndex)
	local nome1 = p:getName()
	local nome2 = p2:getName()
	if has_key(Participantes, nome1) and has_key(Participantes, nome2) then
		Participantes[nome1].Mortes = Participantes[nome1].Mortes + 1
		RemoverTable(Participantes, nome2)		
		SendMessageGlobal(string.format(" [Sobre] %s matou %s ", nome1, nome2), 0)		
		SendMessage(string.format("[Sobrevivência]Você foi morto por %s", nome1), TargetIndex, 1)
	end
end

Sobrevivencia.Init()

return Sobrevivencia
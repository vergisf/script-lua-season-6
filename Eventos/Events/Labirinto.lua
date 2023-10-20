Labirinto = {}
local tempoAberto = 0
local tempoAnuncio = 0
local tempoInicio = 0
local timerAberto, timerAnuncio, timerInicio, timerLimite
local running = false
local open = false
local started = false
local monster = {}
local ganhadores = 0
local participantes = {}

function Labirinto.Init()
	
    if Labirinto_Ativado then
        GameServerFunctions.EnterCharacter(Labirinto.PlayerLogou)
        GameServerFunctions.PlayerAttack(Labirinto.PlayerAtacou)
        GameServerFunctions.NpcTalk(Labirinto.PlayerClicouNoNpc)
        --GameServerFunctions.RunningSkill(Labirinto.UsouSkill)
        Commands.Register(Labirinto_ComandoAbrir, Labirinto.ComandoAbrir)
        Commands.Register(Labirinto_ComandoIr, Labirinto.ComandoIr)
        Commands.Register(Labirinto_ComandoCancelar, Labirinto.ComandoCancelar)
        Labirinto.Agenda()
    end
end

function Labirinto.Agenda()
    for i in ipairs(Labirinto_Agenda) do
        if Labirinto_Agenda[i].DiaDaSemana ~= -1 then
            Schedule.SetDayOfWeek(
                Labirinto_Agenda[i].DiaDaSemana,
                Labirinto_Agenda[i].Hora,
                Labirinto_Agenda[i].Minuto,
                Labirinto.Inicio
            )
        elseif Labirinto_Agenda[i].DiaDoMes ~= -1 then
            Schedule.SetDayAndHourAndMinute(
                Labirinto_Agenda[i].DiaDoMes,
                Labirinto_Agenda[i].Hora,
                Labirinto_Agenda[i].Minuto,
                Labirinto.Inicio
            )
        else
            Schedule.SetHourAndMinute(Labirinto_Agenda[i].Hora, Labirinto_Agenda[i].Minuto, Labirinto.Inicio)
        end
    end
end

function Labirinto.Inicio()
    tempoAnuncio = Labirinto_TempoAnuncio
    SendMessageGlobal(string.format("================================="), 0)
    SendMessageGlobal(string.format(" "), 0)
    SendMessageGlobal(string.format("Labirinto inicia em %d minuto(s)", tempoAnuncio), 0)
    SendMessageGlobal(string.format(" "), 0)
    SendMessageGlobal(string.format("================================="), 0)
    tempoAnuncio = tempoAnuncio - 1
    timerAnuncio = Timer.Repeater(60, tempoAnuncio, Labirinto.AnuncioMinutos)
end

function Labirinto.AnuncioMinutos()
    if tempoAnuncio == 0 then
        tempoAberto = Labirinto_TempoAberto
        running = true
        open = true
        SendMessageGlobal(string.format("Evento Autom�tico Labirinto Aberto"), 1)
        timerAberto = Timer.Repeater(1, tempoAberto, Labirinto.AnuncioSegundos)
    else
        SendMessageGlobal(string.format("================================="), 0)
        SendMessageGlobal(string.format(" "), 0)
        SendMessageGlobal(string.format("Labirinto inicia em %d minuto(s)", tempoAnuncio), 0)
        SendMessageGlobal(string.format(" "), 0)
        SendMessageGlobal(string.format("================================="), 0)
        tempoAnuncio = tempoAnuncio - 1
    end
end

function Labirinto.AnuncioSegundos()
    if tempoAberto == 0 then
        open = false
        if not Labirinto.CriarNpc() then
            SendMessageGlobal(string.format("Labirinto cancelado"), 1)
            SendMessageGlobal(string.format(" "), 1)
            SendMessageGlobal(string.format("Contate o Administrador"), 1)
            Labirinto.Finalizar()
            return
        end
        SendMessageGlobal(string.format("%s fechou, aguarde o pr�ximo evento", Labirinto_ComandoIr), 1)
        SendMessageGlobal(string.format(" "), 0)
        SendMessageGlobal(string.format("================================="), 0)
        SendMessageGlobal(string.format(" "), 0)
        SendMessageGlobal(string.format("Labirinto inicia em %d segundos", Labirinto_TempoInicio), 0)
        SendMessageGlobal(string.format(" "), 0)
        SendMessageGlobal(string.format("================================="), 0)
        Timer.TimeOut(Labirinto_TempoInicio, Labirinto.IniciarEvento)
    else
        SendMessageGlobal(string.format("%s fecha em %d segundo(s)", Labirinto_ComandoIr, tempoAberto), 0)
        tempoAberto = tempoAberto - 1
    end
end

function Labirinto.ComandoAbrir(aIndex, Arguments)
    if not Labirinto_Ativado then
        return
    end
	local p = User.new(aIndex)
    if p:getAuthority() == 1 then
        return
    end
    if running or open or started then
        SendMessage("J� existe um Labirinto aberto.", aIndex, 1)
        return
    end
    tempoAberto = command:getNumber(Arguments, 1)
    if tempoAberto == nil or tempoAberto <= 0 then
        SendMessage("tempo inv�lido", aIndex, 1)
        return
    end
    SendMessageGlobal(string.format("%s abriu evento Labirinto", p:getName()), 1)
    running = true
    open = true
    timerAberto = Timer.Repeater(1, tempoAberto, Labirinto.AnuncioSegundos)
    LogAddC(3, string.format("%s iniciou um evento Labirinto.", p:getName()))
end

function Labirinto.ComandoCancelar(aIndex)
local p = User.new(aIndex)
    if p:getAuthority() == 1 then
        return
    end
    if not running and not started and not open then
        return
    end
    Labirinto.Finalizar()
end

function Labirinto.ComandoIr(aIndex)
    if not Labirinto_Ativado then
        return
    end
    if not open then
        SendMessage(string.format("%s n�o est� aberto", Labirinto_ComandoIr), aIndex, 1)
        return
    end

    if participantes[aIndex] == nil then
        table.insert(participantes, aIndex)
    end

    participantes[aIndex] = aIndex

    Teleport(aIndex, Labirinto_Move.Mapa, Labirinto_Move.X, Labirinto_Move.Y)
    SendMessage(string.format("Voc� foi movido para o evento"), aIndex, 1)
    SendMessage(string.format("Permane�a na area de espera"), aIndex, 1)
    SendMessage(string.format("at� o inicio do evento"), aIndex, 1)
end

function Labirinto.IniciarEvento()
    started = true
    timerLimite = Timer.TimeOut(Labirinto_TempoLimite * 60, Labirinto.Finalizar)
    SendMessageGlobal(string.format("================================="), 0)
    SendMessageGlobal(string.format("Labirinto Iniciou"), 0)
    SendMessageGlobal(string.format(" "), 0)
    SendMessageGlobal(string.format("Procure a sa�da e clique no NPC"), 0)
    SendMessageGlobal(string.format("para registrar a sua vit�ria!"), 0)
    SendMessageGlobal(string.format("================================="), 0)
end

function Labirinto.PlayerAtacou(aIndex, TargetIndex)
    if running or started or open then
		local p = User.new(aIndex)
        local OX = p:getX()
        local OY = p:getY()
        if p:getMapNumber() == Labirinto_AreaTotal.Mapa and OX <= Labirinto_AreaTotal.X2 and OX >= Labirinto_AreaTotal.X1 and OY <= Labirinto_AreaTotal.Y2 and OY >= Labirinto_AreaTotal.Y1 and not Labirinto_HabilitarPVP then
            return 1
        end
    end
    return
end

function Labirinto.PlayerMoveu(aIndex)
    if running and not started then
        if participantes[aIndex] ~= nil then
            Teleport(aIndex, Labirinto_Move.Mapa, Labirinto_Move.X, Labirinto_Move.Y)
        end
    end
end

function Labirinto.CriarNpc()
    local index = AddMonster(Labirinto_Npc.Mapa)
    if index == -1 then
        LogAdd(string.format("Problema ao criar o Npc Labirinto"))
        return false
    end
	local p = User.new(index)
    SetMapMonster(index, Labirinto_Npc.Mapa, Labirinto_Npc.X, Labirinto_Npc.Y)
    p:setDir(Labirinto_Npc.Dir)
    SetMonster(index, Labirinto_Npc.Classe)
	p:setType(3)
    monster = {
        aIndex = index,
        Classe = Labirinto_Npc.Classe
    }
    return true
end

function Labirinto.PlayerClicouNoNpc(Npc, aIndex)
    if running and started and Npc == monster.aIndex and ganhadores < Labirinto_QtdGanhadores then
        ganhadores = ganhadores + 1
		 if ganhadores > Labirinto_QtdGanhadores then
            running = false
            Labirinto.Finalizar()
			return 1
        end
		local p = User.new(aIndex)
        ChatTargetSend(Npc, string.format("Voc� foi o %d� Colocado", ganhadores), aIndex)
        SendMessageGlobal(string.format("%s foi o %d� a encontrar a sa�da", p:getName(), ganhadores), 0)
        Labirinto.PremiarVencedor(aIndex, ganhadores)
		if ganhadores == Labirinto_QtdGanhadores then
            running = false
            Labirinto.Finalizar()
			return 1
        end
        return 1
    end
    return 0
end

function Labirinto.PremiarVencedor(aIndex, pos)
    if Labirinto_PremioBox[pos] ~= nil and Labirinto_PremioBox[pos].Quantidade > 0 then
        for loop = 1, Labirinto_PremioBox[pos].Quantidade do
            ItemSerialCreate(
                aIndex,
                236,
                0,
                0,
                GET_ITEM(Labirinto_PremioBox[pos].Grupo, Labirinto_PremioBox[pos].Id),
                Labirinto_PremioBox[pos].Level,
                0,
                0,
                0,
                0,
                0
            )
        end
        SendMessage(
            string.format("Você recebeu %d %s", Labirinto_PremioBox[pos].Quantidade, Labirinto_PremioBox[pos].Nome),
            aIndex,
            1
        )
    end
	local p = User.new(aIndex)
	local acc = p:getAccountID()
	local nome = p:getName()
    if Labirinto_PremioMoeda[pos] ~= nil and Labirinto_PremioMoeda[pos] > 0 then
		
        if Labirinto_PremioMoeda_Tipo == 0 then
            DataBase.SetAddValue(
                Labirinto_PremioMoeda_Tabela,
                Labirinto_PremioMoeda_Coluna,
                Labirinto_PremioMoeda[pos],
                Labirinto_PremioMoeda_Where,
                acc
            )
        else
            DataBase.SetAddValue(
                Labirinto_PremioMoeda_Tabela,
                Labirinto_PremioMoeda_Coluna,
                Labirinto_PremioMoeda[pos],
                Labirinto_PremioMoeda_Where,
                nome
            )
        end
        SendMessage(
            string.format("Voc� recebeu %d %s", Labirinto_PremioMoeda[pos], Labirinto_PremioMoeda_Nome),
            aIndex,
            1
        )
    end
    if Labirinto_PremioPonto[pos] ~= nil and Labirinto_PremioPonto[pos] > 0 then
        if Labirinto_PremioPonto_Tipo == 0 then
            DataBase.SetAddValue(
                Labirinto_PremioPonto_Tabela,
                Labirinto_PremioPonto_Coluna,
                Labirinto_PremioPonto[pos],
                Labirinto_PremioPonto_Where,
                acc
            )
        else
            DataBase.SetAddValue(
                Labirinto_PremioPonto_Tabela,
                Labirinto_PremioPonto_Coluna,
                Labirinto_PremioPonto[pos],
                Labirinto_PremioPonto_Where,
                nome
            )
        end
        SendMessage(
            string.format("Voc� recebeu %d %s", Labirinto_PremioPonto[pos], Labirinto_PremioPonto_Nome),
            aIndex,
            1
        )
    end
    Teleport(aIndex, 0, 125, 125)
end

function Labirinto.Finalizar()
    if timerAberto ~= 0 then
        Timer.Cancel(timerAberto)
        timerAberto = 0
    end
    if timerAnuncio ~= 0 then
        Timer.Cancel(timerAnuncio)
        timerAnuncio = 0
    end
    if timerInicio ~= 0 then
        Timer.Cancel(timerInicio)
        timerInicio = 0
    end
    if timerLimite ~= 0 then
        Timer.Cancel(timerLimite)
        timerLimite = 0
    end
    if monster.aIndex ~= nil then
        gObjDel(monster.aIndex)
    end
    running = false
    open = false
    started = false
    monster = {}
    ganhadores = 0
	if #participantes > 0 then
		for i, index in pairs(participantes) do
			local p = User.new(index)
			if p:getMapNumber() == Labirinto_AreaTotal.Mapa then
				Teleport(index, 0, 125, 125)
			end
		end
	end
    participantes = {}
    SendMessageGlobal(string.format("================================="), 0)
    SendMessageGlobal(string.format(" "), 0)
    SendMessageGlobal(string.format("Labirinto finalizado!"), 0)
    SendMessageGlobal(string.format(" "), 0)
    SendMessageGlobal(string.format("================================="), 0)
end

function Labirinto.PlayerLogou(aIndex)
	local p = User.new(aIndex)
    local OX = p:getX()
    local OY = p:getY()
    if
        p:getMapNumber() == Labirinto_AreaTotal.Mapa and OX <= Labirinto_AreaTotal.X2 and
            OX >= Labirinto_AreaTotal.X1 and
            OY <= Labirinto_AreaTotal.Y2 and
            OY >= Labirinto_AreaTotal.Y1
     then
        Teleport(aIndex, 0, 125, 125)
    end
end

function Labirinto.UsouSkill(aIndex, TargetIndex, Skill)
    if running or open or started then
		local p = User.new(aIndex)
        local OX = p:getX()
        local OY = p:getY()
        if
            p:getMapNumber() == Labirinto_AreaTotal.Mapa and OX <= Labirinto_AreaTotal.X2 and
                OX >= Labirinto_AreaTotal.X1 and
                OY <= Labirinto_AreaTotal.Y2 and
                OY >= Labirinto_AreaTotal.Y1
         then
            for i in ipairs(Labirinto_SkillProibidas) do
                if Skill == Labirinto_SkillProibidas[i] then
                    return 1
                end
            end
        end
    end
end

Labirinto.Init()

return Labirinto

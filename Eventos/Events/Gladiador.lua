Gladiador = {}
local open = false
local running = false
local started = false
local timerAberto = nil
local tempoAberto = 0
local Players = {}
local Spot = {}

function Gladiador.Init()
	
	if Gladiador_Define.Ativado then
		Commands.Register(Gladiador_Define.ComandoAbrir	, Gladiador.ComandoAbrir    )
		Commands.Register(Gladiador_Define.ComandoIr		, Gladiador.ComandoIr       )
		Commands.Register(Gladiador_Define.ComandoChamar	, Gladiador.ComandoChamar   )
		Commands.Register(Gladiador_Define.ComandoIniciar	, Gladiador.ComandoIniciar  )
		Commands.Register(Gladiador_Define.ComandoCancelar , Gladiador.ComandoCancelar )
		Commands.Register(Gladiador_Define.ComandoFinaliar , Gladiador.ComandoFim      )
		Commands.Register(Gladiador_Define.ComandoWin	    , Gladiador.ComandoWin      )
		Commands.Register(Gladiador_Define.ComandoInfo	    , Gladiador.ComandoInfo     )
		Commands.Register(Gladiador_Define.ComandoCorrigir , Gladiador.ComandoCorrigir )
	end
end

function Gladiador.ComandoIr(aIndex)
	if not open then return end
	
	if #Players >= Gladiador_Define.MaximoPlayers then
		SendMessage(string.format(" Não há mais vagas no evento "), aIndex, 1)
		return
	end
	
	if  Gladiador.HasKey(Players, aIndex) then
		SendMessage(string.format(" Você ja está participando do evento "), aIndex, 1)
	else		
		table.insert(Players, {Index = aIndex})
	end

	Teleport(aIndex, Gladiador_Define.Spawn.Mapa, Gladiador_Define.Spawn.X, Gladiador_Define.Spawn.Y)
	SendMessage("Você está participando do evento", aIndex, 1)
	return
end

function Gladiador.ComandoAbrir(aIndex, Arguments)
	local player = User.new(aIndex)
	
	if player:getAuthority() == 1 then return end
	
	if open or running then
		SendMessage(string.format("Já exsite um evento Gladiador aberto"), aIndex, ALERT_COLOR)
		return
	end
	
	tempoAberto = command:getNumber(Arguments, 1)
	
	if tempoAberto == nil or tempoAberto <= 0 then
		SendMessage(string.format("Use %s <tempo>", Gladiador_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	open = true
	SendMessageGlobal(string.format("%s abriu %s", player:getName(), Gladiador_Define.ComandoIr), 1)
	timerAberto = Timer.Repeater(1, tempoAberto, Gladiador.Anunciar)
	return	
end

function Gladiador.ComandoIniciar(aIndex)
	local player = User.new(aIndex)
	
	if player:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", Gladiador_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if started then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoChamar), aIndex, 1)
		return
	end
	
	started = true
	
	SendMessageGlobal(string.format("========================="), 0)
	SendMessageGlobal(string.format("[%s]", player:getName()), 0)
	SendMessageGlobal(string.format("Evento Gladiador iniciado"), 0)
	SendMessageGlobal(string.format("========================="), 0)
end

function Gladiador.ComandoChamar(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", Gladiador_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if Spot[1] ~= nil and Spot[2] ~= nil then
		SendMessage(string.format("Use %s posição", Gladiador_Define.ComandoWin), aIndex, 1)
		return
	end
	
	if #Players <= 0 then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoFinaliar), aIndex, 1)
		return
	end
	local p1Index = 0
	local p2Index = 0
	local player1 = 0
	local player2 = 0
	if Spot[1] == nil then
		::back::
		if #Players <= 0 then
			SendMessage(string.format("Use %s", Gladiador_Define.ComandoFinaliar), aIndex, 1)
			return
		end
		p1Index = Players[Utils.GetRandom(1, #Players, math.random(1, 10))].Index
		player1  = User.new(p1Index)
		Gladiador.RemovePlayer(p1Index)
		if player1:getConnected() ~= 3 then goto back end
		Spot[1] = p1Index
	end
	
	if Spot[2] == nil then
		::back::
		if #Players <= 0 then
			SendMessage(string.format("Use %s", Gladiador_Define.ComandoFinaliar), aIndex, 1)
			return
		end
		p2Index = Players[Utils.GetRandom(1, #Players, math.random(1, 10))].Index
		player2  = User.new(p2Index)
		Gladiador.RemovePlayer(p2Index)
		if player2:getConnected() ~= 3 then goto back end
		Spot[2] = p2Index
	end
	
	Teleport(Spot[1], Gladiador_Define.Spot[1].Mapa, Gladiador_Define.Spot[1].X, Gladiador_Define.Spot[1].Y)
	Teleport(Spot[2], Gladiador_Define.Spot[2].Mapa, Gladiador_Define.Spot[2].X, Gladiador_Define.Spot[2].Y)

	SendMessageGlobal(string.format("[%s]", gm:getName()), 0)
	SendMessageGlobal(string.format("%s [x] %s", player1:getName(), player2:getName()), 0)
end

function Gladiador.ComandoWin(aIndex, Arguments)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", Gladiador_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if Spot[1] == nil or Spot[2] == nil then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoChamar), aIndex, 1)
		return
	end
	
	local vencedor = command:getNumber(Arguments, 1)
		
	if vencedor == nil or vencedor < 1 or vencedor > 2 then
		SendMessage(string.format("Use %s posição", Gladiador_Define.ComandoWin), aIndex, 1)
		SendMessage(string.format("Para saber a posição use %s", Gladiador_Define.ComandoInfo), aIndex, 1)
		return
	end
	
	local perdedor = 1
	if vencedor == 1 then
		perdedor = 2
	end
	
	Spot[3] = Spot[perdedor]
	Teleport(Spot[perdedor], 0, 125, 125)
	Spot[perdedor] = nil
	local player = User.new(Spot[vencedor])
	local guildnome = player:getGuildName()
	if guildnome ~= '' then
		SendMessageGlobal(string.format("%s [G]%s wins", player:getName(), guildnome), 0)
	else
		SendMessageGlobal(string.format("%s  wins", player:getName()), 0)
	end
end

function Gladiador.ComandoCorrigir(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", Gladiador_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if Spot[1] ~= nil and Spot[2] ~= nil then
		SendMessage(string.format("Use %s posição", Gladiador_Define.ComandoWin), aIndex, 1)
		return
	end
	
	if Spot[3] == nil then
		SendMessage(string.format("Use %s posição", Gladiador_Define.ComandoWin), aIndex, 1)
		return
	end
	
	if Spot[1] == nil then
		Spot[1] = Spot[3]
		Teleport(Spot[1], Gladiador_Define.Spot[1].Mapa, Gladiador_Define.Spot[1].X, Gladiador_Define.Spot[1].Y)
		Teleport(Spot[2], 0, 125, 125)
		Spot[2] = nil
		local player = User.new(Spot[1])
		SendMessageGlobal(string.format("[%s]", gm:getName()), 0)
		SendMessageGlobal(string.format("Correção:"), 0)
		local guildnome = player:getGuildName()
		if guildnome ~= '' then
			SendMessageGlobal(string.format("%s [G]%s wins", player:getName(), guildnome), 0)
		else
			SendMessageGlobal(string.format("%s  wins", player:getName()), 0)
		end
		
	end
	
	if Spot[2] == nil then
		Spot[2] = Spot[3]
		Teleport(Spot[2], Gladiador_Define.Spot[2].Mapa, Gladiador_Define.Spot[2].X, Gladiador_Define.Spot[2].Y)
		Teleport(Spot[1], 0, 125, 125)
		Spot[1] = nil
		local player = User.new(Spot[2])
		SendMessageGlobal(string.format("[%s]", gm:getName()), 0)
		SendMessageGlobal(string.format("Correção:"), 0)
		local guildnome = player:getGuildName()
		if guildnome ~= '' then
			SendMessageGlobal(string.format("%s [G]%s wins", player:getName(), guildnome), 0)
		else
			SendMessageGlobal(string.format("%s  wins", player:getName()), 0)
		end
	end
	
	Spot[3] = nil
end

function Gladiador.ComandoInfo(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", Gladiador_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if Spot[1] == nil or Spot[2] == nil then
		SendMessage(string.format("Restam %d jogadores no evento", #Players), aIndex, 1)
		return
	end
	local player1 = User.new(Spot[1])
	local player2 = User.new(Spot[2])
	SendMessage(string.format("Posição 1 [x] Posição 2"), aIndex, 1)
	SendMessage(string.format("%s [x] %s", player1:getName(), player2:getName()), aIndex, 1)
end

function Gladiador.ComandoFim(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", Gladiador_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if #Players > 0 then
		SendMessage(string.format("Use %s", Gladiador_Define.ComandoChamar), aIndex, 1)
		return
	end
	
	local vencedor = 1
	if Spot[vencedor] == nil then
		vencedor = 2
	end
	local player = User.new(Spot[vencedor])
	local tp = ""
	if Gladiador_Define.Premio_Tipo == 0 then
		tp = player:getAccountID()
	else
		tp = player:getName()
	end
	
	DataBase.SetAddValue(Gladiador_Define.Premio_Tabela, Gladiador_Define.Premio_Coluna, Gladiador_Define.Premio_Valor, Gladiador_Define.Premio_Where, tp)
	SendMessage(string.format("Você recebeu %d %s", Gladiador_Define.Premio_Valor, Gladiador_Define.Premio_Nome), Spot[vencedor], 1)
	SendMessageGlobal(string.format("========================="), 0)
	SendMessageGlobal(string.format("[%s]", gm:getName()), 0)
	SendMessageGlobal(string.format("Prêmio do Evento Gladiador"), 0)
	SendMessageGlobal(string.format("Adicionado para < %s >", player:getName()), 0)
	SendMessageGlobal(string.format("========================="), 0)
	Teleport(Spot[vencedor], 0, 125, 125)
	open = false
	started = false
	running = false
	timerAberto = nil
	tempoAberto = 0
	Players = {}
	Spot = {}
end

function Gladiador.Anunciar()
	if tempoAberto <= 0 then
		open = false
		Timer.Cancel(timerAberto)
		timerAberto = nil
		
		if #Players < Gladiador_Define.MinimoPlayers then
			Gladiador.Cancelar("Sistema")
			return
		end
		SendMessageGlobal(string.format("%s fechou", Gladiador_Define.ComandoIr, tempoAberto), 0)
		running = true
	else
		SendMessageGlobal(string.format("%s fecha em %d segundo(s)", Gladiador_Define.ComandoIr, tempoAberto), 0)
		tempoAberto = tempoAberto - 1
	end
end

function Gladiador.ComandoCancelar(aIndex)	
	local gm = User.new(aIndex)
	if gm:getAuthority() == 1 then return end
	
	if not running and not open then return end
	
	Gladiador.Cancelar(gm:getName())
end

function Gladiador.Cancelar(nome)
	open = false
	started = false
	running = false
	if timerAberto ~= nil then
		Timer.Cancel(timerAberto)
		timerAberto = nil
	end
	tempoAberto = 0
	Players = {}
	Spot = {}
	
	SendMessageGlobal(string.format("%s cancelou o evento gladiador", nome), 1)
end

function Gladiador.HasKey(aIndex)
	for i in ipairs(Players) do
		if Players[i].Index == aIndex then
			return true
		end
	end
	return false
end

function Gladiador.RemovePlayer(aIndex)
	for i in ipairs(Players) do
		if Players[i].Index == aIndex then
			table.remove(Players, i)
		end
	end
end

Gladiador.Init()

return Gladiador
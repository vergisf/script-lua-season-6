ReiDoMu = {}
local open = false
local running = false
local started = false
local timerAberto = nil
local tempoAberto = 0
local Players = {}
local Spot = {}

function ReiDoMu.Init()
	
	if ReiDoMu_Define.Ativado then
		Commands.Register(ReiDoMu_Define.ComandoAbrir	, ReiDoMu.ComandoAbrir    )
		Commands.Register(ReiDoMu_Define.ComandoIr		, ReiDoMu.ComandoIr       )
		Commands.Register(ReiDoMu_Define.ComandoChamar	, ReiDoMu.ComandoChamar   )
		Commands.Register(ReiDoMu_Define.ComandoIniciar	, ReiDoMu.ComandoIniciar  )
		Commands.Register(ReiDoMu_Define.ComandoCancelar , ReiDoMu.ComandoCancelar )
		Commands.Register(ReiDoMu_Define.ComandoFinaliar , ReiDoMu.ComandoFim      )
		Commands.Register(ReiDoMu_Define.ComandoWin	    , ReiDoMu.ComandoWin      )
		Commands.Register(ReiDoMu_Define.ComandoInfo	    , ReiDoMu.ComandoInfo     )
		Commands.Register(ReiDoMu_Define.ComandoCorrigir , ReiDoMu.ComandoCorrigir )
	end
end

function ReiDoMu.ComandoIr(aIndex)
	if not open then return end
	
	if #Players >= ReiDoMu_Define.MaximoPlayers then
		if not ReiDoMu.HasKey(aIndex) then		
			SendMessage(string.format(" Não há mais vagas no evento "), aIndex, 1)
			return
		end		
	end
	
	if not ReiDoMu.HasKey(aIndex) then		
		table.insert(Players, {Index = aIndex})
	end

	Teleport(aIndex, ReiDoMu_Define.Spawn.Mapa, ReiDoMu_Define.Spawn.X, ReiDoMu_Define.Spawn.Y)
	SendMessage("Você está participando do evento", aIndex, 1)
	return
end

function ReiDoMu.ComandoAbrir(aIndex, Arguments)
	local player = User.new(aIndex)
	
	if player:getAuthority() == 1 then return end
	
	if open or running then
		SendMessage(string.format("Já exsite um evento Rei Do Mu aberto"), aIndex, ALERT_COLOR)
		return
	end
	
	tempoAberto = command:getNumber(Arguments, 1)
	
	if tempoAberto == nil or tempoAberto <= 0 then
		SendMessage(string.format("Use %s <tempo>", ReiDoMu_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	open = true
	SendMessageGlobal(string.format("%s abriu %s", player:getName(), ReiDoMu_Define.ComandoIr), 1)
	timerAberto = Timer.Repeater(1, tempoAberto, ReiDoMu.Anunciar)
	return	
end

function ReiDoMu.ComandoIniciar(aIndex)
	local player = User.new(aIndex)
	
	if player:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", ReiDoMu_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if started then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoChamar), aIndex, 1)
		return
	end
	
	started = true
	
	SendMessageGlobal(string.format("========================="), 0)
	SendMessageGlobal(string.format("[%s]", player:getName()), 0)
	SendMessageGlobal(string.format("Evento Rei Do Mu iniciado"), 0)
	SendMessageGlobal(string.format("========================="), 0)
end

function ReiDoMu.ComandoChamar(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", ReiDoMu_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if Spot[1] ~= nil and Spot[2] ~= nil then
		SendMessage(string.format("Use %s posição", ReiDoMu_Define.ComandoWin), aIndex, 1)
		return
	end
	
	if #Players <= 0 then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoFinaliar), aIndex, 1)
		return
	end
	local p1Index = 0
	local p2Index = 0
	local player1 = 0
	local player2 = 0
	if Spot[1] == nil then
		::back::
		if #Players <= 0 then
			SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoFinaliar), aIndex, 1)
			return
		end
		p1Index = Players[Utils.GetRandom(1, #Players, math.random(1, 10))].Index
		player1  = User.new(p1Index)
		ReiDoMu.RemovePlayer(p1Index)
		if player1:getConnected() ~= 3 then goto back end
		Spot[1] = p1Index
	else
		if player1 == 0 then
			player1 = User.new(Spot[1])
		end
	end
	
	if Spot[2] == nil then
		::back::
		if #Players <= 0 then
			SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoFinaliar), aIndex, 1)
			return
		end
		p2Index = Players[Utils.GetRandom(1, #Players, math.random(1, 10))].Index
		player2  = User.new(p2Index)
		ReiDoMu.RemovePlayer(p2Index)
		if player2:getConnected() ~= 3 then goto back end
		Spot[2] = p2Index
	else
		if player2 == 0 then
			player2 = User.new(Spot[2])
		end
	end
	
	Teleport(Spot[1], ReiDoMu_Define.Spot[1].Mapa, ReiDoMu_Define.Spot[1].X, ReiDoMu_Define.Spot[1].Y)
	Teleport(Spot[2], ReiDoMu_Define.Spot[2].Mapa, ReiDoMu_Define.Spot[2].X, ReiDoMu_Define.Spot[2].Y)

	SendMessageGlobal(string.format("[%s]", gm:getName()), 0)
	SendMessageGlobal(string.format("%s [x] %s", player1:getName(), player2:getName()), 0)
end

function ReiDoMu.ComandoWin(aIndex, Arguments)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", ReiDoMu_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if Spot[1] == nil or Spot[2] == nil then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoChamar), aIndex, 1)
		return
	end
	
	local vencedor = command:getNumber(Arguments, 1)
		
	if vencedor == nil or vencedor < 1 or vencedor > 2 then
		SendMessage(string.format("Use %s posição", ReiDoMu_Define.ComandoWin), aIndex, 1)
		SendMessage(string.format("Para saber a posição use %s", ReiDoMu_Define.ComandoInfo), aIndex, 1)
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

function ReiDoMu.ComandoCorrigir(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", ReiDoMu_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if Spot[1] ~= nil and Spot[2] ~= nil then
		SendMessage(string.format("Use %s posição", ReiDoMu_Define.ComandoWin), aIndex, 1)
		return
	end
	
	if Spot[3] == nil then
		SendMessage(string.format("Use %s posição", ReiDoMu_Define.ComandoWin), aIndex, 1)
		return
	end
	
	if Spot[1] == nil then
		Spot[1] = Spot[3]
		Teleport(Spot[1], ReiDoMu_Define.Spot[1].Mapa, ReiDoMu_Define.Spot[1].X, ReiDoMu_Define.Spot[1].Y)
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
		Teleport(Spot[2], ReiDoMu_Define.Spot[2].Mapa, ReiDoMu_Define.Spot[2].X, ReiDoMu_Define.Spot[2].Y)
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

function ReiDoMu.ComandoInfo(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", ReiDoMu_Define.ComandoAbrir), aIndex, 1)
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

function ReiDoMu.ComandoFim(aIndex)
	local gm = User.new(aIndex)
	
	if gm:getAuthority() == 1 then return end
	
	if not running then
		SendMessage(string.format("Use %s <tempo>", ReiDoMu_Define.ComandoAbrir), aIndex, 1)
		return
	end
	
	if not started then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoIniciar), aIndex, 1)
		return
	end
	
	if #Players > 0 then
		SendMessage(string.format("Use %s", ReiDoMu_Define.ComandoChamar), aIndex, 1)
		return
	end
	
	local vencedor = 1
	if Spot[vencedor] == nil then
		vencedor = 2
	end
	local player = User.new(Spot[vencedor])
	local tp = ""
	if ReiDoMu_Define.Premio_Tipo == 0 then
		tp = player:getAccountID()
	else
		tp = player:getName()
	end
	
	DataBase.SetAddValue(ReiDoMu_Define.Premio_Tabela, ReiDoMu_Define.Premio_Coluna, ReiDoMu_Define.Premio_Valor, ReiDoMu_Define.Premio_Where, tp)
	SendMessage(string.format("Você recebeu %d %s", ReiDoMu_Define.Premio_Valor, ReiDoMu_Define.Premio_Nome), Spot[vencedor], 1)
	SendMessageGlobal(string.format("========================="), 0)
	SendMessageGlobal(string.format("[%s]", gm:getName()), 0)
	SendMessageGlobal(string.format("Prêmio do Evento Rei Do Mu"), 0)
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

function ReiDoMu.Anunciar()
	if tempoAberto <= 0 then
		open = false
		Timer.Cancel(timerAberto)
		timerAberto = nil
		
		if #Players < ReiDoMu_Define.MinimoPlayers then
			ReiDoMu.Cancelar("Sistema")
			return
		end
		SendMessageGlobal(string.format("%s fechou", ReiDoMu_Define.ComandoIr, tempoAberto), 0)
		running = true
	else
		SendMessageGlobal(string.format("%s fecha em %d segundo(s)", ReiDoMu_Define.ComandoIr, tempoAberto), 0)
		tempoAberto = tempoAberto - 1
	end
end

function ReiDoMu.ComandoCancelar(aIndex)	
	local gm = User.new(aIndex)
	if gm:getAuthority() == 1 then return end
	
	if not running and not open then return end
	
	ReiDoMu.Cancelar(gm:getName())
end

function ReiDoMu.Cancelar(nome)
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
	
	SendMessageGlobal(string.format("%s cancelou o evento Rei Do Mu", nome), 1)
end

function ReiDoMu.HasKey(aIndex)
	for i in ipairs(Players) do
		if Players[i].Index == aIndex then
			return true
		end
	end
	return false
end

function ReiDoMu.RemovePlayer(aIndex)
	for i in ipairs(Players) do
		if Players[i].Index == aIndex then
			table.remove(Players, i)
		end
	end
end

ReiDoMu.Init()

return ReiDoMu
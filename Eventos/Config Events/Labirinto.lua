
-- Ativa/Desativa o evento
-- true: ativado, false: desativado
Labirinto_Ativado			= false

-- Agenda do evento autom�tico
-- Dia da semana: Domingo(0) a S�bado(6)
Labirinto_Agenda = {
{DiaDoMes = -1, DiaDaSemana = -1, Hora = 00, Minuto = 52},
{DiaDoMes = -1, DiaDaSemana = -1, Hora = 15, Minuto = 15},
{DiaDoMes = -1, DiaDaSemana = -1, Hora = 21, Minuto = 30},

}

Labirinto_ComandoAbrir		= "/abrirlabirinto"		-- Comando para abrir o evento.  /abrirlabirinto <tempo>
Labirinto_ComandoIr			= "/labirinto"			-- COmando para o player participar do evento
Labirinto_ComandoCancelar	= "/cancelarlabirinto"	-- COmando para cancelar um labirinto que esta aberto

Labirinto_TempoAnuncio		= 1		-- Tempo em minutos que o evento autom�tico ser� anunciado
Labirinto_TempoAberto		= 15	-- Tempo em segundos que o evento autom�tico ficara aberto
Labirinto_TempoInicio		= 10	-- Tempo em segundos para iniciar o evento ap�s fechar
Labirinto_TempoLimite		= 1		-- Tempo em minutos para o evento finalizar se n�o houver ganhadroes

-- Local onde os participantes ir�o nascer no mapa
Labirinto_Move				= {Mapa = 6, X = 247, Y = 50}

-- Area onde os players ir�o esperar o inicio do evento
Labirinto_AreaEspera		= {Mapa = 6, X1 = 244, Y1 = 45, X2 =250, Y2 = 55}

-- Local onde vai ficar o NPC que os participantes tem que clicar para ganhar o evento
Labirinto_Npc				= {Classe = 249, Dir = 3, Mapa = 6, X = 185, Y = 54}

Labirinto_Npc_IsRandom = true
Labirinto_Npc_Random = {}
Labirinto_Npc_Random[1] = {Classe = 249, Dir = 3, Mapa = 6, X = 185, Y = 54}
Labirinto_Npc_Random[2] = {Classe = 249, Dir = 3, Mapa = 6, X = 185, Y = 54}
Labirinto_Npc_Random[3] = {Classe = 249, Dir = 3, Mapa = 6, X = 185, Y = 54}
Labirinto_Npc_Random[4] = {Classe = 249, Dir = 3, Mapa = 6, X = 185, Y = 54}

Labirinto_Npc_RandomMin = 1
Labirinto_Npc_RandomMax = 4

-- Area total do mapa do evento
Labirinto_AreaTotal		= {Mapa = 6, X1 = 178, Y1 = 0, X2 = 250, Y2 = 60}

-- Permitir PvP durante o evento
-- true: ativado, false: desativado
Labirinto_HabilitarPVP = false

-- Quantidade de ganhadores (se colcoar mais de 3, ajustar na lista de premios abaixo)
-- se nao quiser premiar com item, coloque Quantidade = 0
Labirinto_QtdGanhadores		= 3

-- Premio em box para os vencedores
Labirinto_PremioBox = {}
Labirinto_PremioBox[1]		= {Nome = "Jewel of Creation", Grupo = 14, Id = 22, Level = 0, Quantidade = 5}
Labirinto_PremioBox[2]		= {Nome = "Jewel of Creation", Grupo = 14, Id = 22, Level = 0, Quantidade = 3}
Labirinto_PremioBox[3]		= {Nome = "Jewel of Creation", Grupo = 14, Id = 22, Level = 0, Quantidade = 1}

-- Premio em moeda para os vencedores
Labirinto_PremioMoeda_Tabela	= "MEMB_INFO"
Labirinto_PremioMoeda_Coluna	= "cash"
Labirinto_PremioMoeda_Where		= "memb___id"
Labirinto_PremioMoeda_Tipo		= 0 -- 0 pelo login, 1 pelo nome do char
Labirinto_PremioMoeda_Nome		= "Cash"
Labirinto_PremioMoeda = {}
Labirinto_PremioMoeda[1]		= 100
Labirinto_PremioMoeda[2]		= 50
Labirinto_PremioMoeda[3]		= 30


-- premio em pontos apra os vencedores
Labirinto_PremioPonto_Tabela	= "Character"
Labirinto_PremioPonto_Coluna	= "Labirinto"
Labirinto_PremioPonto_Where		= "Name"
Labirinto_PremioPonto_Tipo		= 1 -- 0 pelo login, 1 pelo nome do char
Labirinto_PremioPonto_Nome		= "Ponto(s)"
Labirinto_PremioPonto = {}
Labirinto_PremioPonto[1]		= 1
Labirinto_PremioPonto[2]		= 0
Labirinto_PremioPonto[3]		= 0

-- Numero das skills que nao sao permitidas o uso
Labirinto_SkillProibidas = {6, 15}
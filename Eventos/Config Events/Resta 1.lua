
--Configurações evento automatico
RESTA1_AUTO_SWITCH		= 0				-- 0 Desativa o evento automático
RESTA1_ANNOUNCE_MINUTES	= 0				-- Tempo em minutos que anunciará que o evento vai começar (0 inicia sem aviso)
RESTA1_TIME_CLOSE		= 15			-- Tempo em segundos que o move ficara aberto no evento automático
-- Configuração dos horários do evento automárico
--Para o evento inicar exatamente na hora desejada, coloque o horario do evento descontando o tempo de aviso em minutos.
--Ex: Se quer que o evento começe exatamente as 22:00 e com aviso de 5 minutos, agende o evento para 21:55

--Day of Week, Day, Hour, Minute
--Day of Week: 0 a 6: Domingo, segunda, terça, quarta, quinta, sexta, sabado
--Day of Week: -1 = Day
--Day = -1 = Horas e minutos.
RESTA1_DATA	= {
{_dayofweek = -1, _day = -1, _hour = 01, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 07, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 10, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 13, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 16, _minute = 50},
{_dayofweek = -1, _day = -1, _hour = 19, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 21, _minute = 45},
}

-- Configuração evento manual
RESTA1_COMMAND_SWITCH	= 1				-- 0 desativa o comando de abrir o evento
RESTA1_COMMAND_OPEN		= "/abrirresta1"	-- Comando para abrir o evento (Sintaxe: /comando <tempo>)
RESTA1_COMMAND_GO		= "/resta1"		-- Comando para entrar no evento

-- Configurações gerais do evento
RESTA1_MIN_PLAYERS		= 2				-- Quantidade minima de players para o evento acontecer.
RESTA1_LEVEL				= 1				-- Level minimo para participar do evento
RESTA1_VIP				= 0				-- Vip minimo para participar do evento
RESTA1_RESETS			= 0				-- Quantidade minima de resets para participar do evento
RESTA1_MRESETS			= 0				-- Quantidade minima de master resets para participar do evento

RESTA1_CLASSES_PERMITIDAS = { --classes que podem ir ao evento
[0] = false, -- SM, true permitido, false não permitido
[1] = true, -- BK, true permitido, false não permitido
[2] = false, -- ELF, true permitido, false não permitido
[3] = false, -- MG, true permitido, false não permitido
[4] = false, -- DL, true permitido, false não permitido
}

RESTA1_AREA = { -- area do evento, se sair dessa area, sera desclassificado.
Map		= 1,	-- Mapa
CoordX	= 18,	-- Coordenada X -- coordenada X para onde o player sera movido ao entrar no evento
CoordY	= 23,	-- Coordenada Y	-- coordenada Y para onde o player sera movido ao entrar no evento
CoordX1	= 17,	-- Coordenada X Menor
CoordY1	= 22,	-- Coordenada Y Menor
CoordX2	= 19,	-- Coordenada X Maior
CoordY2	= 24	-- Coordenada Y Maior
} 

-- Configuração do premio
RESTA1_PREMIO_NOME = "Cash"			-- Nome da moeda
RESTA1_PREMIO_VALOR = 10			-- Quantidade da moeda
RESTA1_PREMIO_TABELA = "MEMB_INFO"	-- Tabela da moeda
RESTA1_PREMIO_COLUNA = "zCash"		-- Coluna da moeda
RESTA1_PREMIO_WHERE = "memb___id"	-- Identificador do player
RESTA1_PREMIO_TIPO = 0 				-- Tipo de identificador, 0 = login, 1 = nick

RESTA1_PONTO_VALOR = 1					-- Quantidade de pontos
RESTA1_PONTO_TABELA = "Character"		-- Tabela dos pontos
RESTA1_PONTO_COLUNA = "restaum"			-- Coluna dos pontos
RESTA1_PONTO_WHERE = "Name"				-- Identificador do player
RESTA1_PONTO_TIPO = 1 					-- Tipo de identificador, 0 = login, 1 = nick

RESTA1_PONTO2_VALOR = 1					-- Quantidade de pontos
RESTA1_PONTO2_TABELA = "Character"		-- Tabela dos pontos
RESTA1_PONTO2_COLUNA = "eventostotais"	-- Coluna dos pontos
RESTA1_PONTO2_WHERE = "Name"			-- Identificador do player
RESTA1_PONTO2_TIPO = 1 					-- Tipo de identificador, 0 = login, 1 = nick



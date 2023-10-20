
--Configurações evento automatico
SOBRE_AUTO_SWITCH		= 0				-- 0 Desativa o evento automático
SOBRE_ANNOUNCE_MINUTES	= 0				-- Tempo em minutos que anunciará que o evento vai começar (0 inicia sem aviso)
SOBRE_TIME_CLOSE		= 15			-- Tempo em segundos que o move ficara aberto no evento automático
-- Configuração dos horários do evento automárico
--Para o evento inicar exatamente na hora desejada, coloque o horario do evento descontando o tempo de aviso em minutos.
--Ex: Se quer que o evento começe exatamente as 22:00 e com aviso de 5 minutos, agende o evento para 21:55

--Day of Week, Day, Hour, Minute
--Day of Week: 0 a 6: Domingo, segunda, terça, quarta, quinta, sexta, sabado
--Day of Week: -1 = Day
--Day = -1 = Horas e minutos.
SOBRE_DATA	= {
{_dayofweek = -1, _day = -1, _hour = 01, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 07, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 10, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 13, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 16, _minute = 20},
{_dayofweek = -1, _day = -1, _hour = 19, _minute = 40},
{_dayofweek = -1, _day = -1, _hour = 21, _minute = 45},
}

-- Configuração evento manual
SOBRE_COMMAND_SWITCH	= 1				-- 0 desativa o comando de abrir o evento
SOBRE_COMMAND_OPEN		= "/abrirsobre"	-- Comando para abrir o evento (Sintaxe: /comando <tempo>)
SOBRE_COMMAND_GO		= "/sobre"		-- Comando para entrar no evento

-- Configurações gerais do evento
SOBRE_MIN_PLAYERS		= 2				-- Quantidade minima de players para o evento acontecer.
SOBRE_LEVEL				= 1				-- Level minimo para participar do evento
SOBRE_VIP				= 0				-- Vip minimo para participar do evento
SOBRE_RESETS			= 0				-- Quantidade minima de resets para participar do evento
SOBRE_MRESETS			= 0				-- Quantidade minima de master resets para participar do evento

SOBRE_CLASSES_PERMITIDAS = { --classes que podem ir ao evento
[0] = false, -- SM, true permitido, false não permitido
[1] = true, -- BK, true permitido, false não permitido
[2] = false, -- ELF, true permitido, false não permitido
[3] = false, -- MG, true permitido, false não permitido
[4] = false, -- DL, true permitido, false não permitido
}

SOBRE_AREA = { -- area do evento, se sair dessa area, sera desclassificado.
Map		= 1,	-- Mapa
CoordX	= 155,	-- Coordenada X -- coordenada X para onde o player sera movido ao entrar no evento
CoordY	= 189,	-- Coordenada Y	-- coordenada Y para onde o player sera movido ao entrar no evento
CoordX1	= 154,	-- Coordenada X Menor
CoordY1	= 185,	-- Coordenada Y Menor
CoordX2	= 156,	-- Coordenada X Maior
CoordY2	= 190	-- Coordenada Y Maior
} 

-- Configuração do premio
SOBRE_PREMIO_NOME = "Cash"			-- Nome da moeda
SOBRE_PREMIO_VALOR = 10				-- Quantidade da moeda
SOBRE_PREMIO_TABELA = "MEMB_INFO"	-- Tabela da moeda
SOBRE_PREMIO_COLUNA = "zCash"		-- Coluna da moeda
SOBRE_PREMIO_WHERE = "memb___id"	-- Identificador do player
SOBRE_PREMIO_TIPO = 0 				-- Tipo de identificador, 0 = login, 1 = nick

SOBRE_PONTO_VALOR = 1					-- Quantidade de pontos
SOBRE_PONTO_TABELA = "Character"		-- Tabela dos pontos
SOBRE_PONTO_COLUNA = "sobrevivencia"	-- Coluna dos pontos
SOBRE_PONTO_WHERE = "Name"				-- Identificador do player
SOBRE_PONTO_TIPO = 1 					-- Tipo de identificador, 0 = login, 1 = nick

SOBRE_PONTO2_VALOR = 1					-- Quantidade de pontos
SOBRE_PONTO2_TABELA = "Character"		-- Tabela dos pontos
SOBRE_PONTO2_COLUNA = "eventostotais"	-- Coluna dos pontos
SOBRE_PONTO2_WHERE = "Name"				-- Identificador do player
SOBRE_PONTO2_TIPO = 1 					-- Tipo de identificador, 0 = login, 1 = nick



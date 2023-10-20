
-- true ativa o sistema, false desativa
CharFull_Ativado = true

CharFull_ComandoPlayer	= "/ficarfull"	-- Comando para o player deixar o char full
CharFull_ComandoStaff	= "/deixarfull"	-- Comando para o staff deixar o player full  /comando nick

CharFull_Tabela	= "MEMB_INFO"		-- Tabela da contagem de uso do comando
CharFull_Coluna	= "CharFull"		-- Coluna da contagem de uso
CharFull_Where	= "memb___id"		-- Identifica��o do player
CharFull_Tipo	= 0					-- Tipo de identificador (0 para login, 1 para char)

CharFull_MaximoDeUso = {}
CharFull_MaximoDeUso[0] = 4	-- Quantidade de vezes que vip 0 pode usar o comando
CharFull_MaximoDeUso[1] = 4	-- Quantidade de vezes que vip 1 pode usar o comando
CharFull_MaximoDeUso[2] = 4	-- Quantidade de vezes que vip 2 pode usar o comando

CharFull_Level = {}
CharFull_Level[0] = 400	-- Level que o char vai ficar
CharFull_Level[1] = 400	-- Level que o char vai ficar
CharFull_Level[2] = 400	-- Level que o char vai ficar

CharFull_Pontos = {}
CharFull_Pontos[0] = 32767	-- Pontos nos status que o char vai ficar
CharFull_Pontos[1] = 32767	-- Pontos nos status que o char vai ficar
CharFull_Pontos[2] = 32767	-- Pontos nos status que o char vai ficar

CharFull_LevelStaff = 32767 -- Level que o char vai ficar quando aplicado pelo staff
CharFull_PontosStaff = 32767 -- Quantidade de pontos que o player recebe quando aplicado pelo staff
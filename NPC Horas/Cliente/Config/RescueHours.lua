-- true ativa o sistema, false desativa
NPCHoras_Config = {
	Enabled = true,

	-- Id da janela
	WindowID = 54,

	-- Numero do packet usado pelo sistema (tem que ser o mesmo no servidor)
	Packet = 121,

	Images = {
		GB_Ponto = 40001,
	},

	-- Configura��o dos itens que o player pode trocar
	-- ListID (deve come�ar em 1, n�o pode pular numero e deve ser configurado da mesma forma no servidor)
	-- Valor em horas
	-- Grupo/Sectiond o item no Item.txt
	-- Id/Index do item no Item.txt
	-- Nome do Item
	-- Level
	-- Durabilidade
	-- Skill - 1 sim, 0 não
	-- Luck - 1 sim, 0 não
	-- Option de 0 a 7
	-- Excelente - 63 item full ou asa full S/r, 31 asa full C/r
	--[[
	Ajuste da imagem do item na tela: (recomendo ajustar o MX e MY antes do X e Y)
	X = posição horizontal do item
	Y = posição vertical do item
	MX = Largura da area que faz o item girar quando passa o mouse por cima
	MY = Altura da area que faz o item girar quando passa o mouse por cima
	]]
	-- Mostrar descri��o do item, true sim, false n�o
	Brindes = {
		{ListID = 1,  Valor = 60,   Grupo = 0,    Id = 114, Nome = "Reaper Sword [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 2,  Valor = 60,   Grupo = 0,    Id = 115, Nome = "Reaper Mace [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 3,  Valor = 60,   Grupo = 0,    Id = 116, Nome = "Reaper Spear [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 4,  Valor = 60,   Grupo = 5,    Id = 66,  Nome = "Reaper Staff [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 5,  Valor = 60,   Grupo = 6,    Id = 243, Nome = "Reaper Shield [RL]",	Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 6,  Valor = 80,   Grupo = 7,    Id = 267, Nome = "Reaper Helm [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 7,  Valor = 80,   Grupo = 8,    Id = 267, Nome = "Reaper Armor [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 8,  Valor = 80,   Grupo = 9,    Id = 267, Nome = "Reaper Pants [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 9,  Valor = 80,   Grupo = 10,   Id = 267, Nome = "Reaper Gloves [RL]",	Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 10, Valor = 80,   Grupo = 11,   Id = 267, Nome = "Reaper Boots [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 11, Valor = 120,  Grupo = 12,   Id = 279, Nome = "Reaper Cape [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 47, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		{ListID = 12, Valor = 120,  Grupo = 12,   Id = 280, Nome = "Reaper Wing [RL]",	    Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 47, Pos = {X = 345, Y = 177, W = 20, H = 20}, ShowDescription = true},
		
		},

	-- textos usados no sistema
	Texts = {
		["Eng"] = {
			[1] = "B�nus por Horas",
			[2] = "Ol� aventureiro!",
			[3] = "Aqui voc� poder� trocar o",
			[4] = "tempo que permaneceu online",
			[5] = "por brindes incr�veis!",
			[6] = "Voc� possu� um total de %d Horas online",
			[7] = "Voc� possu� um total de %d Hora online",
			[8] = "Resgatar Brinde",
			[9] = "Escolha um brinde",
			[10] = "Pre�o: %d Horas",
			[11] = "Ser�o descontados %d Horas da sua conta",
			[12] = "Clique OK para confirmar",
			[13] = "Brinde retirado com sucesso!",
			[14] = "Erro! Tente novamente ou contate o administrador",
			[15] = "N�o h� espa�o no seu invent�rio!",
			[16] = "N�o h� saldo suficiente!",
		},

		["Por"] = {
			[1] = "B�nus por Horas",
			[2] = "Ol� aventureiro!",
			[3] = "Aqui voc� poder� trocar o",
			[4] = "tempo que permaneceu online",
			[5] = "por brindes incr�veis!",
			[6] = "Voc� possu� um total de %d Horas online",
			[7] = "Voc� possu� um total de %d Hora online",
			[8] = "Resgatar Brinde",
			[9] = "Escolha um brinde",
			[10] = "Pre�o: %d Horas",
			[11] = "Ser�o descontados %d Horas da sua conta",
			[12] = "Clique OK para confirmar",
			[13] = "Brinde retirado com sucesso!",
			[14] = "Erro! Tente novamente ou contate o administrador",
			[15] = "N�o h� espa�o no seu invent�rio!",
			[16] = "N�o h� saldo suficiente!",
		},

		["Spn"] = {
			[1] = "B�nus por Horas",
			[2] = "Ol� aventureiro!",
			[3] = "Aqui voc� poder� trocar o",
			[4] = "tempo que permaneceu online",
			[5] = "por brindes incr�veis!",
			[6] = "Voc� possu� um total de %d Horas online",
			[7] = "Voc� possu� um total de %d Hora online",
			[8] = "Resgatar Brinde",
			[9] = "Escolha um brinde",
			[10] = "Pre�o: %d Horas",
			[11] = "Ser�o descontados %d Horas da sua conta",
			[12] = "Clique OK para confirmar",
			[13] = "Brinde retirado com sucesso!",
			[14] = "Erro! Tente novamente ou contate o administrador",
			[15] = "N�o h� espa�o no seu invent�rio!",
			[16] = "N�o h� saldo suficiente!",
		},
	},
}

return NPCHoras_Config
Quiz_Config = {
	-- true ativa o envento, false desativa
	Ativado = false,

	-- COmando para responder a pergunta
	ComandoResposta = "/quiz",
	
	-- Comando para iniciar um quiz aleat�rio
	ComandoAbrir = "/abrirquiz",

	-- Comando para cancelar um quiz aberto
	ComandoCancelar = "/fimquiz",

 	-- tempo em minutos que o evento fica aberto, se ninguem responder ele encerrar� automaticamente
	TimeOut = 1, 

	-- Pontua��es do evento
	Premio = {
		{Quantidade = 10, Tabela = "MEMB_INFO", Coluna = "zCash", Where = "memb___id", Tipo = 0},
		{Quantidade = 1 , Tabela = "Character", Coluna = "quiz" , Where = "Name"     , Tipo = 1},
		{Quantidade = 1 , Tabela = "Character", Coluna = "honra", Where = "Name"     , Tipo = 1},
	},

	-- Perguntas e respostas
	Perguntas = {
		{
			Pergunta = {
				["Por"] = "Qual a capital do Brasil?",
				["Eng"] = "Qual a capital do Brasil?",
				["Spn"] = "Qual a capital do Brasil?",
			},
			Resposta = {
				["Por"] = "Brasilia",
				["Eng"] = "Brasilia",
				["Spn"] = "Brasilia",
			},
		},

		{
			Pergunta = {
				["Eng"] = "Quanto � 2+1x0? (Responda com n�mero)",
				["Spn"] = "Quanto � 2+1x0? (Responda com n�mero)",
				["Por"] = "Quanto � 2+1x0? (Responda com n�mero)",
			},
			Resposta = {
				["Por"] = "2",
				["Eng"] = "2",
				["Spn"] = "2",
			},
		},

	},

	-- Agenda do evento automatico
	Cron = {
		{DiaSemana = -1, Dia = -1, Hora = 00, Minuto = 23},
	},

	Mensagens = {
		["Por"] = {
			[1] = "====== QUIZ AUTOM�TICO ======",
			[2] = "Utilize %s para responder",
			[3] = "Vencedor: %s",
			[4] = "Resposta: %s",
			[5] = "[Sistema] Resposta incorreta",
			[6] = "[Sistema] Parab�ns! Voc� acertou a resposta",
			[7] = "N�o houve vencedor",
			[8] = "[Sistema] Voc� recebeu sua premia��o",
		},
		["Eng"] = {
			[1] = "====== QUIZ AUTOM�TICO ======",
			[2] = "Utilize %s para responder",
			[3] = "Vencedor: %s",
			[4] = "Resposta: %s",
			[5] = "[Sistema] Resposta incorreta",
			[6] = "[Sistema] Parab�ns! Voc� acertou a resposta",
			[7] = "N�o houve vencedor",
			[8] = "[Sistema] Voc� recebeu sua premia��o",
		},
		["Spn"] = {
			[1] = "====== QUIZ AUTOM�TICO ======",
			[2] = "Utilize %s para responder",
			[3] = "Vencedor: %s",
			[4] = "Resposta: %s",
			[5] = "[Sistema] Resposta incorreta",
			[6] = "[Sistema] Parab�ns! Voc� acertou a resposta",
			[7] = "N�o houve vencedor",
			[8] = "[Sistema] Voc� recebeu sua premia��o",
		},
	}
}

return Quiz_Config

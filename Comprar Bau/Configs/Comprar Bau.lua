
ComprarBau_Ativado = true	-- true ativa o comando, false desativa

ComprarBau_Comando = "/comprarbau"	-- comando que o player vai digitar
ComprarBau_UpdateBalance = false

ComprarBau_Moeda	= {}
ComprarBau_Moeda[0] = {Nome = "Cash", Tabela = "MEMB_INFO", Coluna = "cash", Where = "memb___id", Tipo = 0}	-- Moeda para Vip 0
ComprarBau_Moeda[1] = {Nome = "Cash", Tabela = "MEMB_INFO", Coluna = "cash", Where = "memb___id", Tipo = 0}	-- Moeda para Vip 1
ComprarBau_Moeda[2] = {Nome = "Cash", Tabela = "MEMB_INFO", Coluna = "cash", Where = "memb___id", Tipo = 0}	-- Moeda para Vip 2

ComprarBau_Valor	= {}
ComprarBau_Valor[0]	= 0	-- Preço do baú para Vip 0
ComprarBau_Valor[1]	= 0	-- Preço do baú para Vip 1
ComprarBau_Valor[2]	= 0	-- Preço do baú para Vip 2

ComprarBau_Maximo		= {}
ComprarBau_Maximo[0]	= 255	--  quantidade máxima de baús que um player Vip 0 pode comprar
ComprarBau_Maximo[1]	= 255	--  quantidade máxima de baús que um player Vip 1 pode comprar
ComprarBau_Maximo[2]	= 255	--  quantidade máxima de baús que um player Vip 2 pode comprar

ComprarBau_Msg1 = {Texto = "Quantidade máxima de baús atingida", Cor = 1}	-- Mensagem quando atingiu o máximo de baus
ComprarBau_Msg2 = {Texto = "Você precisa de %d %s para comprar baú", Cor = 1}	-- Mensagem quando não tem saldo suficiente
ComprarBau_Msg3 = {Texto = "Baú comprado com sucesso", Cor = 1}	-- Mensagem quando compra o bau
ComprarBau_Msg4 = {Texto = "Você possui %d baús extras", Cor = 1}	-- Mensagem com a quantidade total de baus após a compra
Auction_Config = {
    Enabled = true,

    Packet = 19,

    Commands = {
        Open = "/abrirleilao",
        Close = "/fimleilao",
        Cancel = "/cancelarleilao",
    },

    ServerId = 1,

    GMLevel = 5,

    CountDown = 20, --tempo em segundos que vai permitir um novo lance antes de fechar o leil�o

    Moeda = {
        [1] = {Nome = "Cash",     Tabela = "MEMB_INFO", Coluna = "Cash",       Where = "memb___id", IdType = 0},
    },

    Leilao = {
        [1] = {Nome = "1x - Set Halloween War", Item = {Index = GET_ITEM(14, 22), Level = 15, Skill = 1, Luck = 1, JoL = 1, Exc = 7,  X = 526, Y = 98, W = 40, H = 60}, Lance =  5000, Moeda = 1, ConsomeNoLance = false },
    },

    Premio = {
        [1] = {
            {Nome = "1x - Set Halloween War",        Index = GET_ITEM(14, 22),  Level = 0, Skill = 0, Luck = 0, Opt = 0, Excelente = 00, Tempo = 0, Dur = 255},
        },
        [2] = {
            {Nome = "1x - Dinorant Steel [V]",          Index = GET_ITEM(13, 276),  Level = 15, Skill = 1, Luck = 1, Opt = 7, Excelente = 00, Tempo = 0, Dur = 255},
        },
        [3] = {
            {Nome = "1x - Dinorant Black [V]",          Index = GET_ITEM(13, 277),  Level = 15, Skill = 1, Luck = 1, Opt = 7, Excelente = 00, Tempo = 0, Dur = 255},
        },
    },

    Message = {
        ["Eng"] = {
            [1] = "[Leil�o] N�o existe leil�o aberto",
            [2] = "[Leil�o] Voc� j� tem o lance atual",
            [3] = "[Leil�o] O lance ja foi coberto",
            [4] = "[Leil�o] Voc� n�o tem saldo suficiente para o lance",
            [5] = "======= LEIL�O =======",
            [6] = "%s fez um novo lance",
            [7] = " %d %s",
            [8] = "======================",
            [9] = "[Leil�o] Seu lance foi registrado",
            [10] = "%s",
            [11] = "LANCE INICIAL:",
            [12] = "[Leil�o] J� existe um leil�o aberto",
            [13] = "[Leil�o] Index do leil�o inv�lida",
            [14] = "Leil�o cancelado!",
            [15] = "[Leil�o] Leil�o cancelado!",            
            [16] = "Finaliza em %d segundos",
            [17] = "D� um novo lance para parar a contagem!",
            [18] = "Leil�o finalizado!",
            [19] = "VENCEDOR:",
            [20] = "[Leil�o] N�o s�o aceitos novos lances",
            [21] = "Leil�o finalizado!",
        },

        ["Por"] = {
            [1] = "[Leil�o] N�o existe leil�o aberto",
            [2] = "[Leil�o] Voc� j� tem o lance atual",
            [3] = "[Leil�o] O lance ja foi coberto",
            [4] = "[Leil�o] Voc� n�o tem saldo suficiente para o lance",
            [5] = "======= LEIL�O =======",
            [6] = "%s fez um novo lance",
            [7] = " %d %s",
            [8] = "======================",
            [9] = "[Leil�o] Seu lance foi registrado",
            [10] = "%s",
            [11] = "LANCE INICIAL:",
            [12] = "[Leil�o] J� existe um leil�o aberto",
            [13] = "[Leil�o] Index do leil�o inv�lida",
            [14] = "Leil�o cancelado!",
            [15] = "[Leil�o] Leil�o cancelado!",
            [16] = "Finaliza em %d segundos",
            [17] = "D� um novo lance para parar a contagem!",
            [18] = "Leil�o finalizado!",
            [19] = "VENCEDOR:",
            [20] = "[Leil�o] N�o s�o aceitos novos lances",
            [21] = "Leil�o finalizado!",
        },

        ["Spn"] = {
            [1] = "[Leil�o] N�o existe leil�o aberto",
            [2] = "[Leil�o] Voc� j� tem o lance atual",
            [3] = "[Leil�o] O lance ja foi coberto",
            [4] = "[Leil�o] Voc� n�o tem saldo suficiente para o lance",
            [5] = "======= LEIL�O =======",
            [6] = "%s fez um novo lance",
            [7] = " %d %s",
            [8] = "======================",
            [9] = "[Leil�o] Seu lance foi registrado",
            [10] = "%s",
            [11] = "LANCE INICIAL:",
            [12] = "[Leil�o] J� existe um leil�o aberto",
            [13] = "[Leil�o] Index do leil�o inv�lida",
            [14] = "Leil�o cancelado!",
            [15] = "[Leil�o] Leil�o cancelado!",
            [16] = "Finaliza em %d segundos",
            [17] = "D� um novo lance para parar a contagem!",
            [18] = "Leil�o finalizado!",
            [19] = "VENCEDOR:",
            [20] = "[Leil�o] N�o s�o aceitos novos lances",
            [21] = "Leil�o finalizado!",
        },

    }
}

return Auction_Config
PacotePromocional_Config = {
    Enabled = true,

    Packet = 45,

    Npc = {
        {Class = 586, Map = 3, PosX = 163, PosY = 100},
    },

--config moedas
    Moedas = {
        [1] = {Nome = "Diamantes" , Tabela = "MEMB_INFO", Coluna = "dimas"  , Where = "memb___id", IdType = 0},
        [2] = {Nome = "Cristais"  , Tabela = "MEMB_INFO", Coluna = "cash"   , Where = "memb___id", IdType = 0},
        [3] = {Nome = "JCPoints"  , Tabela = "MEMB_INFO", Coluna = "Points" , Where = "memb___id", IdType = 0},
		
		--arruma as moeda ai
    },

--nome do pacote e ativar %
    Pacotes = {                                                              
        {IndexPacote = 01, Nome = "Pacote Nível 1", Custo = 1, UseRate = true,  Disponibilidade = "31/12/2023"},
        {IndexPacote = 02, Nome = "Pacote Nível 2", Custo = 2, UseRate = true,  Disponibilidade = "31/12/2023"},
        {IndexPacote = 03, Nome = "Pacote Nível 3", Custo = 3, UseRate = true,  Disponibilidade = "31/12/2023"},

    },

    Custo = {
        [1] = {
            {Moeda = 1, Valor = 5},
        },
        [2] = {
            {Moeda = 2, Valor = 500},
        },
        [3] = {
            {Moeda = 3, Valor = 250},
        },
--        [3] = { --mais de uma moeda
--            {Moeda = 1, Valor = 20},
--            {Moeda = 2, Valor = 20},
--        },
    },

-- configurar % maior sempre na parte superior
    Itens = {
        [1] = {  --SOUL MASTER       
		-- ItemIndex = 20000 (Troll)		
            {ListID = 01, ItemIndex = Utils.GetItem(12, 137), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 02, ItemIndex = Utils.GetItem(12, 137), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 03, ItemIndex = Utils.GetItem(14, 352), Level =  0, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 04, ItemIndex = Utils.GetItem(0,  173), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 05, ItemIndex = Utils.GetItem(0,  174), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 06, ItemIndex = Utils.GetItem(6,  166), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 07, ItemIndex = Utils.GetItem(07, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 08, ItemIndex = Utils.GetItem(08, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 09, ItemIndex = Utils.GetItem(09, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 10, ItemIndex = Utils.GetItem(10, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 11, ItemIndex = Utils.GetItem(11, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 12, ItemIndex = Utils.GetItem(12, 368), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 13, ItemIndex = Utils.GetItem(12, 369), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 14, ItemIndex = Utils.GetItem(12, 301), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
        },

        [2] = {  --BLADE KNIGHT                                                                                                              
            {ListID = 01, ItemIndex = Utils.GetItem(14,  63), Level =  0, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {ListID = 02, ItemIndex = Utils.GetItem(12, 136), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 03, ItemIndex = Utils.GetItem(12,  30), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 04, ItemIndex = Utils.GetItem(12,  31), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {ListID = 05, ItemIndex = Utils.GetItem(12, 136), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 06, ItemIndex = Utils.GetItem(12,  30), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 07, ItemIndex = Utils.GetItem(12,  31), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 08, ItemIndex = Utils.GetItem(0,  106), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},


            {ListID = 09, ItemIndex = Utils.GetItem(0,  175), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 10, ItemIndex = Utils.GetItem(0,  176), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 11, ItemIndex = Utils.GetItem(0,  177), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 12, ItemIndex = Utils.GetItem(4,   88), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 13, ItemIndex = Utils.GetItem(5,  147), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 14, ItemIndex = Utils.GetItem(6,  167), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {ListID = 15, ItemIndex = Utils.GetItem(07, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 16, ItemIndex = Utils.GetItem(08, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 17, ItemIndex = Utils.GetItem(09, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 18, ItemIndex = Utils.GetItem(10, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 19, ItemIndex = Utils.GetItem(11, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 20, ItemIndex = Utils.GetItem(07, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 21, ItemIndex = Utils.GetItem(08, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 22, ItemIndex = Utils.GetItem(09, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 23, ItemIndex = Utils.GetItem(10, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 24, ItemIndex = Utils.GetItem(11, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 25, ItemIndex = Utils.GetItem(12, 273), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 26, ItemIndex = Utils.GetItem(13, 292), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
        },

        [3] = {  --MAGIC GLADIATOR
            {ListID = 01, ItemIndex = Utils.GetItem(14,  63), Level =  0, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {ListID = 02, ItemIndex = Utils.GetItem(12, 136), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 03, ItemIndex = Utils.GetItem(12,  30), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 04, ItemIndex = Utils.GetItem(12,  31), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {ListID = 05, ItemIndex = Utils.GetItem(12, 136), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 06, ItemIndex = Utils.GetItem(12,  30), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 07, ItemIndex = Utils.GetItem(12,  31), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 08, ItemIndex = Utils.GetItem(0,  106), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},


            {ListID = 09, ItemIndex = Utils.GetItem(0,  175), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 10, ItemIndex = Utils.GetItem(0,  176), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 11, ItemIndex = Utils.GetItem(0,  177), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 12, ItemIndex = Utils.GetItem(4,   88), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 13, ItemIndex = Utils.GetItem(5,  147), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {ListID = 14, ItemIndex = Utils.GetItem(6,  167), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {ListID = 15, ItemIndex = Utils.GetItem(07, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 16, ItemIndex = Utils.GetItem(08, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 17, ItemIndex = Utils.GetItem(09, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 18, ItemIndex = Utils.GetItem(10, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 19, ItemIndex = Utils.GetItem(11, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 20, ItemIndex = Utils.GetItem(07, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 21, ItemIndex = Utils.GetItem(08, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 22, ItemIndex = Utils.GetItem(09, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 23, ItemIndex = Utils.GetItem(10, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 24, ItemIndex = Utils.GetItem(11, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 25, ItemIndex = Utils.GetItem(12, 272), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {ListID = 26, ItemIndex = Utils.GetItem(13, 292), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
        },
    }
}

return PacotePromocional_Config
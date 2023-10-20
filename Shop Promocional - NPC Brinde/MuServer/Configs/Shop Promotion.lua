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
        {IndexPacote = 01, Nome = "Pacote Nível 1", Custo = 1, UseRate = true,  Disponibilidade = "31/12/2023", Dias = 100, TemValidade = 1},
        {IndexPacote = 02, Nome = "Pacote Nível 2", Custo = 2, UseRate = true,  Disponibilidade = "31/12/2023", Dias = 100, TemValidade = 1},
        {IndexPacote = 03, Nome = "Pacote Nível 3", Custo = 3, UseRate = true,  Disponibilidade = "31/12/2023", Dias = 100, TemValidade = 1},

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
            {Nome = "Necromancer Helm (M)[RL]", ListID = 01, Id = 137, Section = 12, ItemIndex = Utils.GetItem(12, 137), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 02, Id = 137, Section = 12, ItemIndex = Utils.GetItem(12, 137), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 03, Id = 352, Section = 14, ItemIndex = Utils.GetItem(14, 352), Level =  0, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 04, Id = 173, Section = 00, ItemIndex = Utils.GetItem(00, 173), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 05, Id = 174, Section = 00, ItemIndex = Utils.GetItem(00, 174), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 06, Id = 166, Section = 06, ItemIndex = Utils.GetItem(06, 166), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 07, Id = 260, Section = 07, ItemIndex = Utils.GetItem(07, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 08, Id = 260, Section = 08, ItemIndex = Utils.GetItem(08, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 09, Id = 260, Section = 09, ItemIndex = Utils.GetItem(09, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 10, Id = 260, Section = 10, ItemIndex = Utils.GetItem(10, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 11, Id = 260, Section = 11, ItemIndex = Utils.GetItem(11, 260), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 12, Id = 368, Section = 12, ItemIndex = Utils.GetItem(12, 368), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 13, Id = 369, Section = 12, ItemIndex = Utils.GetItem(12, 369), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]", ListID = 14, Id = 301, Section = 12, ItemIndex = Utils.GetItem(12, 301), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
        },

        [2] = {  --BLADE KNIGHT                                                                                                              
            {Nome = "Necromancer Helm (M)[RL]",ListID = 01, Id = 63, Section = 14, ItemIndex = Utils.GetItem(14,  63), Level =  0, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {Nome = "Necromancer Helm (M)[RL]",ListID = 02, Id = 136, Section = 12, ItemIndex = Utils.GetItem(12, 136), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 03, Id = 030, Section = 12, ItemIndex = Utils.GetItem(12, 030), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 04, Id = 031, Section = 12, ItemIndex = Utils.GetItem(12, 031), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {Nome = "Necromancer Helm (M)[RL]",ListID = 05, Id = 136, Section = 12, ItemIndex = Utils.GetItem(12, 136), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 06, Id = 030, Section = 12, ItemIndex = Utils.GetItem(12, 030), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 07, Id = 031, Section = 12, ItemIndex = Utils.GetItem(12, 031), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 08, Id = 106, Section = 00, ItemIndex = Utils.GetItem(00, 106), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},


            {Nome = "Necromancer Helm (M)[RL]",ListID = 09, Id = 175, Section = 00, ItemIndex = Utils.GetItem(0,  175), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 10, Id = 176, Section = 00, ItemIndex = Utils.GetItem(0,  176), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 11, Id = 177, Section = 00, ItemIndex = Utils.GetItem(0,  177), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 12, Id = 088, Section = 04, ItemIndex = Utils.GetItem(4,  088), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 13, Id = 147, Section = 05, ItemIndex = Utils.GetItem(5,  147), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 14, Id = 167, Section = 06, ItemIndex = Utils.GetItem(6,  167), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {Nome = "Necromancer Helm (M)[RL]",ListID = 15, Id = 261, Section = 07, ItemIndex = Utils.GetItem(07, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 16, Id = 261, Section = 08, ItemIndex = Utils.GetItem(08, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 17, Id = 261, Section = 09, ItemIndex = Utils.GetItem(09, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 18, Id = 261, Section = 10, ItemIndex = Utils.GetItem(10, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 19, Id = 261, Section = 11, ItemIndex = Utils.GetItem(11, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 20, Id = 262, Section = 07, ItemIndex = Utils.GetItem(07, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 21, Id = 262, Section = 08, ItemIndex = Utils.GetItem(08, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 22, Id = 262, Section = 09, ItemIndex = Utils.GetItem(09, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 23, Id = 262, Section = 10, ItemIndex = Utils.GetItem(10, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 24, Id = 262, Section = 11, ItemIndex = Utils.GetItem(11, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 25, Id = 273, Section = 12, ItemIndex = Utils.GetItem(12, 273), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 26, Id = 292, Section = 13, ItemIndex = Utils.GetItem(13, 292), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63,  Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
        },

        [3] = {  --MAGIC GLADIATOR
            {Nome = "Necromancer Helm (M)[RL]",ListID = 01, Id = 63, Section = 14, ItemIndex = Utils.GetItem(14,  63), Level =  0, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {Nome = "Necromancer Helm (M)[RL]",ListID = 02, Id = 136, Section = 12, ItemIndex = Utils.GetItem(12, 136), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 03, Id = 030, Section = 12, ItemIndex = Utils.GetItem(12, 030), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 04, Id = 031, Section = 12, ItemIndex = Utils.GetItem(12, 031), Level =  4, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0,  Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {Nome = "Necromancer Helm (M)[RL]",ListID = 05, Id = 136, Section = 12, ItemIndex = Utils.GetItem(12, 136), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 06, Id = 030, Section = 12, ItemIndex = Utils.GetItem(12, 030), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 07, Id = 031, Section = 12, ItemIndex = Utils.GetItem(12, 031), Level =  9, Dur =   0, Skill = 0, Luck = 0, JoL = 0, Exc =  0, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 08, Id = 106, Section = 00, ItemIndex = Utils.GetItem(00, 106), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {Nome = "Necromancer Helm (M)[RL]",ListID = 09, Id = 175, Section = 0, ItemIndex = Utils.GetItem(0,  175), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 10, Id = 176, Section = 0, ItemIndex = Utils.GetItem(0,  176), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 11, Id = 177, Section = 0, ItemIndex = Utils.GetItem(0,  177), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 12, Id = 088, Section = 4, ItemIndex = Utils.GetItem(4,  088), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 13, Id = 147, Section = 5, ItemIndex = Utils.GetItem(5,  147), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 14, Id = 167, Section = 6, ItemIndex = Utils.GetItem(6,  167), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-06", PosY = "015", Width = "60", Height = "050", Size = "0.8"},

            {Nome = "Necromancer Helm (M)[RL]",ListID = 15, Id = 261, Section = 07, ItemIndex = Utils.GetItem(07, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 16, Id = 261, Section = 08, ItemIndex = Utils.GetItem(08, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 17, Id = 261, Section = 09, ItemIndex = Utils.GetItem(09, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 18, Id = 261, Section = 10, ItemIndex = Utils.GetItem(10, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 19, Id = 261, Section = 11, ItemIndex = Utils.GetItem(11, 261), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 20, Id = 262, Section = 07, ItemIndex = Utils.GetItem(07, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 21, Id = 262, Section = 08, ItemIndex = Utils.GetItem(08, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 22, Id = 262, Section = 09, ItemIndex = Utils.GetItem(09, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 23, Id = 262, Section = 10, ItemIndex = Utils.GetItem(10, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 24, Id = 262, Section = 11, ItemIndex = Utils.GetItem(11, 262), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 25, Id = 272, Section = 12, ItemIndex = Utils.GetItem(12, 272), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
            {Nome = "Necromancer Helm (M)[RL]",ListID = 26, Id = 292, Section = 13, ItemIndex = Utils.GetItem(13, 292), Level = 15, Dur = 255, Skill = 1, Luck = 1, JoL = 7, Exc = 63, Count = 1, Days = 0, PosX = "-09", PosY = "00", Width = "60", Height = "50", Size = "0.8"},
        },
    }
}

return PacotePromocional_Config
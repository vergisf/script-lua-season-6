MataMata_Config = {
    Enabled = true,

    -- Version = 2 (season 2)
    -- Version = 6 (season 6)
    Version = 2,

    Command = {
        ["Eng"] = {
            Open = "/abrirmtmt",
            Go = "/matamata",
            Cancel = "/cancelarmtmt"
        },
        ["Por"] = {
            Open = "/abrirmtmt", -- /comando tempo type, se nao digitar type será um mata-mata normal
            Go = "/matamata",
            Cancel = "/cancelarmtmt"
        },
        ["Spn"] = {
            Open = "/abrirmtmt",
            Go = "/matamata",
            Cancel = "/cancelarmtmt"
        },
    },

-- Type -1 = mata mata normal. Utilize AnnounceName = -1
-- Type 2 = Mata Mata privado. Utilize AnnounceName = 40 (numero do texto que será exibido no global Por,Eng,Spn configurado la embaixo.
    Cron = {
--        {DayOfMonth = -1, DayOfWeek = 1, Hour = 19, Minute = 57, Type = 1, AnnounceName = 41},  -- Mata-Mata [C] BK
--        {DayOfMonth = -1, DayOfWeek = 2, Hour = 09, Minute = 57, Type = 1, AnnounceName = 41},  -- Mata-Mata [C] BK
--        {DayOfMonth = -1, DayOfWeek = 3, Hour = 00, Minute = 57, Type = 1, AnnounceName = 41},  -- Mata-Mata [C] BK
--        {DayOfMonth = -1, DayOfWeek = 4, Hour = 14, Minute = 57, Type = 1, AnnounceName = 41},  -- Mata-Mata [C] BK
--        {DayOfMonth = -1, DayOfWeek = 5, Hour = 19, Minute = 57, Type = 1, AnnounceName = 41},  -- Mata-Mata [C] BK
--        {DayOfMonth = -1, DayOfWeek = 6, Hour = 08, Minute = 57, Type = 1, AnnounceName = 41},  -- Mata-Mata [C] BK
--        {DayOfMonth = -1, DayOfWeek = 7, Hour = 01, Minute = 57, Type = 1, AnnounceName = 41},  -- Mata-Mata [C] BK
--		
--		{DayOfMonth = -1, DayOfWeek = 1, Hour = 14, Minute = 57, Type = 2, AnnounceName = 42},  -- Mata-Mata [B] BK
--        {DayOfMonth = -1, DayOfWeek = 2, Hour = 19, Minute = 57, Type = 2, AnnounceName = 42},  -- Mata-Mata [B] BK
--        {DayOfMonth = -1, DayOfWeek = 3, Hour = 09, Minute = 57, Type = 2, AnnounceName = 42},  -- Mata-Mata [B] BK
--        {DayOfMonth = -1, DayOfWeek = 4, Hour = 00, Minute = 57, Type = 2, AnnounceName = 42},  -- Mata-Mata [B] BK
--        {DayOfMonth = -1, DayOfWeek = 5, Hour = 14, Minute = 57, Type = 2, AnnounceName = 42},  -- Mata-Mata [B] BK
--        {DayOfMonth = -1, DayOfWeek = 6, Hour = 20, Minute = 57, Type = 2, AnnounceName = 42},  -- Mata-Mata [B] BK
--        {DayOfMonth = -1, DayOfWeek = 7, Hour = 08, Minute = 57, Type = 2, AnnounceName = 42},  -- Mata-Mata [B] BK
--
--		{DayOfMonth = -1, DayOfWeek = 1, Hour = 00, Minute = 57, Type = 3, AnnounceName = 43},  -- Mata-Mata [A] BK
--        {DayOfMonth = -1, DayOfWeek = 2, Hour = 14, Minute = 57, Type = 3, AnnounceName = 43},  -- Mata-Mata [A] BK
--        {DayOfMonth = -1, DayOfWeek = 3, Hour = 19, Minute = 57, Type = 3, AnnounceName = 43},  -- Mata-Mata [A] BK
--        {DayOfMonth = -1, DayOfWeek = 4, Hour = 09, Minute = 57, Type = 3, AnnounceName = 43},  -- Mata-Mata [A] BK
--        {DayOfMonth = -1, DayOfWeek = 5, Hour = 00, Minute = 57, Type = 3, AnnounceName = 43},  -- Mata-Mata [A] BK
--        {DayOfMonth = -1, DayOfWeek = 6, Hour = 13, Minute = 57, Type = 3, AnnounceName = 43},  -- Mata-Mata [A] BK
--        {DayOfMonth = -1, DayOfWeek = 7, Hour = 20, Minute = 57, Type = 3, AnnounceName = 43},  -- Mata-Mata [A] BK
--		
--		{DayOfMonth = -1, DayOfWeek = 1, Hour = 09, Minute = 57, Type = 4, AnnounceName = 44},  -- Mata-Mata [S]&[Z] BK
--        {DayOfMonth = -1, DayOfWeek = 2, Hour = 00, Minute = 57, Type = 4, AnnounceName = 44},  -- Mata-Mata [S]&[Z] BK
--        {DayOfMonth = -1, DayOfWeek = 3, Hour = 14, Minute = 57, Type = 4, AnnounceName = 44},  -- Mata-Mata [S]&[Z] BK
--        {DayOfMonth = -1, DayOfWeek = 4, Hour = 19, Minute = 57, Type = 4, AnnounceName = 44},  -- Mata-Mata [S]&[Z] BK
--        {DayOfMonth = -1, DayOfWeek = 5, Hour = 09, Minute = 57, Type = 4, AnnounceName = 44},  -- Mata-Mata [S]&[Z] BK
--        {DayOfMonth = -1, DayOfWeek = 6, Hour = 01, Minute = 57, Type = 4, AnnounceName = 44},  -- Mata-Mata [S]&[Z] BK
--        {DayOfMonth = -1, DayOfWeek = 7, Hour = 13, Minute = 57, Type = 4, AnnounceName = 44},  -- Mata-Mata [S]&[Z] BK
--		
--		{DayOfMonth = -1, DayOfWeek = 6, Hour = 15, Minute = 57, Type = 5, AnnounceName = 45},  -- Mata-Mata ALL ITENS ALL CLASSES
    },

    TimeAnnounce = 3, -- tempo em minutos que avisa que vai haver o evento

    TimeOpen = 60, -- tempo em segundo que o comando entrar fica aberto

    Area = { -- Somente dois mapas
        [1] = {
            Total = {Map  = 51, X1 = 185, X2 = 247, Y1 = 144, Y2 = 246},
            Wait = {Map  = 51, X1 = 185, X2 = 247, Y1 = 144, Y2 = 246},
            PvP = {Map  = 51, X1 = 198, X2 = 234, Y1 = 165, Y2 = 224},
            Spot = {
                [1] = {Map  = 51, X = 216, Y = 195},
                [2] = {Map  = 51, X = 216, Y = 196},
            },
            Watch = {Map  = 51, X = 213, Y = 195},
            Respawn = {Map  = 51, X = 195, Y = 195},
        },

        [2] = {
            Total = {Map  = 52, X1 = 185, X2 = 247, Y1 = 144, Y2 = 246},
            Wait = {Map  = 52, X1 = 185, X2 = 247, Y1 = 144, Y2 = 246},
            PvP = {Map  = 52, X1 = 198, X2 = 234, Y1 = 165, Y2 = 224},
            Spot = {
                [1] = {Map  = 52, X = 216, Y = 195},
                [2] = {Map  = 52, X = 216, Y = 196},
            },
            Watch = {Map  = 52, X = 213, Y = 195},
            Respawn = {Map  = 52, X = 195, Y = 195},
        }
    },

    Rounds = { -- a quantidade de rounds deve ser sempre IMPAR (1, 3, 5, etc) 
        Normal = 3, -- quantidades de rounds a ser disputados em lutas normais
        Semi = 5, -- quantidade de rounds a ser disputados na semi-final
        Final = 5 -- quantidade de rounds a ser disputados na final
    },
	
	RoundDelay = 7, -- segundos que demora entre uma luta e outra
	
    LogoutExitEvent = true, -- true = é removido do evento se relogar, false pode voltar ao evento se ainda estiver na mesma fase

    RemoveBuffBeforeFight = true, -- true remove todos so buffs do char antes de lutar, false nao remove

    Prize = {
        [1] = {
            {Name = "Seeds", 			Amount = 350, 	Table = "MEMB_INFO", Column = "seeds", 		Where = "memb___id", 	IdType = 0, Announce = true},
            {Name = "Points Ranking", 	Amount = 1, 	Table = "Character", Column = "matamata", 	Where = "Name", 		IdType = 1, Announce = false},
            {Name = "Pontos de Honra", 	Amount = 100, 	Table = "Character", Column = "honra", 		Where = "Name", 		IdType = 1, Announce = true},
        },
        [2] = {
            {Name = "Seeds", 			Amount = 250, 	Table = "MEMB_INFO", Column = "seeds", 		Where = "memb___id", 	IdType = 0, Announce = true},
           {Name = "Pontos de Honra", 	Amount = 75, 	Table = "Character", Column = "honra", 		Where = "Name", 		IdType = 1, Announce = true},
        },
        [3] = {
            {Name = "Seeds", 			Amount = 150, 	Table = "MEMB_INFO", Column = "seeds", 		Where = "memb___id", 	IdType = 0, Announce = true},
            {Name = "Pontos de Honra", 	Amount = 50, 	Table = "Character", Column = "honra", 		Where = "Name", 		IdType = 1, Announce = true},
        },
    },

    CounterItem = { -- Remove = mortes removidas quando perde, Add = mortes adicionadas quando ganha, so funciona para itens no slot 0
-- dentro do [ ] colocar o calculo da sword/mace "sessão*512+index"
        [20] = {Remove = 1, Add = 1},
    },

    Types = { -- Allowed Item -1 = qualquer item. AllowedClasse -1 = qualquer classe.
        [1] = {Name = 46, AllowElement = false, AllowedItem = 01, AllowedClass = 01, Invite = -1}, -- Evento Mata-Mata [C]BK's
        [2] = {Name = 47, AllowElement = true, AllowedItem = 02, AllowedClass = 01, Invite = -1}, -- Evento Mata-Mata [B]BK's
        [3] = {Name = 48, AllowElement = true, AllowedItem = 03, AllowedClass = 01, Invite = -1}, -- Evento Mata-Mata [A]BK's
        [4] = {Name = 49, AllowElement = true, AllowedItem = 04, AllowedClass = 01, Invite = -1}, -- Evento Mata-Mata [S & Z]BK's
        [5] = {Name = 50, AllowElement = true, AllowedItem = -1, AllowedClass = 01, Invite = -1}, -- Evento Mata-Mata [All]BK's
        [6] = {Name = 39, AllowElement = true, AllowedItem = -1, AllowedClass = 01, Invite =  1}, -- Evento Mata-Mata Privado BK
		-- MATA MATA DE SM
		[7] =  {Name = 46, AllowElement = false, AllowedItem = 01, AllowedClass = 02, Invite = -1}, -- Evento Mata-Mata [C]SM's
        [8] =  {Name = 47, AllowElement = true, AllowedItem = 02, AllowedClass = 02, Invite = -1}, -- Evento Mata-Mata [B]SM's
        [9] =  {Name = 48, AllowElement = true, AllowedItem = 03, AllowedClass = 02, Invite = -1}, -- Evento Mata-Mata [A]SM's
        [10] = {Name = 49, AllowElement = true, AllowedItem = 04, AllowedClass = 02, Invite = -1}, -- Evento Mata-Mata [S & Z]SM's
        [11] = {Name = 50, AllowElement = true, AllowedItem = -1, AllowedClass = 02, Invite = -1}, -- Evento Mata-Mata [All]SM's
        [12] = {Name = 39, AllowElement = true, AllowedItem = -1, AllowedClass = 02, Invite =  1}, -- Evento Mata-Mata Privado SM
		-- MATA MATA DE ELF
		[13] = {Name = 46, AllowElement = false, AllowedItem = 01, AllowedClass = 03, Invite = -1}, -- Evento Mata-Mata [C]ELF's
        [14] = {Name = 47, AllowElement = true, AllowedItem = 02, AllowedClass = 03, Invite = -1}, -- Evento Mata-Mata [B]ELF's
        [15] = {Name = 48, AllowElement = true, AllowedItem = 03, AllowedClass = 03, Invite = -1}, -- Evento Mata-Mata [A]ELF's
        [16] = {Name = 49, AllowElement = true, AllowedItem = 04, AllowedClass = 03, Invite = -1}, -- Evento Mata-Mata [S & Z]ELF's
        [17] = {Name = 50, AllowElement = true, AllowedItem = -1, AllowedClass = 03, Invite = -1}, -- Evento Mata-Mata [All]ELF's
        [18] = {Name = 39, AllowElement = true, AllowedItem = -1, AllowedClass = 03, Invite =  1}, -- Evento Mata-Mata Privado ELF's
		-- MATA MATA DE MG
		[19] = {Name = 46, AllowElement = false, AllowedItem = 01, AllowedClass = 04, Invite = -1}, -- Evento Mata-Mata [C]MG's
        [20] = {Name = 47, AllowElement = true, AllowedItem = 02, AllowedClass = 04, Invite = -1}, -- Evento Mata-Mata [B]MG's
        [21] = {Name = 48, AllowElement = true, AllowedItem = 03, AllowedClass = 04, Invite = -1}, -- Evento Mata-Mata [A]MG's
        [22] = {Name = 49, AllowElement = true, AllowedItem = 04, AllowedClass = 04, Invite = -1}, -- Evento Mata-Mata [S & Z]MG's
        [23] = {Name = 50, AllowElement = true, AllowedItem = -1, AllowedClass = 04, Invite = -1}, -- Evento Mata-Mata [All]MG's
        [24] = {Name = 39, AllowElement = true, AllowedItem = -1, AllowedClass = 04, Invite =  1}, -- Evento Mata-Mata Privado MG's
		-- MATA MATA /BONUS ITENS
        [26] = {Name = 54, AllowElement = false, AllowedItem = 05, AllowedClass = -1, Invite = -1}, -- Evento Mata-Mata Iniciante /bonus BK
	},
	
-- Lembrando q se o GM abrir o evento só digitando "/abrirmtmt tempo" sem o Types, o sistema vai abrir um mt mt comum, somente BK's podendo usar qualquer item.
    
	Invite = {
        [1] = {Amount = 1, Section = 14, Index = 73, Level = -1},
    },

    AllowedClasses = {
        [1] = { -- classes permitidas no mata mata Types [1] configurado acima. BK'S
            [0] = false, -- SM
            [1] = true,  -- BK
            [2] = false, -- ELF
            [3] = false, -- MG
            [4] = false, -- DL
            [5] = false, -- SUM
            [6] = false, -- RF
        },
        [2] = { -- classes permitidas no mata mata Types [2] configurado acima. SM'S
            [0] = true, -- SM
            [1] = false,  -- BK
            [2] = false, -- ELF
            [3] = false, -- MG
            [4] = false, -- DL
            [5] = false, -- SUM
            [6] = false, -- RF
        },
        [3] = { -- classes permitidas no mata mata Types [3] configurado acima. ELF'S
            [0] = false, -- SM
            [1] = false,  -- BK
            [2] = true, -- ELF
            [3] = false, -- MG
            [4] = false, -- DL
            [5] = false, -- SUM
            [6] = false, -- RF
        },
		[4] = { -- classes permitidas no mata mata Types [4] configurado acima. MG's
            [0] = false, -- SM
            [1] = false,  -- BK
            [2] = false, -- ELF
            [3] = true, -- MG
            [4] = false, -- DL
            [5] = false, -- SUM
            [6] = false, -- RF
        },
		[5] = { -- classes permitidas no mata mata Types [5] configurado acima. DL's
            [0] = false, -- SM
            [1] = false,  -- BK
            [2] = false, -- ELF
            [3] = false, -- MG
            [4] = true, -- DL
            [5] = false, -- SUM
            [6] = false, -- RF
        },
    },

    AllowedItens = {
        [1] = { -- Itens Permitidos Mata Mata Iniciante ( Classe C - BK )
		-- Swords Classicas permitidas
            {Section = 0 , Index = 0 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 1 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 2 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 4 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 6 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 7 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 8 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 9 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 10 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 11 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 14 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 15 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 16 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 17 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 18 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 19 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 20 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 31 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Axes Permitidas			
            {Section = 1 , Index = 0 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 1 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 2 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 3 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 4 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 6 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 7 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 8 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Maces Permitidas			
            {Section = 2 , Index = 0 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 1 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 2 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 3 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 4 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 6 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 7 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 8 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 9 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 10, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 11, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 12, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 13, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 2 , Index = 15, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Spears Permitidas			
            {Section = 3 , Index = 0 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 1 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 2 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 3 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 4 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 6 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 7 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 8 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 9 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 3 , Index = 10, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Shields classicos permitidos
            {Section = 6 , Index = 0 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 1 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 2 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 3 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 4 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 6 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 7 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 8 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 9 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 10, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 11, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 12, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 13, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 14, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 15, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 16, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		--Helms classicos permitidos
            {Section = 7 , Index = 0  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 1  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 2  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 3  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 4  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 5  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 6  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 7  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 8  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 9  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 10 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 11 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 14 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 16 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 17 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 18 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 19 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		--Armors classicos permitidos
            {Section = 8 , Index = 0  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 1  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 2  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 3  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 4  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 5  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 6  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 7  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 8  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 9  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 10 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 11 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 14 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 15 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 16 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 17 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 18 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 19 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 20 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		--Pants classicos permitidos
            {Section = 9 , Index = 0  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 1  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 2  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 3  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 4  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 5  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 6  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 7  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 8  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 9  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 10 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 11 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 14 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 15 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 16 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 17 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 18 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 19 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 20 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		--Gloves classicos permitidos
            {Section = 10 , Index = 0  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 1  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 2  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 3  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 4  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 5  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 6  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 7  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 8  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 9  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 10 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 11 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 14 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 15 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 16 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 17 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 18 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 19 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 20 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		--Boots classicos permitidos
            {Section = 11 , Index = 0  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 1  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 2  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 3  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 4  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 5  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 6  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 7  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 8  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 9  , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 10 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 11 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 14 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 15 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 16 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 17 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 18 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 19 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 20 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Wings classicas permitidas	
            {Section = 12 , Index = 0 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12 , Index = 1 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 12 , Index = 2 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12 , Index = 3 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12 , Index = 4 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12 , Index = 6 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- KIT ANEIS CLASSE C LIBERADO PARA CLASSE C INICIANTE
            {Section = 13, Index = 08 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 09 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
        },
		[2] = { -- Itens permitidos Mata Mata CLASSE B
		-- Swords permitidas Classe B
            {Section = 0 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0}, -- Bone Blade [B]
            {Section = 0 , Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0}, -- "Titanium Sword[B]"
            {Section = 0 , Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 0 , Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Weapons B
            {Section = 1 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 59 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 60 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 61 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 62 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 63 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 64 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 65 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 66 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 67 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 68 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 69 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 70 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 71 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 104 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Bows
            {Section = 4 , Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Staffs permitidas Classe B
            {Section = 5 , Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 5 , Index = 101, MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Shields permitidas Classe B
            {Section = 6 , Index = 17 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 18 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 6 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 59 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 60 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

            {Section = 6 , Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 91 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 6 , Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 104 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 6 , Index = 105 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Helms Classe B
            {Section = 7 , Index = 29 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 30 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 33 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 35 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 36 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 38 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 7 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 59 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 60 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 61 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 7 , Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 91 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

            {Section = 7 , Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 104 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

		-- Armor Classe B
            {Section = 8 , Index = 29 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 30 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 33 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 35 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 36 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 38 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 8 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 59 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 60 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 61 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 8 , Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 91 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

            {Section = 8 , Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 104 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Pants Classe B
            {Section = 9 , Index = 29 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 30 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 33 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 35 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 36 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 38 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 9 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 59 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 60 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 61 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 9 , Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 91 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

            {Section = 9 , Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 104 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Gloves Classe B
            {Section = 10 , Index = 29 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 30 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 33 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 35 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 36 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 38 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 10 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 59 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 60 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 61 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
					   
            {Section = 10 , Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 91 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
					   
            {Section = 10 , Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10 , Index = 104 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Boots Classe B
            {Section = 11 , Index = 29 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 30 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 33 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 35 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 36 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 38 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
					   
            {Section = 11 , Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 59 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 60 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 61 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
					   
            {Section = 11 , Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 91 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
					   
            {Section = 11 , Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11 , Index = 104 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

		-- Wings classe B
            {Section = 12, Index = 50 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 51 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 52 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 53 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 54 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 55 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 56 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 57 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 58 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 12, Index = 91 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 92 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			
            {Section = 12, Index = 100 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 101 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 102 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 103 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

		-- KIT ANEIS CLASSE C LIBERADO PARA CLASSE B
            {Section = 13, Index = 08 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 09 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- PETS
            {Section = 13, Index = 150 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 400 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 401 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},

        },
		[3] = { -- Itens permitidos Mata Mata CLASSE A
		-- Swords Classe A
            {Section = 1 , Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 1 , Index = 73 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- BOWS A
            {Section = 4 , Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Staffs Classe A
            {Section = 5 , Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Shields Classe A
            {Section = 6 , Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Helms Classe A
            {Section = 7 , Index = 71 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 7 , Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Armors Classe A
            {Section = 8 , Index = 71 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 8 , Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Pants Classe A
            {Section = 9 , Index = 71 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 9 , Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Gloves Classe A
            {Section = 10, Index = 71 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 10, Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Gloves Classe A
            {Section = 11, Index = 71 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 11, Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Wings Classe A
            {Section = 12, Index = 71 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 12, Index = 72 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- KIT ANEIS CLASSE C LIBERADO PARA CLASSE A
            {Section = 13, Index = 08 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 09 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- PETS PERMITIDOS CLASSE A

		},
		[4] = { -- Itens permitidos Mata Mata CLASSE S and Z
		-- Swords Classe S and Z
            {Section = 2 , Index = 92 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- Wings Classe S and Z
            {Section = 12, Index = 90 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		-- KIT ANEIS CLASSE C LIBERADO PARA CLASSE S
            {Section = 13, Index = 08 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 09 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            {Section = 13, Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		},
		[5]	= { -- ITENS MATA MATA /BONUS 
			{Section = 0 , Index = 0 ,  MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 1 , Index = 0 ,  MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 6 , Index = 4 ,  MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 7  , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 8  , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 9  , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 10 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 11 , Index = 5 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
			{Section = 12 , Index = 2 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 08 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 09 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 12 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 13 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 21 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 22 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 23 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 24 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 25 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 26 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 27 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
            --{Section = 13, Index = 28 , MaxLevel = 15, Skill = 1, Luck = 1, MaxOpt = 7, MaxExc = 6, Ancient = 0},
		}
	},

    Message = {
        ["Eng"] = {
            [1] = "Já existe um Mata-Mata aberto, use %s para cancelar",
            [2] = "Tempo mínimo 5 segundos, use %s <tempo>",
            [3] = " Evento Mata-Mata foi aberto",
            [4] = ">> Evento Mata-Mata <<",
            [5] = "%s fecha em %d segundos",
            [6] = "%s fecha em %d segundo",
            [7] = "Não existe um Mata-Mata aberto, use %s para abrir",
            [8] = "Evento Mata-Mata foi cancelado",
            [9] = "Não há evento Mata-mata aberto no momento",
            [10] = "Você foi movido ao evento",
            [11] = "========================",
            [12] = "%s",
            [13] = "[vs]",
            [14] = "Fase Final Iniciada",
            [15] = "%s passou de fase por falta de oponente",
            [16] = "~ Fase (%d) iniciada! ~",
            [17] = "Mata-Mata cancelado por falta de participantes",
            [18] = "ATENÇÃO!",
            [19] = "JAAH!",
            [20] = "%d",
            [21] = "%s Win",
            [22] = "VENCEDORES:",
            [23] = "%dº - %s",
            [24] = "~ SEMI-FINAL DO MATA-MATA! ~",
            [25] = "~ FINAL DO MATA-MATA! ~",
            [26] = "%s[%s] Win",
            [27] = "Tipo de evento não existe",
            [28] = " Sua classe não é permitida nesse evento",
            [29] = " Você está usando itens proibidos no evento",
            [30] = " Você precisa ter o convite no seu inventário para participar",
            [31] = "<<~ %s %d [vs] %d %s ~>>",
            [32] = "====== Melhor de %d =====",
            [33] = " Parabéns, você foi o %dº colocado",
            [34] = " Você recebeu %d %s",
            [35] = " Evento Mata-Mata finalizado",
            [36] = " Você foi removido do evento",
            [37] = " Mata-Mata inicia em %d minuto(s)",
            [38] = ">> Evento Mata-Mata Iniciante(BK's) <<",
            [39] = ">> Evento Mata-Mata Privado <<",
            [40] = "Mata-Mata Privado inicia em %d minuto(s)",
			[41] = "Mata-Mata [C] inicia em %d minuto(s)",
            [42] = "Mata-Mata [B] inicia em %d minuto(s)",
            [43] = "Mata-Mata [A] inicia em %d minuto(s)",
            [44] = "Mata-Mata [S]&[Z] inicia em %d minuto(s)",
            [45] = "Mata-Mata All inicia em %d minuto(s)",
            [46] = ">> Evento Mata-Mata [C] <<",
            [47] = ">> Evento Mata-Mata [B] <<",
            [48] = ">> Evento Mata-Mata [A] <<",
            [49] = ">> Evento Mata-Mata [S]&[Z] <<",
            [50] = ">> Evento Mata-Mata All <<",
            [51] = ">> Evento Mata-Mata Nightmare <<",
            [52] = ">> Evento Mata-Mata Steel <<",
            [53] = ">> Evento Mata-Mata All da Semana <<",
            [54] = ">> Evento Mata-Mata All Iniciante <<"
        },
	

        ["Por"] = {
            [1] = "Já existe um Mata-Mata aberto, use %s para cancelar",
            [2] = "Tempo mínimo 5 segundos, use %s <tempo>",
            [3] = " Evento Mata-Mata foi aberto",
            [4] = ">> Evento Mata-Mata <<",
            [5] = "%s fecha em %d segundos",
            [6] = "%s fecha em %d segundo",
            [7] = "Não existe um Mata-Mata aberto, use %s para abrir",
            [8] = "Evento Mata-Mata foi cancelado",
            [9] = "Não há evento Mata-mata aberto no momento",
            [10] = "Você foi movido ao evento",
            [11] = "========================",
            [12] = "%s",
            [13] = "X",
            [14] = "Fase Final Iniciada",
            [15] = "%s passou de fase por falta de oponente",
            [16] = "~ Fase (%d) iniciada! ~",
            [17] = "Mata-Mata cancelado por falta de participantes",
            [18] = "ATENÇÃO!",
            [19] = "JAAH!",
            [20] = "%d",
            [21] = "%s Win",
            [22] = "VENCEDORES:",
            [23] = "%dº - %s",
            [24] = "~ SEMI-FINAL DO MATA-MATA! ~",
            [25] = "~ FINAL DO MATA-MATA! ~",
            [26] = "%s[%s] Win",
            [27] = "Tipo de evento não existe",
            [28] = " Sua classe não é permitida nesse evento",
            [29] = " Você está usando itens proibidos no evento",
            [30] = " Você precisa ter o convite no seu inventário para participar",
            [31] = "<<~ %s %d [vs] %d %s ~>>",
            [32] = "====== Melhor de %d =====",
            [33] = " Parabéns, você foi o %dº colocado",
            [34] = " Você recebeu %d %s",
            [35] = " Evento Mata-Mata finalizado",
            [36] = " Você foi removido do evento",
            [37] = " Mata-Mata inicia em %d minuto(s)",
            [38] = ">> Evento Mata-Mata Iniciante(BK's) <<",
            [39] = ">> Evento Mata-Mata Privado <<",
            [40] = "Mata-Mata Privado inicia em %d minuto(s)",
			[41] = "Mata-Mata [C] inicia em %d minuto(s)",
            [42] = "Mata-Mata [B] inicia em %d minuto(s)",
            [43] = "Mata-Mata [A] inicia em %d minuto(s)",
            [44] = "Mata-Mata [S]&[Z] inicia em %d minuto(s)",
            [45] = "Mata-Mata All inicia em %d minuto(s)",
            [46] = ">> Evento Mata-Mata [C] <<",
            [47] = ">> Evento Mata-Mata [B] <<",
            [48] = ">> Evento Mata-Mata [A] <<",
            [49] = ">> Evento Mata-Mata [S]&[Z] <<",
            [50] = ">> Evento Mata-Mata All <<",
            [51] = ">> Evento Mata-Mata Nightmare <<",
            [52] = ">> Evento Mata-Mata Steel <<",
            [53] = ">> Evento Mata-Mata All da Semana <<",
            [54] = ">> Evento Mata-Mata All Iniciante <<"
        },

        ["Spn"] = {
            [1] = "Já existe um Mata-Mata aberto, use %s para cancelar",
            [2] = "Tempo mínimo 5 segundos, use %s <tempo>",
            [3] = " Evento Mata-Mata foi aberto",
            [4] = ">> Evento Mata-Mata <<",
            [5] = "%s fecha em %d segundos",
            [6] = "%s fecha em %d segundo",
            [7] = "Não existe um Mata-Mata aberto, use %s para abrir",
            [8] = "Evento Mata-Mata foi cancelado",
            [9] = "Não há evento Mata-mata aberto no momento",
            [10] = "Você foi movido ao evento",
            [11] = "========================",
            [12] = "%s",
            [13] = "X",
            [14] = "Fase Final Iniciada",
            [15] = "%s passou de fase por falta de oponente",
            [16] = "~ Fase (%d) iniciada! ~",
            [17] = "Mata-Mata cancelado por falta de participantes",
            [18] = "ATENÇÃO!",
            [19] = "JAAH!",
            [20] = "%d",
            [21] = "%s Win",
            [22] = "VENCEDORES:",
            [23] = "%dº - %s",
            [24] = "~ SEMI-FINAL DO MATA-MATA! ~",
            [25] = "~ FINAL DO MATA-MATA! ~",
            [26] = "%s[%s] Win",
            [27] = "Tipo de evento não existe",
            [28] = " Sua classe não é permitida nesse evento",
            [29] = " Você está usando itens proibidos no evento",
            [30] = " Você precisa ter o convite no seu inventário para participar",
            [31] = "<<~ %s %d [vs] %d %s ~>>",
            [32] = "====== Melhor de %d =====",
            [33] = " Parabéns, você foi o %dº colocado",
            [34] = " Você recebeu %d %s",
            [35] = " Evento Mata-Mata finalizado",
            [36] = " Você foi removido do evento",
            [37] = " Mata-Mata inicia em %d minuto(s)",
            [38] = ">> Evento Mata-Mata Iniciante(BK's) <<",
            [39] = ">> Evento Mata-Mata All Privado <<",
            [40] = "Mata-Mata Privado inicia em %d minuto(s)",
			[41] = "Mata-Mata [C] inicia em %d minuto(s)",
            [42] = "Mata-Mata [B] inicia em %d minuto(s)",
            [43] = "Mata-Mata [A] inicia em %d minuto(s)",
            [44] = "Mata-Mata [S]&[Z] inicia em %d minuto(s)",
            [45] = "Mata-Mata All inicia em %d minuto(s)",
            [46] = ">> Evento Mata-Mata [C] <<",
            [47] = ">> Evento Mata-Mata [B] <<",
            [48] = ">> Evento Mata-Mata [A] <<",
            [49] = ">> Evento Mata-Mata [S]&[Z] <<",
            [50] = ">> Evento Mata-Mata All <<",
            [51] = ">> Evento Mata-Mata Nightmare <<",
            [52] = ">> Evento Mata-Mata Steel <<",
            [53] = ">> Evento Mata-Mata All da Semana <<",
            [54] = ">> Evento Mata-Mata All Iniciante <<"
        },
    }
}

return MataMata_Config
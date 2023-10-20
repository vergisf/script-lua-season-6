MonsterDrop_Config = {
    Enabled = true,
    
    Monster = {
        {Class = -1, Local = -1, Drop = {Enabled = true, Index = 1, Random = true}, Coin = {Enabled = true, Index = 1, Random = true}, CoinAndItem = false, ItemToCoinRate = {[0] = 50, [1] = 50, [2] = 50},  Vip = {[0] = true, [1] = true, [2] = true}},
    },
    
    Local = {
        [1] = {Mapa = 0, Start = {X = 0,  Y = 0}, End ={ X = 255, Y = 255}},
        [2] = {Mapa = 2, Start = {X = 0,  Y = 0}, End ={ X = 255, Y = 255}},
        [3] = {Mapa = 3, Start = {X = 0,  Y = 0}, End ={ X = 255, Y = 255}},

    },

    Drop = {
        -- Section = -1, Index = 0 (Bypass drop)
        -- Section = -1, Index = 1 (Block drop)
        [1] = {
            {Section = -1 , Index = 1 , Level = {Min = 0, Max = 15}, Skill = {[0] = 50, [1] = 50, [2] = 50}, Luck = {[0] = 50, [1] = 50, [2] = 50}, Opt = {Min = 0, Max = 7}, Exc = {[1] = {[0] = 50, [1] = 50, [2] = 50}, [2] = {[0] = 50, [1] = 50, [2] = 50}, [3] = {[0] = 50, [1] = 50, [2] = 50}, [4] = {[0] = 50, [1] = 50, [2] = 50}, [5] = {[0] = 50, [1] = 50, [2] = 50}, [6] = {[0] = 50, [1] = 50, [2] = 50}}, Ancient = {[0] = 50, [1] = 50, [2] = 50}, Socket = {[1] = {[0] = 50, [1] = 50, [2] = 50}, [2] = {[0] = 50, [1] = 50, [2] = 50}, [3] = {[0] = 50, [1] = 50, [2] = 50}}, ItemTime = 0, Rate = {[0] = 50, [1] = 50, [2] = 50}},
            {Section =  0, Index =  20 , Level = {Min = 0, Max = 15}, Skill = {[0] = 50, [1] = 50, [2] = 50}, Luck = {[0] = 50, [1] = 50, [2] = 50}, Opt = {Min = 0, Max = 7}, Exc = {[1] = {[0] = 50, [1] = 50, [2] = 50}, [2] = {[0] = 50, [1] = 50, [2] = 50}, [3] = {[0] = 50, [1] = 50, [2] = 50}, [4] = {[0] = 50, [1] = 50, [2] = 50}, [5] = {[0] = 50, [1] = 50, [2] = 50}, [6] = {[0] = 50, [1] = 50, [2] = 50}}, Ancient = {[0] = 50, [1] = 50, [2] = 50}, Socket = {[1] = {[0] = 50, [1] = 50, [2] = 50}, [2] = {[0] = 50, [1] = 50, [2] = 50}, [3] = {[0] = 50, [1] = 50, [2] = 50}}, ItemTime = 0, Rate = {[0] = 50, [1] = 50, [2] = 50}},
        },
    },

    Coin = {
        [1] = {
            {Name = "Goblin Points", Amount = 10, Table = "CashShopData", Column = "GoblinPoint", Where = "AccountID", IdType = 0, Announce = true, Rate = {[0] = 50, [1] = 50, [2] = 50}},
            {Name = "WCoinC", Amount = 15, Table = "CashShopData", Column = "WCoinC", Where = "AccountID", IdType = 0, Announce = true, Rate = {[0] = 50, [1] = 50, [2] = 50}},
        },
    },

    Message = {
        ["Por"] = {
			[1] = "You received %d %s",
		},
        ["Eng"] = {
			[1] = "Você recebeu %d %s",
		},
        ["Spn"] = {
			[1] = "Ricibiste %d %s",
		}
    }
}

return MonsterDrop_Config
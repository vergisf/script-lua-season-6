GuardiaoBrindes_Config ={
	Name = "Guardião de Brindes",
	Enabled = true,
	Packet = 0x34,
	Npc = {
		{
			class = 544,
			map = 2,
			x = 209,
			y = 60,
			dir = 3
		},
	},
	
	Position = {
		[GET_ITEM(7,129)] =  {X = 330, Y = 70,  W = 40, H = 70},
		[GET_ITEM(8,129)] =  {X = 330, Y = 80,  W = 45, H = 55},
		[GET_ITEM(9,129)] =  {X = 330, Y = 85,  W = 50, H = 60},
		[GET_ITEM(10,129)] = {X = 330, Y = 65,  W = 40, H = 90},
		[GET_ITEM(11,129)] = {X = 340, Y = 90,  W = 30, H = 30},
		[GET_ITEM(0,125)] =  {X = 340, Y = 90,  W = 30, H = 30},
		[GET_ITEM(2,47)] =   {X = 340, Y = 90,  W = 30, H = 30},
		[GET_ITEM(6,51)] =   {X = 340, Y = 100, W = 30, H = 30},
		[GET_ITEM(12,257)] = {X = 340, Y = 100, W = 30, H = 30},
		[GET_ITEM(12,256)] = {X = 340, Y = 100, W = 30, H = 30},
	}
}

return GuardiaoBrindes_Config
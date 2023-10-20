MoveCustom {
	interfaceNumber = 90876,
	packetCode = 0x48,
	imagesLoad = {
		background = "Interface\\bg_move_custom.tga",
		closeButton = "Interface\\close_btn.tga",
    	closeBtnHover = "Interface\\close_btn_hover.tga",
	},

	moveCustomConfigMap = {
		{name = 'Lorencia',  index = 01, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
		{name = 'Noria',     index = 02, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
		{name = 'Devias',    index = 03, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
	 
		{name = 'Dungeon',   index = 04, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
		{name = 'Losttower', index = 05, IX = 273, IY = 188, alignText = {[0] = 273, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
		{name = 'Atlans',  	 index = 06, IX = 338, IY = 188, alignText = {[0] = 338, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
	 
		{name = 'Tarkan', 	 index = 07, IX = 208, IY = 219, alignText = {[0] = 208, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
		{name = 'Icarus', 	 index = 08, IX = 273, IY = 219, alignText = {[0] = 273, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 10, cdX = 017, cdY = 017, listMove = false},
		{name = 'Arena',  	 index = 09, IX = 338, IY = 219, alignText = {[0] = 338, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 00, cdX = 125, cdY = 125, listMove = true},
	
		{name = 'Aida', 	 index = 10, IX = 208, IY = 250, alignText = {[0] = 208, [1] = 259}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 086, cdY = 009, listMove = true},
	},

	moveCustomConfigMoves = {
		['Lorencia'] = {
			{title = 'Bar',        	 index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 125, cdY = 125},
			{title = 'Mago',       	 index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 119, cdY = 113},
			{title = 'Ferreiro',   	 index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 118, cdY = 141},
	
			{title = 'Lorencia 2', 	 index = 4, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 76,  cdY = 155},
			{title = 'Lorencia 4', 	 index = 5, IX = 273, IY = 188, alignText = {[0] = 273, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 210, cdY = 109},
			{title = 'Cemitério',  	 index = 6, IX = 338, IY = 188, alignText = {[0] = 338, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 140, cdY = 225},
	
			{title = 'Baú de Baixo', index = 7, IX = 208, IY = 219, alignText = {[0] = 208, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 148, cdY = 111},
			{title = 'Baú de Cima',  index = 8, IX = 273, IY = 219, alignText = {[0] = 273, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 147, cdY = 143},
			{title = 'Centro',       index = 9, IX = 338, IY = 219, alignText = {[0] = 338, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 0, cdX = 136, cdY = 128},
		},

		['Noria'] = {
			{title = 'Noria 2',       index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 3, cdX = 15,  cdY = 15},
			{title = 'Noria 3',       index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 3, cdX = 235, cdY = 135},
			{title = 'Baú',           index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 3, cdX = 172, cdY = 98},
		
			{title = 'Chaos Machine', index = 4, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 3, cdX = 180, cdY = 102},
			{title = 'Chaos Genesis', index = 5, IX = 273, IY = 188, alignText = {[0] = 273, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 3, cdX = 184, cdY = 102},
		},

		['Devias'] = {
			{title = 'Igreja',        index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 2, cdX = 209, cdY = 25},
			{title = 'Guild Master',  index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 2, cdX = 216, cdY = 45},
			{title = 'Devias 2',      index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 2, cdX = 24,  cdY = 26},
		
			{title = 'Devias 3',      index = 4, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 2, cdX = 226, cdY = 231},
			{title = 'Devias 4',      index = 5, IX = 273, IY = 188, alignText = {[0] = 273, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 2, cdX = 71,  cdY = 181},
		},

		['Dungeon'] = {
			{title = 'Dungeon 2',  	  index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 1, cdX = 50,  cdY = 205},
			{title = 'Dungeon 3',  	  index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 1, cdX = 215, cdY = 225},
			{title = 'Dungeon 4', 	  index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 1, cdX = 100, cdY = 50},
		},

		['Losttower'] = {
			{title = 'Losttower 2',   index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 4, cdX = 240, cdY = 240},
			{title = 'Losttower 3',   index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 4, cdX = 86,  cdY = 167},
			{title = 'Losttower 4',   index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 4, cdX = 90,  cdY = 90},
		
			{title = 'Losttower 5',   index = 4, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 4, cdX = 128, cdY = 53},
			{title = 'Losttower 6',   index = 5, IX = 273, IY = 188, alignText = {[0] = 273, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 4, cdX = 55,  cdY = 55},
			{title = 'Losttower 7',   index = 6, IX = 338, IY = 188, alignText = {[0] = 338, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 4, cdX = 08,  cdY = 86},
		},

		['Atlans'] = {
			{title = 'Atlans 1', 	  index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 7, cdX = 22,  cdY = 17},
			{title = 'Atlans 2', 	  index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 7, cdX = 226, cdY = 53},
			{title = 'Atlans 3', 	  index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 7, cdX = 63, cdY = 163},
		},

		['Tarkan'] = {
			{title = 'Tarkan 2', 	  index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 8, cdX = 30, cdY = 225},
			{title = 'Tarkan 3', 	  index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 8, cdX = 50, cdY = 160},
			{title = 'Tarkan 4', 	  index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 8, cdX = 95, cdY = 35},
			{title = 'Tarkan 5', 	  index = 4, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 8, cdX = 160, cdY = 125},
		},

		['Arena'] = {
			{title = 'Arena 1', 	  index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 55, cdY = 80},
			{title = 'Arena 2', 	  index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 38, cdY = 44},
			{title = 'Arena 3', 	  index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 38, cdY = 66},
		
			{title = 'Arena 4', 	  index = 4, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 38, cdY = 84},
			{title = 'Arena 5', 	  index = 5, IX = 273, IY = 188, alignText = {[0] = 273, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 20, cdY = 83},
			{title = 'Arena 6', 	  index = 6, IX = 338, IY = 188, alignText = {[0] = 338, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 20, cdY = 65},
		
			{title = 'Arena 7', 	  index = 7, IX = 208, IY = 219, alignText = {[0] = 208, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 20, cdY = 47},
			{title = 'Arena 8',   	  index = 8, IX = 273, IY = 219, alignText = {[0] = 273, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 40, cdY = 10},
			{title = 'Arena 9',       index = 9, IX = 338, IY = 219, alignText = {[0] = 338, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 60, cdY = 7},
		
			{title = 'Arena 10',      index = 10, IX = 208, IY = 250, alignText = {[0] = 208, [1] = 259}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 90, cdY = 40},
			{title = 'Arena 11',      index = 11, IX = 273, IY = 250, alignText = {[0] = 273, [1] = 259}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 90, cdY = 115},
			{title = 'Portao',        index = 12, IX = 338, IY = 250, alignText = {[0] = 338, [1] = 259}, wdth = 60, heigth = 25, mapNumber = 6, cdX = 63, cdY = 119},
		},

		['Aida'] = {
			{title = 'Aida', 	  index = 1, IX = 208, IY = 157, alignText = {[0] = 208, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 88, cdY = 09},
			{title = 'Aida 1', 	  index = 2, IX = 273, IY = 157, alignText = {[0] = 273, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 104, cdY = 11},
			{title = 'Aida 2', 	  index = 3, IX = 338, IY = 157, alignText = {[0] = 338, [1] = 165}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 123, cdY = 19},
		
			{title = 'Aida 3', 	  index = 4, IX = 208, IY = 188, alignText = {[0] = 208, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 145, cdY = 17},
			{title = 'Aida 4', 	  index = 5, IX = 273, IY = 188, alignText = {[0] = 273, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 166, cdY = 16},
			{title = 'Aida 5', 	  index = 6, IX = 338, IY = 188, alignText = {[0] = 338, [1] = 197}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 181, cdY = 16},
		
			{title = 'Aida 6', 	  index = 7, IX = 208, IY = 219, alignText = {[0] = 208, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 226, cdY = 12},
			{title = 'Aida 7',    index = 8, IX = 273, IY = 219, alignText = {[0] = 273, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 198, cdY = 47},
			{title = 'Aida 8',    index = 9, IX = 338, IY = 219, alignText = {[0] = 338, [1] = 228}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 225, cdY = 62},
		
			{title = 'Aida 9',    index = 10, IX = 208, IY = 250, alignText = {[0] = 208, [1] = 259}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 223, cdY = 114},
			{title = 'Aida 10',   index = 11, IX = 273, IY = 250, alignText = {[0] = 273, [1] = 259}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 208, cdY = 167},
			{title = 'Aida 11',   index = 12, IX = 338, IY = 250, alignText = {[0] = 338, [1] = 259}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 234, cdY = 94},
		
			{title = 'Aida 12',   index = 13, IX = 208, IY = 280, alignText = {[0] = 208, [1] = 288}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 209, cdY = 78},
			{title = 'Aida 13',   index = 14, IX = 273, IY = 280, alignText = {[0] = 273, [1] = 288}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 193, cdY = 150},
			{title = 'Aida 14',   index = 15, IX = 338, IY = 280, alignText = {[0] = 338, [1] = 288}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 152, cdY = 115},
		
			{title = 'Aida 15',   index = 13, IX = 208, IY = 313, alignText = {[0] = 208, [1] = 321}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 133, cdY = 138},
			{title = 'Aida 16',   index = 14, IX = 273, IY = 313, alignText = {[0] = 273, [1] = 321}, wdth = 60, heigth = 25, mapNumber = 33, cdX = 91, cdY = 167},
		}
	}
}

return MoveCustom
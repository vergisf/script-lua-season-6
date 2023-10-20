--[[
Configs
]]--

local CHAOS_BOX_GENESIS_MONSTER_ID = 580
local CHAOS_BOX_GENESIS_MONSTER_ID_MAP = {}
CHAOS_BOX_GENESIS_MONSTER_ID_MAP[00] = 580--lORENCIA
CHAOS_BOX_GENESIS_MONSTER_ID_MAP[03] = 580--NORIA
CHAOS_BOX_GENESIS_MONSTER_ID_MAP[99] = 580--INVASAO
CHAOS_BOX_GENESIS_MONSTER_ID_MAP[07] = 580--Atlans
CHAOS_BOX_GENESIS_MONSTER_ID_MAP[98] = 582--npc hallo


local CHAOS_MACHINE_CONFIG_COMB_SELECTION = { }
---------------------------------------
---------COMBINAÇOES EM MAPAS----------
---------------------------------------
CHAOS_MACHINE_CONFIG_COMB_SELECTION[0] = {--CRIAÇOES POR MAPA [NUMERO MAP] --LORENCIA
	{ Combination = 1,   CombinationSuccessRate = 100.00, CombinationName = "Jewel of Cristal Red"},
	{ Combination = 2,   CombinationSuccessRate = 100.00, CombinationName = "Jewel of Cristal Red"},
}

CHAOS_MACHINE_CONFIG_COMB_SELECTION[3] = {--CRIAÇOES POR MAPA [NUMERO MAP] --NORIA
	{ Combination = 1,   CombinationSuccessRate =  25.00, CombinationName = "Especial 05 Helm [V]"},
}

-----------------------------------------------------
----IGREDIENTES DOS ITENS POR MAPA-----LORENCIA------
-----------------------------------------------------
local CHAOS_MACHINE_CONFIG_COMB_INGREDIENTS = { }
CHAOS_MACHINE_CONFIG_COMB_INGREDIENTS[0] = {
	[1] = { -- NUMERO DA CRIAÇÃO DO MAP
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 30),   ItemName = "Mix 30 Jewel of Bless" },
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 31),   ItemName = "Mix 30 Jewel of Soul" },
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 136),  ItemName = "Mix 30 Jewel of Life" },
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 141),  ItemName = "Mix 30 Jewel of Chaos" },
	},
	[2] = { -- NUMERO DA CRIAÇÃO DO MAP
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 30),   ItemName = "Mix 30 Jewel of Bless" },
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 31),   ItemName = "Mix 30 Jewel of Soul" },
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 136),  ItemName = "Mix 30 Jewel of Life" },
		{ Level = 2, Exc = -1, Luck = 0, Life = 0, Skill = 0, Quantity = 1, ItemIndex = GET_ITEM(12, 141),  ItemName = "Mix 30 Jewel of Chaos" },
	},
}
-----------------------------------------------------
----IGREDIENTES DOS ITENS POR MAPA-----NORIA---------
-----------------------------------------------------
CHAOS_MACHINE_CONFIG_COMB_INGREDIENTS[3] = { --IGREDIENTES DAS CRIAÇÕES POR MAPA = NORIA
	[1] = {-- NUMERO DA CRIAÇÃO DO MAP
	    { Level = -1, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity =  3, ItemIndex = GET_ITEM(14, 342),    ItemName = "Jewel of Cristal Red" },
	    { Level =  2, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity =  1, ItemIndex = GET_ITEM(12,  30),    ItemName = "Mix 30 Jewel of Bless" },
	    { Level =  2, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity =  1, ItemIndex = GET_ITEM(12,  31),    ItemName = "Mix 30 Jewel of Soul" },
	    { Level =  2, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity =  1, ItemIndex = GET_ITEM(12, 136),    ItemName = "Mix 30 Jewel of Life" },
	    { Level =  2, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity =  1, ItemIndex = GET_ITEM(12, 141),    ItemName = "Mix 30 Jewel of Chaos" },
	    { Level =  0, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity =  1, ItemIndex = GET_ITEM(14, 354),    ItemName = "Mix 10 Visual Scroll" },
	    { Level = -1, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity =  1, ItemIndex = GET_ITEM(0,  106),    ItemName = "Sword of War [RL]" },
	    { Level = -1, Exc = -1, Luck = 0, Life = 0, Skill = 0,  Quantity = 10, ItemIndex = GET_ITEM(0,  105),    ItemName = "Majestyc Sword [RL]" },
	},
}

-----------------------------------------------------
--------RESULTADO DA CRIAÇÃO POR MAPA ---LOREN-------
-----------------------------------------------------
local CHAOS_MACHINE_CONFIG_COMB_ITEM_REWARD = { }
CHAOS_MACHINE_CONFIG_COMB_ITEM_REWARD[0] = {-- INDEX DO MAPA E ABAIXO AS INDEX E PREMIAÇÕES
	[1] = {
		{ ItemIndex = GET_ITEM(14, 342), Level = 0, Skill = 0, Luck = 0, Life = 0, Exc = 0, Op380 = 0, Ancient = 0, JoH = 0, Socket = 0, timer = 0},
	},
	[2] = {
		{ ItemIndex = GET_ITEM(14, 342), Level = 0, Skill = 0, Luck = 0, Life = 0, Exc = 0, Op380 = 0, Ancient = 0, JoH = 0, Socket = 0, timer = 0},
	},
}

-----------------------------------------------------
--------RESULTADO DA CRIAÇÃO POR MAPA ---NORIA-------
-----------------------------------------------------
CHAOS_MACHINE_CONFIG_COMB_ITEM_REWARD[3] = {-- INDEX DO MAPA E ABAIXO AS INDEX E PREMIAÇÕES
	[1] = {
		{ ItemIndex = GET_ITEM(7, 245), Level =  15, Skill = 1, Luck = 1, Life = 1, Exc =  63, Op380 = 0, Ancient = 0, JoH = 0, Socket = 0, timer = 0},
	},
}

CHAOS_MACHINE_MESSAGES = { }

CHAOS_MACHINE_MESSAGES["Por"] = {
[1] = "Falta itens para a combinação!",
[2] = "Ocorreu algum erro de configuração desse mix!",
[3] = "Sua combinação falhou!",
[4] = "Sua combinação foi bem sucedida!",
}

CHAOS_MACHINE_MESSAGES["Eng"] = {
[1] = "Missing items for the combination!",
[2] = "There was an error in the configuration of this mix!",
[3] = "Your combination failed!",
[4] = "Your combination was successful!",
}

CHAOS_MACHINE_MESSAGES["Spn"] = {
[1] = "¡Elementos faltantes para la combinación!",
[2] = "¡Hubo un error en la configuración de esta mezcla!",
[3] = "¡Tu combinación falló!",
[4] = "¡Tu combinación fue exitosa!",
}

--[[
System don't touch
--]]

ChaosMachineGenesis = { }

local ChaosMachineIngredients = { }
local ChaosMachineItensReward = { }

function ChaosMachineGenesis.NpcTalk(NpcIndex, PlayerIndex)
	local npc = User.new(NpcIndex)
	local player = User.new(PlayerIndex)
	local mapNumber = player:getMapNumber()
	
	local idMonster = CHAOS_BOX_GENESIS_MONSTER_ID
	if CHAOS_BOX_GENESIS_MONSTER_ID_MAP[mapNumber] then 
		idMonster = CHAOS_BOX_GENESIS_MONSTER_ID_MAP[mapNumber]
	end
	
	if (npc:getClass() == idMonster)
	then
		OpenChaosMachineGenesis(PlayerIndex)
	end
	
	npc = nil
	
end

function ChaosMachineGenesis.SetIngredientItens(mapNumber, key)
	if CHAOS_MACHINE_CONFIG_COMB_INGREDIENTS[mapNumber][key] == nil
	then
		return
	end

	local value = 1
	
	for i in ipairs(CHAOS_MACHINE_CONFIG_COMB_INGREDIENTS[mapNumber][key]) do
		ChaosMachineIngredients[value] = { Ingredients = CHAOS_MACHINE_CONFIG_COMB_INGREDIENTS[mapNumber][key][i] }
		
		value = value + 1
	end
end

function ChaosMachineGenesis.SetRewardItens(mapNumber, key)
	if CHAOS_MACHINE_CONFIG_COMB_ITEM_REWARD[mapNumber][key] == nil
	then
		return
	end

	local value = 1
	
	for i in ipairs(CHAOS_MACHINE_CONFIG_COMB_ITEM_REWARD[mapNumber][key]) do
		ChaosMachineItensReward[value] = { Rewards = CHAOS_MACHINE_CONFIG_COMB_ITEM_REWARD[mapNumber][key][i] }
		
		value = value + 1
	end
end

function ChaosMachineGenesis.CheckItens(item, ItemIndex, Quantity, Level, Exc, Luck, Skill, Life)
	local itemFind = 0
	local itemQuantity = 0

	if item == nil
	then
		return 0
	end
	
	for i = 0, 119 do
		if item:isItem(i) == 0
		then
			goto continue
		end

		if item:getIndex(i) ~= ItemIndex
		then
			goto continue
		end

		if Exc ~= -1
		then
			if item:getItemTable(i, 1) <= 0
			then
				goto continue
			end
		end

		if Luck ~= 0
		then
			if item:getItemTable(i, 3) <= 0
			then
				goto continue 
			end
		end

		if Skill ~= 0
		then
			if item:getItemTable(i, 2) <= 0
			then
				goto continue 
			end
		end

		if Life ~= 0
		then
			if item:getItemTable(i, 4) < Life
			then
				goto continue 
			end
		end

		if (Level == -1 or item:getLevel(i) == Level)
		then
			itemFind = 1

			if GetStackItem(item:getIndex(i)) ~= 0
			then
				itemQuantity = itemQuantity + item:getDurability(i)
			else
				itemQuantity = itemQuantity + 1
			end
		end

		::continue::
	end
	
	--clear stack from muserver
	collectgarbage()
	
	if itemFind == 1 and itemQuantity == Quantity
	then
		return 1
	end
	
	return 0
end

function ChaosMachineGenesis.CheckCanMix(player)
	local itemMissing = 0

	local chaosMachineGenesis = ChaosBoxGenesis.new(player:getIndex())
	
	for i in ipairs(ChaosMachineIngredients) do
		local itens = ChaosMachineIngredients[i].Ingredients
		
		if itens ~= nil
		then
			if ChaosMachineGenesis.CheckItens(chaosMachineGenesis, itens.ItemIndex, itens.Quantity, itens.Level, itens.Exc, itens.Luck, itens.Skill, itens.Life) == 0
			then
				itemMissing = itemMissing + 1
			end
		end
	end

	chaosMachineGenesis = nil
	
	if itemMissing == 0
	then
		return 1
	end
	
	return 0
end

function ChaosMachineGenesis.getSerialForNewItem()
	local db = DataBase.getDb()
	
	db:exec('EXEC WZ_GetItemSerial')
	
	if db:fetch() ~= SQL_NO_DATA
	then
		local result = db:getResult(1)
		db:clear()
		return result
	else
		db:clear()
		return -1
	end
end

function ChaosMachineGenesis.CombFail(player)
	ChaosBoxGenesisInit(player:getIndex())
	
	ChaosBoxGenesisMixSend(player:getIndex(), 2)
	
	player:setChaosBoxGenesisState(2)
	
	ChaosBoxGenesisItemListSend(player:getIndex())

	SaveChaosBoxGenesis(player:getIndex())
end

function ChaosMachineGenesis.CombSucess(player)
	ChaosBoxGenesisInit(player:getIndex())
	
	ChaosBoxGenesisMixSend(player:getIndex(), 1)
	
	player:setChaosBoxGenesisState(1)
	
	--insert itens
	for i in ipairs(ChaosMachineItensReward) do
		local itens = ChaosMachineItensReward[i].Rewards
		
		if itens ~= nil
		then
			local serial = ChaosMachineGenesis.getSerialForNewItem()
			
			if serial ~= -1
			then
				ChaosBoxGenesisCreateItem(player:getIndex(), itens.ItemIndex, itens.Level, itens.Skill, itens.Luck, itens.Life, itens.Exc, itens.Op380, itens.Ancient, itens.JoH, itens.Socket, itens.timer, serial)
			end
		end
	end
	
	ChaosBoxGenesisItemListSend(player:getIndex())

	SaveChaosBoxGenesis(player:getIndex())
end

function ChaosMachineGenesis.Mixar(aIndex)
	local player = User.new(aIndex)
	local Language = player:getLanguage()

	if player:getChaosBoxGenesisState() ~= 0
	then
		return
	end

	ChaosMachineIngredients = { }
	
	ChaosMachineGenesis.SetIngredientItens(player:getMapNumber(), player:getChaosBoxGenesisSelectedComb())
	
	ChaosMachineItensReward = { }
	
	ChaosMachineGenesis.SetRewardItens(player:getMapNumber(), player:getChaosBoxGenesisSelectedComb())
	
	if (ChaosMachineGenesis.CheckCanMix(player) == 0)
	then
		SendMessage(string.format(CHAOS_MACHINE_MESSAGES[Language][1]), player:getIndex(), 1)
		return
	end

	local MixInfo = CHAOS_MACHINE_CONFIG_COMB_SELECTION[player:getMapNumber()][player:getChaosBoxGenesisSelectedKey()]
	
	if MixInfo == nil
	then
		SendMessage(string.format(CHAOS_MACHINE_MESSAGES[Language][2]), player:getIndex(), 1)
		return
	end

	math.randomseed(os.time())
	
	local randValue = math.random(0, 100)
	
	if MixInfo.CombinationSuccessRate < randValue
	then
		ChaosMachineGenesis.CombFail(player, mixInfo)
		
		SendMessage(string.format(CHAOS_MACHINE_MESSAGES[Language][3]), player:getIndex(), 1)
	else
		ChaosMachineGenesis.CombSucess(player)
		
		SendMessage(string.format(CHAOS_MACHINE_MESSAGES[Language][4]), player:getIndex(), 1)
	end
	
	collectgarbage()
end

GameServerFunctions.NpcTalk(ChaosMachineGenesis.NpcTalk)
GameServerFunctions.ChaosMachineGenesisMix(ChaosMachineGenesis.Mixar)

return ChaosMachineGenesis
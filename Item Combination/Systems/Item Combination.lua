ItemCombination = {}

function ItemCombination.CharacterSet(aIndex)
    local player = User.new(aIndex)
    local pInv = Inventory.new(aIndex)

    local playeritens = {
        [0  ] = {Index = pInv:getIndex(0  ), Level = pInv:getLevel(0  )},
        [1  ] = {Index = pInv:getIndex(1  ), Level = pInv:getLevel(1  )},
        [2  ] = {Index = pInv:getIndex(2  ), Level = pInv:getLevel(2  )},
        [3  ] = {Index = pInv:getIndex(3  ), Level = pInv:getLevel(3  )},
        [4  ] = {Index = pInv:getIndex(4  ), Level = pInv:getLevel(4  )},
        [5  ] = {Index = pInv:getIndex(5  ), Level = pInv:getLevel(5  )},
        [6  ] = {Index = pInv:getIndex(6  ), Level = pInv:getLevel(6  )},
        [7  ] = {Index = pInv:getIndex(7  ), Level = pInv:getLevel(7  )},
        [8  ] = {Index = pInv:getIndex(8  ), Level = pInv:getLevel(8  )},
        [9  ] = {Index = pInv:getIndex(9  ), Level = pInv:getLevel(9  )},
        [10 ] = {Index = pInv:getIndex(10 ), Level = pInv:getLevel(10 )},
        [11 ] = {Index = pInv:getIndex(11 ), Level = pInv:getLevel(11 )},
        [236] = {Index = pInv:getIndex(236), Level = pInv:getLevel(236)},
        [237] = {Index = pInv:getIndex(237), Level = pInv:getLevel(237)},
        [238] = {Index = pInv:getIndex(238), Level = pInv:getLevel(238)},
        [239] = {Index = pInv:getIndex(239), Level = pInv:getLevel(239)},
    }

    local combinations = {}
    for i in ipairs(ItemCombination_Config.Bonus) do
        local valid = true
        for b in ipairs(ItemCombination_Config.Bonus[i].Itens) do
            if GET_ITEM(ItemCombination_Config.Bonus[i].Itens[b].Section, ItemCombination_Config.Bonus[i].Itens[b].Index) ~= playeritens[ItemCombination_Config.Bonus[i].Itens[b].Slot].Index then
                valid = false
            else
                if ItemCombination_Config.Bonus[i].Itens[b].Level ~= -1 and ItemCombination_Config.Bonus[i].Itens[b].Level ~= playeritens[ItemCombination_Config.Bonus[i].Itens[b].Slot].Level then
                    valid = false
                end
            end
        end

        if valid then
            table.insert(combinations, ItemCombination_Config.Config[ItemCombination_Config.Bonus[i].Config])
        else
        end
    end

    if #combinations >= 1 then
        for i in ipairs(combinations) do
            if combinations[i].Defense > 0
			then
				player:setDefense((math.floor(player:getDefense() * combinations[i].Defense)))
			end
			
			if combinations[i].DefensePvP > 0
			then
				player:setDefensePvP((math.floor(player:getDefensePvP() * combinations[i].DefensePvP)))
			end
			
			if combinations[i].BlockSuccess > 0
			then
				player:setSuccessBlock(math.floor(player:getSuccessBlock() * combinations[i].BlockSuccess))
			end
			
			if combinations[i].BlockSuccessPvP > 0
			then
				player:setSuccessBlockPvP(math.floor(player:getSuccessBlockPvP() * combinations[i].BlockSuccessPvP))
			end
			
			if combinations[i].AddLife > 0
			then
				player:setAddLife((math.floor(player:getAddLife() + combinations[i].AddLife)))
			end
			
			if combinations[i].AddMana > 0
			then
				player:setAddMana((math.floor(player:getAddMana() + combinations[i].AddMana)))
			end
			
			if combinations[i].MinDmgLeft > 0
			then
				player:setAttackDamageMinLeft((math.floor(player:getAttackDamageMinLeft() * combinations[i].MinDmgLeft)))
			end
			
			if combinations[i].MaxDmgLeft > 0
			then
				player:setAttackDamageMaxLeft((math.floor(player:getAttackDamageMaxLeft() * combinations[i].MaxDmgLeft)))
			end
			
			if combinations[i].MinDmgRight > 0
			then
				player:setAttackDamageMinRight((math.floor(player:getAttackDamageMinRight() * combinations[i].MinDmgRight)))
			end
			
			if combinations[i].MaxDmgRight > 0
			then
				player:setAttackDamageMaxRight((math.floor(player:getAttackDamageMaxRight() * combinations[i].MaxDmgRight)))
			end
			
			if combinations[i].MagicMinDmg > 0
			then
				player:setMagicDamageMin((math.floor(player:getMagicDamageMin() * combinations[i].MagicMinDmg)))
			end
			
			if combinations[i].MagicMaxDmg > 0
			then
				player:setMagicDamageMax((math.floor(player:getMagicDamageMax() * combinations[i].MagicMaxDmg)))
			end
			
			if combinations[i].AttackSpeed > 0
			then
				player:setAttackSpeed((math.floor(player:getAttackSpeed() * combinations[i].AttackSpeed)))
			end
			
			if combinations[i].MagicSpeed > 0
			then
				player:setMagicSpeed((math.floor(player:getMagicSpeed() * combinations[i].MagicSpeed)))
			end            
        end
    end
end

GameServerFunctions.CharacterSet(ItemCombination.CharacterSet)

return ItemCombination
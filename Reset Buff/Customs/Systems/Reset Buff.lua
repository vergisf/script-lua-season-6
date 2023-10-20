ResetBuff = {}

function ResetBuff.Init()
    if resetBuffSwitch then
        GameServerFunctions.EnterCharacter(ResetBuff.EnterCharacter)
    end
end

function ResetBuff.EnterCharacter(aIndex)
    ResetBuff.CheckReset(aIndex)
end

function ResetBuff.CheckReset(aIndex)
    local player = User.new(aIndex)
    local reset = player:getReset()

    for index in ipairs(resetBuffConfigs) do
        local check = resetBuffConfigs[index]
        if reset >= check.minReset and reset <= check.maxReset then
            ResetBuff.SetBuff(aIndex, check.indexBuff)
            break
        end
    end
end

function ResetBuff.SetBuff(aIndex, indexBuff)
    local player = User.new(aIndex)

    local buff = resetBuffCombination[indexBuff]
    
    if buff ~= nil then
        if buff.DefenseMultiply ~= 0    then
            player:setDefense((math.floor(player:getDefense() * buff.DefenseMultiply)))
            player:setDefensePvP((math.floor(player:getDefensePvP() * buff.DefenseMultiply)))
        end
    
        if buff.DefenseAdd ~= 0    then
            player:setDefense((math.floor(player:getDefense() + buff.DefenseAdd)))
            player:setDefensePvP((math.floor(player:getDefensePvP() + buff.DefenseAdd)))
        end
        
        if buff.BlockSuccessMultiply ~= 0
        then
            player:setSuccessBlock(math.floor(player:getSuccessBlock() * buff.BlockSuccessMultiply))
            player:setSuccessBlockPvP(math.floor(player:getSuccessBlockPvP() * buff.BlockSuccessMultiply))
        end
        
        if buff.BlockSuccessAdd ~= 0
        then
            player:setSuccessBlock(math.floor(player:getSuccessBlock() + buff.BlockSuccessAdd))
            player:setSuccessBlockPvP(math.floor(player:getSuccessBlockPvP() + buff.BlockSuccessAdd))
        end
        
        if buff.LifeAdd ~= 0
        then
            player:setAddLife((math.floor(player:getAddLife() + buff.LifeAdd)))
        end
        
        if buff.ManaAdd ~= 0 
        then
            player:setAddMana((math.floor(player:getAddMana() + buff.ManaAdd)))
        end
        
        if buff.DamageAdd ~= 0 
        then
            player:setAttackDamageMinLeft((math.floor(player:getAttackDamageMinLeft() + buff.DamageAdd)))
            player:setAttackDamageMaxLeft((math.floor(player:getAttackDamageMaxLeft() + buff.DamageAdd)))
            player:setAttackDamageMinRight((math.floor(player:getAttackDamageMinRight() + buff.DamageAdd)))
            player:setAttackDamageMaxRight((math.floor(player:getAttackDamageMaxRight() + buff.DamageAdd)))
        end
        
        if buff.DamageMultiply ~= 0 
        then
            player:setAttackDamageMinLeft((math.floor(player:getAttackDamageMinLeft() * buff.DamageMultiply)))
            player:setAttackDamageMaxLeft((math.floor(player:getAttackDamageMaxLeft() * buff.DamageMultiply)))
            player:setAttackDamageMinRight((math.floor(player:getAttackDamageMinRight() * buff.DamageMultiply)))
            player:setAttackDamageMaxRight((math.floor(player:getAttackDamageMaxRight() * buff.DamageMultiply)))
        end
        
        if buff.MagicDamageAdd ~= 0
        then
            player:setMagicDamageMin((math.floor(player:getMagicDamageMin() + buff.MagicDamageAdd)))
            player:setMagicDamageMax((math.floor(player:getMagicDamageMax() + buff.MagicDamageAdd)))
        end
        
        if buff.MagicDamageMultiply ~= 0
        then
            player:setMagicDamageMin((math.floor(player:getMagicDamageMin() * buff.MagicDamageMultiply)))
            player:setMagicDamageMax((math.floor(player:getMagicDamageMax() * buff.MagicDamageMultiply)))
        end
        
        if buff.AttackSpeedAdd ~= 0
        then
            player:setAttackSpeed((math.floor(player:getAttackSpeed() + buff.AttackSpeedAdd)))
        end
        
        if buff.AttackSpeedMultiply ~= 0
        then
            player:setAttackSpeed((math.floor(player:getAttackSpeed() * buff.AttackSpeedMultiply)))
        end
        
        if buff.MagicSpeedAdd ~= 0
        then
            player:setMagicSpeed((math.floor(player:getMagicSpeed() + buff.MagicSpeedAdd)))
        end
        
        if buff.MagicSpeedMultiply ~= 0
        then
            player:setMagicSpeed((math.floor(player:getMagicSpeed() * buff.MagicSpeedMultiply)))
        end
    end
end

ResetBuff.Init()

return ResetBuff
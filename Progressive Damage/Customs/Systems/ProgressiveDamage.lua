ProgressiveDamage = {}
ProgressiveDamage.Players = {}

function ProgressiveDamage.Init()
    if ProgressiveDamage_Config.Enabled then
        GameServerFunctions.PlayerAttack(ProgressiveDamage.PlayerAttack)
        GameServerFunctions.PlayerDie(ProgressiveDamage.PlayerDie)
        GameServerFunctions.PlayerLogout(ProgressiveDamage.PlayerLogout)
        Timer.Interval(ProgressiveDamage_Config.TimeIncrease, ProgressiveDamage.ApplyDamage)
    end
end

function ProgressiveDamage.PlayerAttack(aIndex, bIndex, skill)
    if ProgressiveDamage.Players[aIndex] == nil then
        ProgressiveDamage.Players[aIndex] = -1
    end

    if ProgressiveDamage.Players[bIndex] == nil then
        ProgressiveDamage.Players[bIndex] = -1
    end

    if  ProgressiveDamage.Players[aIndex] == -1 then
        ProgressiveDamage.Players[aIndex] = Timer.TimeOut(ProgressiveDamage_Config.TimeClear, ProgressiveDamage.ClearPlayerDamage, aIndex)
    else
        Timer.Cancel(ProgressiveDamage.Players[aIndex])
        ProgressiveDamage.Players[aIndex] = Timer.TimeOut(ProgressiveDamage_Config.TimeClear, ProgressiveDamage.ClearPlayerDamage, aIndex)
    end

    if  ProgressiveDamage.Players[aIndex] == -1 then
        ProgressiveDamage.Players[aIndex] = Timer.TimeOut(ProgressiveDamage_Config.TimeClear, ProgressiveDamage.ClearPlayerDamage, aIndex)
    else
        Timer.Cancel(ProgressiveDamage.Players[aIndex])
        ProgressiveDamage.Players[aIndex] = Timer.TimeOut(ProgressiveDamage_Config.TimeClear, ProgressiveDamage.ClearPlayerDamage, aIndex)
    end

    return 0
end

function ProgressiveDamage.PlayerDie(aIndex, bIndex)
    if ProgressiveDamage.Players[aIndex] ~= nil and ProgressiveDamage.Players[aIndex] ~= -1 then
        Timer.Cancel(ProgressiveDamage.Players[aIndex])
        ProgressiveDamage.Players[aIndex] = -1
    end

    if ProgressiveDamage.Players[bIndex] ~= nil and ProgressiveDamage.Players[bIndex] ~= -1 then
        Timer.Cancel(ProgressiveDamage.Players[bIndex])
        ProgressiveDamage.Players[bIndex] = -1
    end

    CalCharacter(aIndex)
end

function ProgressiveDamage.PlayerLogout(aIndex)
    ProgressiveDamage.Players[aIndex] = -1
end

function ProgressiveDamage.ClearPlayerDamage(aIndex)
    CalCharacter(aIndex)
    ProgressiveDamage.Players[aIndex] = -1
end

function ProgressiveDamage.ApplyDamage()
    for aIndex = 13000, 13999 do
        local player = User.new(aIndex)
        if player:getConnected() == 3 then
            if ProgressiveDamage.Players[aIndex] ~= nil and ProgressiveDamage.Players[aIndex] ~= -1 then					
                player:setAttackDamageMinLeft((math.floor(player:getAttackDamageMinLeft() * ProgressiveDamage_Config.DamageRate)))
				player:setAttackDamageMaxLeft((math.floor(player:getAttackDamageMaxLeft() * ProgressiveDamage_Config.DamageRate)))
				player:setAttackDamageMinRight((math.floor(player:getAttackDamageMinRight() * ProgressiveDamage_Config.DamageRate)))
				player:setAttackDamageMaxRight((math.floor(player:getAttackDamageMaxRight() * ProgressiveDamage_Config.DamageRate)))
				player:setMagicDamageMin((math.floor(player:getMagicDamageMin() * ProgressiveDamage_Config.DamageRate)))				
				player:setMagicDamageMax((math.floor(player:getMagicDamageMax() * ProgressiveDamage_Config.DamageRate)))
            end
        end
    end    
end

ProgressiveDamage.Init()

return ProgressiveDamage
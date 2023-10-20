PvpControl = {}

function PvpControl.Init()
    if PvpControl_Config.Ativado then
        GameServerFunctions.PlayerAttack(PvpControl.PlayerAttack)
    end
end


function PvpControl.PlayerAttack(aIndex, bIndex)
    local pAttack = User.new(aIndex)
    local pTarget= User.new(bIndex)

    if pAttack:getReset() < PvpControl_Config.Resets then
        local map =  pAttack:getMapNumber()
        for i = 1, #PvpControl_Config.Mapas do
            if PvpControl_Config.Mapas[i] == map then
                SendMessage(PvpControl_Config.Message[pAttack:getLanguage()][1], aIndex, 1)
                SendMessage(string.format(PvpControl_Config.Message[pAttack:getLanguage()][2], PvpControl_Config.Resets), aIndex, 1)
                return 1      
            end
        end
    end

    if pTarget:getReset() < PvpControl_Config.Resets then
        local map =  pTarget:getMapNumber()
        for i = 1, #PvpControl_Config.Mapas do
            if PvpControl_Config.Mapas[i] == map then
                SendMessage(string.format(PvpControl_Config.Message[pAttack:getLanguage()][3], pTarget:getName()), aIndex, 1)
                return 1      
            end
        end
    end

    return 0
end

PvpControl.Init()

return PvpControl
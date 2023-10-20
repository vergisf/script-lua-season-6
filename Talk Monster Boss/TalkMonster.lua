TalkMonster = {}

local monsterCreate = {}
local timer = nil

function TalkMonster.Init()
    if TalkMonster_Config.enable then
		Commands.Register(TalkMonster_Config.command, TalkMonster.Command)
        GameServerFunctions.MonsterDie(TalkMonster.MonsterDie)
	end
end

function TalkMonster.Command(aIndex, arguments)

    local monsterId = command:getNumber(arguments, 1)
    local map = command:getNumber(arguments, 2)
    local map_x = command:getNumber(arguments, 3)
    local map_y = command:getNumber(arguments, 4)

    local monsterIndex = AddMonster(map)

    SetMapMonster(monsterIndex, map, map_x, map_y)
	SetMonster(monsterIndex, monsterId)

    table.insert(monsterCreate, monsterIndex, {id = monsterId, index = monsterIndex})

    timer = Timer.Interval(5, TalkMonster.TalkMonster, monsterIndex, aIndex)
end

function TalkMonster.MonsterDie(_, bIndex)
    if monsterCreate[bIndex] ~= nil then 
        table.remove(monsterCreate, bIndex)

        if timer ~= -1 then
            Timer.Cancel(timer)
            timer = -1
        end
    end
end

function TalkMonster.TalkMonster(monsterIndex, aIndex)
    local player = User.new(aIndex)

    local language = player:getLanguage()
    local message = TalkMonster.GetRandomMessage(language)

    ChatTargetSend(monsterIndex, string.format('%s', message))
end

function TalkMonster.GetRandomMessage(language)
    local initSize = 0
    local lastSize = #TalkMonster_Config.maessages[language]

    local rand = math.random(initSize, lastSize)

    return TalkMonster_Config.maessages[language][rand]
end

TalkMonster.Init()

return TalkMonster
BattlePass = {}

function BattlePass.Init()
    if battlePassSwitch then
        GameServerFunctions.EnterCharacter(BattlePass.EnterCharacter)
        GameServerFunctions.QueryAsyncProcess(BattlePass.QueryAsyncProcess)
        Commands.Register(battlePassCommand, BattlePass.CommandBuy)
        Commands.Register(battlePassCommandNPCItens, BattlePass.CommandGoToNPC)
        Commands.Register(battlePassAddXPCommand, BattlePass.AddExpPlayer)
    end
end
 
function BattlePass.AddExpPlayer(aIndex, params)
    local staff = User.new(aIndex)
    local namePlayer = command:getString(params, 1, 0)
    local value = command:getNumber(params, 2)
    local aIndexPlayer = GetIndex(namePlayer)

    local messages = battlePassMessages[staff:getLanguage()]

    if aIndexPlayer == -1 then
        SendMessage(string.format(messages[4], namePlayer), aIndex, 1)
        return
    end

    UtilsBattlePass.AddExpPlayer(aIndexPlayer, value)

    local player = User.new(aIndexPlayer)

    LogAddC(2, string.format(messages[10], player:getName(), value, staff:getName()))
end

function BattlePass.CommandBuy(aIndex, _)
    local player = User.new(aIndex)
    local language = player:getLanguage()
    local login = player:getAccountID()
    local name = player:getName()
    local messages = battlePassMessages[language]

    if BattlePass.CheckIsPremium(login) then
        return
    end

    local coin = DataBase.GetValue(battlePassTableCoin, battlePassColumnCoin, battlePassWhereCoin, login)
    local amount = battlePassAmountCoinVip[player:getVip()]

    if amount > coin then
        SendMessage(string.format(messages[5], amount, battlePassNameCoin), aIndex, 1)
        return
    end

    DataBase.SetValue('BattlePass', 'premiumPass', 1, 'memb___id', login)
    DataBase.SetDecreaseValue(battlePassTableCoin, battlePassColumnCoin, amount, battlePassWhereCoin, login)

    SendMessage(string.format(messages[1], name), aIndex, 1)
    SendMessage(string.format(messages[2]), aIndex, 1)
    SendMessage(string.format(messages[3]), aIndex, 1)

    UtilsBattlePass.MakeItemByLevelWithPremium(aIndex)

    UtilsBattlePass.EnterCharacter(aIndex, false)
end

function BattlePass.CommandGoToNPC(aIndex)
    Teleport(aIndex, coordinatorNPCPass.map, coordinatorNPCPass.x, coordinatorNPCPass.y)
end

function BattlePass.EnterCharacter(aIndex)
    local player = User.new(aIndex)

    local battlePass = DataBase.GetString('BattlePass', 'memb___id', 'memb___id', player:getAccountID())

    if battlePass ~= player:getAccountID() then
        BattlePass.FirstInsertUser(player:getAccountID(), 1, 0, 0, 0, 0)
    end
end

function BattlePass.FirstInsertUser(user, isFree, isPremium, levelFree, levelPremium, endPass)
    local query = string.format("INSERT INTO [dbo].[BattlePass] ([memb___id],[freePass],[premiumPass],[levelFree],[levelPremium],[endPass],[dateEndPadd]) VALUES ('%s',%d,%d,%d,%d,%d,GETDATE())", user, isFree, isPremium, levelFree, levelPremium, endPass)

	CreateAsyncQuery('BattlePassSystemInit', query, -1, 0)
end

function BattlePass.QueryAsyncProcess(queryName, identification, _)
	if queryName == 'BattlePassSystemInit'	then
		QueryAsyncDelete(identification)
		return 1
	end

	return 0
end

function BattlePass.CheckIsPremium(login)
    local isPremium = DataBase.GetValue('BattlePass', 'premiumPass', 'memb___id', login)

    if isPremium == nil then
        return false
    end

    if isPremium == 1 then
        return true
    end

    return false
end

BattlePass.Init()

return BattlePass
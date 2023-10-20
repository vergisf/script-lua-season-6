RankingRewardUtils = {}

local SQL_NO_DATA_RANKING = 'We could not find'

function RankingRewardUtils.CheckPlayerExist(name)
    --local loginPlayer = DataBase.GetString(Table, Column, Where, Name)
    local loginPlayer = DataBase.GetString('Character', 'AccountID', 'name', name)

    if loginPlayer == SQL_NO_DATA_RANKING then
        return nil
    end

    return loginPlayer
end

function RankingRewardUtils.CheckExistRegister(name, ranking)
    local query = string.format("SELECT name FROM RankingReward WHERE name = '%s' AND rankingNumber = %d", name, ranking)
    
    ret = db:exec(query)

	if ret == 0	then
		db:clear()
		return false
	end

    nRet = db:fetch()
	if nRet == SQL_NO_DATA then
		db:clear()
		return false
	end

	db:clear()

    return true
end

function RankingRewardUtils.CheckRankingFilled(position, ranking)
    local query = string.format("SELECT name FROM RankingReward WHERE rankingPosition = %d AND rankingNumber = %d", position, ranking)
    
    ret = db:exec(query)

	if ret == 0	then
		db:clear()
		return false
	end

    nRet = db:fetch()
	if nRet == SQL_NO_DATA then
		db:clear()
		return false
	end

	db:clear()

    return true
end

function RankingRewardUtils.CheckCountRanking()
    local query = 'SELECT COUNT(*) AS Total FROM RankingReward'
    ret = db:exec(query)

	if ret == 0	then
		db:clear()
		return nil
	end

    nRet = db:fetch()
	if nRet == SQL_NO_DATA then
		db:clear()
		return nil
	end

    local val = db:getInt('Total')
	db:clear()
    return val
end

function RankingRewardUtils.RegisterPlayer(name, position, ranking, login)
    local query = string.format("IF NOT EXISTS (SELECT name, rankingNumber FROM RankingReward WHERE name = '%s' AND rankingNumber = %d) INSERT INTO RankingReward (memb___id, name, rankingNumber, rankingPosition) VALUES ('%s', '%s', %d, %d)",
    name, ranking, login, name, ranking, position)
    db:exec(query)
	db:clear()
end

function RankingRewardUtils.ClearRanking()
    local query = string.format("TRUNCATE TABLE RankingReward")
    db:exec(query)
	db:clear()
end

function RankingRewardUtils.UpdateBase(name, ranking, position)
	local Query = string.format("UPDATE RankingReward SET withdrawn = 1 WHERE name = '%s' AND rankingPosition = %d AND rankingNumber = %d", name, position, ranking)

	ret = db:exec(Query)
	
	if ret == 0
	then
		LogAddC(2,string.format("Não foi possível executar a query: %s", Query))
		db:clear()
		return
	end
	
	db:clear()
end


return RankingRewardUtils
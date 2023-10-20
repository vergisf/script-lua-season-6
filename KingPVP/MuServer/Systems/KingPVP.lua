KingPVP = {}

local packetName = "KING_PVP_%s"
local packetNumber = 0x34
local timer = -1

local infosKingPVP = {
    nome = nil,
    level = nil,
    agilidade = nil,
    energia = nil,
    vida = nil,
    forca = nil,
    comando = nil,
    masterReset = nil,
    reset = nil,
}

function KingPVP.Init()
    if kingSwitch then
        GameServerFunctions.EnterCharacter(KingPVP.EnterCharacter)

        Timer.TimeOut(15, KingPVP.GetDetailsKing)
    end
end

function KingPVP.EnterCharacter(aIndex)
    local player = User.new(aIndex)
    local name = player:getName()

    KingPVP.CheckPlayerOnline()

    local pname = string.format(packetName, name)
    local sizeName = string.len(infosKingPVP.nome)

    CreatePacket(pname, packetNumber)

    SetBytePacket(pname, sizeName)
    SetCharPacketLength(pname, infosKingPVP.nome, sizeName)
    SetDwordPacket(pname, infosKingPVP.level)
    SetDwordPacket(pname, infosKingPVP.agilidade)
    SetDwordPacket(pname, infosKingPVP.energia)
    SetDwordPacket(pname, infosKingPVP.vida)
    SetDwordPacket(pname, infosKingPVP.forca)
    SetDwordPacket(pname, infosKingPVP.comando)
    SetDwordPacket(pname, infosKingPVP.masterReset)
    SetDwordPacket(pname, infosKingPVP.reset)

    SendPacket(pname, aIndex)

    ClearPacket(pname)
end

function KingPVP.CheckPlayerOnline()
    if infosKingPVP.nome ~= nil then 
        local indexPlayer = GetIndex(infosKingPVP.nome)
        if indexPlayer ~= -1 then
            local player = User.new(indexPlayer)
            infosKingPVP.level = player:getLevel()
            infosKingPVP.agilidade = player:getDexterity()
            infosKingPVP.energia = player:getEnergy()
            infosKingPVP.vida = player:getVitality()
            infosKingPVP.forca = player:getStrength()
            infosKingPVP.comando = player:getLeaderShip()
            infosKingPVP.masterReset = player:getMasterReset()
            infosKingPVP.reset = player:getReset()
        end
    end
end

function KingPVP.GetDetailsKing()
	
    infosKingPVP.nome = DataBase.GetString(kingPVPDataBase.table, "Name", kingPVPDataBase.where, 1)

    local query = "SELECT cLevel, Dexterity, Energy, Vitality, Strength, Leadership, MResets, Resets FROM Character WHERE ReiDoPVP = 1"
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

    infosKingPVP.level = db:getInt("cLevel")
    infosKingPVP.agilidade = db:getInt("Dexterity")
    infosKingPVP.energia = db:getInt("Energy")
    infosKingPVP.vida = db:getInt("Vitality")
    infosKingPVP.forca = db:getInt("Strength")
    infosKingPVP.comando = db:getInt("Leadership")
    infosKingPVP.masterReset = db:getInt("MResets")
    infosKingPVP.reset = db:getInt("Resets")

	db:clear()

	LogAdd("Executo tudo")
end

KingPVP.Init()

return KingPVP
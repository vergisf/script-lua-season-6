Auction = {}
Auction.CurrentAuction = {}
Auction.Started = 0
Auction.AcceptBid = false
Auction.Closing = false
Auction.TimerRunning = -1
Auction.TimerCountDown = -1
Auction.CountDown = 0

function Auction.Init()
    if Auction_Config.Enabled then
        GameServerFunctions.GameServerProtocol(Auction.Protocol)
        GameServerFunctions.QueryAsyncProcess(Auction.QueryAsync)
        GameServerFunctions.EnterCharacter(Auction.EnterCharacter)
        Commands.Register(Auction_Config.Commands.Open, Auction.CommandOpen)
        Commands.Register(Auction_Config.Commands.Close, Auction.CommandClose)
        Commands.Register(Auction_Config.Commands.Cancel, Auction.CommandCancel)
        Timer.TimeOut(3, Auction.ResumeAuction)
    end

end

function Auction.EnterCharacter(aIndex)
    if Auction.Started == 0 then
        local packetName = "AuctionEnd"
        CreatePacket(packetName, Auction_Config.Packet)
        SendPacket(packetName, aIndex)
        ClearPacket(packetName)
    end
end

function Auction.Protocol(aIndex, Packet, PacketName)
    if Packet ~= Auction_Config.Packet then return false end

    local player = User.new(aIndex)
    local playerInfo = Utils.GetPlayerInfo(player)

    if PacketName == string.format("1-%s-%d", playerInfo[1], aIndex) then
        local lance = GetDwordPacket(PacketName, -1)
        ClearPacket(PacketName)
        Auction.Bid(playerInfo, lance)
        return true
    end
end

function Auction.CommandOpen(aIndex, Arguments)
    local player = User.new(aIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
    if CheckGameMasterLevel(playerInfo[0], playerInfo[1], Auction_Config.GMLevel) == 0 then
        return
    end

    if Auction.Started == 1 then
        SendMessage(Auction_Config.Message[playerInfo[3]][12], aIndex, 1)
        return
    end

    local leilaoid = command:getNumber(Arguments, 1)

    if Auction_Config.Leilao[leilaoid] == nil then
        SendMessage(Auction_Config.Message[playerInfo[3]][13], aIndex, 1)
        return
    end

    Auction.CurrentAuction = {Index = leilaoid, Nome = Auction_Config.Leilao[leilaoid].Nome, Item = Auction_Config.Leilao[leilaoid].Item, Lance = Auction_Config.Leilao[leilaoid].Lance, Moeda = Auction_Config.Leilao[leilaoid].Moeda, Player = {Info = {[0] = "", [1] = ""}, Valor = 0}, ConsomeNoLance = Auction_Config.Leilao[leilaoid].ConsomeNoLance}
    Auction.Started = 1
    Auction.AcceptBid = true

    local query = string.format("if not exists(Select id from AuctionRunning)  begin INSERT INTO AuctionRunning (ServerId, Id, Valor, AccountID, Nick) values (%d, %d, %d, '%s', '%s') end", Auction_Config.ServerId, Auction.CurrentAuction.Index, Auction.CurrentAuction.Player.Valor, Auction.CurrentAuction.Player.Info[0], Auction.CurrentAuction.Player.Info[1])
    CreateAsyncQuery('CreateAuction', query, -1, 0)

    Auction.TimerRunning = Timer.Interval(1, Auction.Running)

    SendMessageGlobal(string.format("[%s]", playerInfo[1]), 0)
    Message.SendMessageGlobalMultLang(Auction_Config.Message, 5, 0)
    Message.SendMessageGlobalMultLangArgs(Auction_Config.Message, 10, 0, Auction.CurrentAuction.Nome)
    Message.SendMessageGlobalMultLang(Auction_Config.Message, 11, 0)
    Message.SendMessageGlobalMultLangArgs(Auction_Config.Message, 7, 0, Auction.CurrentAuction.Lance, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Nome)
    Message.SendMessageGlobalMultLang(Auction_Config.Message, 8, 0)
end

function Auction.CommandClose(aIndex)
    local player = User.new(aIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
    if CheckGameMasterLevel(playerInfo[0], playerInfo[1], Auction_Config.GMLevel) == 0 then
        return
    end

    if Auction.Started == 0 then
        SendMessage(Auction_Config.Message[playerInfo[3]][1], aIndex, 1)
        return
    end

    if Auction.Closing then
        return
    end

    Auction.CountDown = Auction_Config.CountDown
    Auction.Closing = true
    Auction.TimerCountDown = Timer.Repeater(1, Auction.CountDown, Auction.ShowCountDown)
end

function Auction.ShowCountDown()
    if Auction.CountDown <= 0 then
        Auction.TimerCountDown = -1
        if Auction.Started == 0 then
            Auction.Clear()
            return
        end

        Message.SendMessageGlobalMultLang(Auction_Config.Message, 5, 0)
        Message.SendMessageGlobalMultLang(Auction_Config.Message, 18, 0)
        Message.SendMessageGlobalMultLang(Auction_Config.Message, 19, 0)
        Message.SendMessageGlobalMultLangArgs(Auction_Config.Message, 10, 0, Auction.CurrentAuction.Player.Info[1])
        Message.SendMessageGlobalMultLangArgs(Auction_Config.Message, 7, 0, Auction.CurrentAuction.Player.Valor, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Nome)
        Message.SendMessageGlobalMultLang(Auction_Config.Message, 8, 0)
        Auction.Finalizar()
    else   
        Message.SendMessageGlobalMultLang(Auction_Config.Message, 5, 0)
        SendMessageGlobal("", 0)
        Message.SendMessageGlobalMultLangArgs(Auction_Config.Message, 16, 0, Auction.CountDown)
        Message.SendMessageGlobalMultLang(Auction_Config.Message, 17, 0)
        SendMessageGlobal("", 0)
        Message.SendMessageGlobalMultLang(Auction_Config.Message, 8, 0)
        Auction.CountDown = Auction.CountDown-1
    end
end

function Auction.CommandCancel(aIndex)
    local player = User.new(aIndex)
    local playerInfo = Utils.GetPlayerInfo(player)
    if CheckGameMasterLevel(playerInfo[0], playerInfo[1], Auction_Config.GMLevel) == 0 then
        return
    end

    if Auction.Started == 0 then
        SendMessage(Auction_Config.Message[playerInfo[3]][1], aIndex, 1)
        return
    end

    if  Auction.CurrentAuction.Player.Info[0] ~= "" then
        DataBase.SetAddValue(Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Tabela, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Coluna, Auction.CurrentAuction.Player.Valor, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Where, Auction.CurrentAuction.Player.Info[Auction_Config.Moeda[Auction.CurrentAuction.Moeda].IdType])
    end

    Auction.Clear()
    SendMessage(Auction_Config.Message[playerInfo[3]][15], aIndex, 1)

    SendMessageGlobal(string.format("[%s]", playerInfo[1]), 0)
    Message.SendMessageGlobalMultLang(Auction_Config.Message, 5, 0)
    SendMessageGlobal("", 0)
    Message.SendMessageGlobalMultLang(Auction_Config.Message, 14, 0)
    SendMessageGlobal("", 0)
    Message.SendMessageGlobalMultLang(Auction_Config.Message, 8, 0)
end

function Auction.Clear()
    Auction.Started = 0
    Auction.AcceptBid = false
    Auction.Closing = false
    Auction.Running()
    Auction.CurrentAuction = {}
    if Auction.TimerCountDown ~= -1 then
        Timer.Cancel(Auction.TimerCountDown)
        Auction.TimerCountDown = -1
    end
    CreateAsyncQuery('DeleteAuction', "TRUNCATE TABLE AuctionRunning", -1, 0)
end

function Auction.ResumeAuction()
    local query = string.format("if not exists(SELECT Id from AuctionRunning) begin SELECT Id = -1, Valor = 0, AccountID = '', Nick = '' end else begin SELECT ServerId, Id, Valor, AccountID, Nick from AuctionRunning end")
    CreateAsyncQuery('ResumeAuction', query, -1, 1)
end

function Auction.Running()
    local packetName = "AuctionUpdate"
    CreatePacket(packetName, Auction_Config.Packet)
    SetBytePacket(packetName, Auction.Started)
    local len = Auction.CurrentAuction.Nome:len()
    SetBytePacket(packetName, len)
    SetCharPacketLength(packetName, Auction.CurrentAuction.Nome, len)
    SetBytePacket(packetName, Auction.CurrentAuction.Moeda)
    SetWordPacket(packetName, Auction.CurrentAuction.Item.Index)
    SetBytePacket(packetName, Auction.CurrentAuction.Item.Level)
    SetBytePacket(packetName, Auction.CurrentAuction.Item.Skill)
    SetBytePacket(packetName, Auction.CurrentAuction.Item.Luck)
    SetBytePacket(packetName, Auction.CurrentAuction.Item.JoL)
    SetBytePacket(packetName, Auction.CurrentAuction.Item.Exc)
    SetWordPacket(packetName, Auction.CurrentAuction.Item.X)
    SetWordPacket(packetName, Auction.CurrentAuction.Item.Y)
    SetWordPacket(packetName, Auction.CurrentAuction.Item.W)
    SetWordPacket(packetName, Auction.CurrentAuction.Item.H)
    SetDwordPacket(packetName, Auction.CurrentAuction.Lance)
    SetDwordPacket(packetName, Auction.CurrentAuction.Player.Valor)
    len = Auction.CurrentAuction.Player.Info[1]:len()
    SetBytePacket(packetName, len)
    SetCharPacketLength(packetName, Auction.CurrentAuction.Player.Info[1], len)

    for i = OBJECT_START_USER, MAX_OBJECT do
		if gObjIsConnectedGP(i) ~= 0 then		
            SendPacket(packetName, i)
		end
	end
    ClearPacket(packetName)

    if Auction.Started == 0 then
        if Auction.TimerRunning ~= -1 then
            Timer.Cancel(Auction.TimerRunning)
            Auction.TimerRunning = -1
        end
    end
end

function Auction.Bid(playerInfo, lance)
    if Auction.Started == 0 then
        SendMessage(Auction_Config.Message[playerInfo[3]][1], playerInfo[2], 1)
        return
    end

    if not Auction.AcceptBid then
        SendMessage(Auction_Config.Message[playerInfo[3]][20], playerInfo[2], 1)
        return
    end

    if Auction.CurrentAuction.Player.Info[1] == playerInfo[1] then
        SendMessage(Auction_Config.Message[playerInfo[3]][2], playerInfo[2], 1)
        return
    end
	
    if lance <= Auction.CurrentAuction.Player.Valor then
        SendMessage(Auction_Config.Message[playerInfo[3]][3], playerInfo[2], 1)
        return
    end

    local saldo = DataBase.GetValue(Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Tabela, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Coluna, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Where, playerInfo[Auction_Config.Moeda[Auction.CurrentAuction.Moeda].IdType])

    if saldo < lance then
        SendMessage(Auction_Config.Message[playerInfo[3]][4], playerInfo[2], 1)
        return
    end

    if not Auction.CurrentAuction.ConsomeNoLance then
        DataBase.SetAddValue(Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Tabela, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Coluna, Auction.CurrentAuction.Player.Valor, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Where, Auction.CurrentAuction.Player.Info[Auction_Config.Moeda[Auction.CurrentAuction.Moeda].IdType])
    end

    Auction.CurrentAuction.Player.Info[0] = playerInfo[0]
    Auction.CurrentAuction.Player.Info[1] = playerInfo[1]
    Auction.CurrentAuction.Player.Valor = lance

    DataBase.SetDecreaseValue(Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Tabela, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Coluna, Auction.CurrentAuction.Player.Valor, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Where, Auction.CurrentAuction.Player.Info[Auction_Config.Moeda[Auction.CurrentAuction.Moeda].IdType])

    SendMessage(Auction_Config.Message[playerInfo[3]][9], playerInfo[2], 1)

    Message.SendMessageGlobalMultLang(Auction_Config.Message, 5, 0)
    SendMessageGlobal("", 0)
    Message.SendMessageGlobalMultLangArgs(Auction_Config.Message, 6, 0, playerInfo[1])
    Message.SendMessageGlobalMultLangArgs(Auction_Config.Message, 7, 0, lance, Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Nome)
    SendMessageGlobal("", 0)
    Message.SendMessageGlobalMultLang(Auction_Config.Message, 8, 0)

    Auction.Running()
    Auction.UpdateInfo()
    if Auction.Closing then
        if Auction.TimerCountDown ~= -1 then
            Timer.Cancel(Auction.TimerCountDown)
            Auction.TimerCountDown = -1
        end
        Auction.CountDown = Auction_Config.CountDown
        Auction.TimerCountDown = Timer.Repeater(1, Auction.CountDown, Auction.ShowCountDown)
    end
end

function Auction.UpdateInfo()
    local query = string.format("UPDATE AuctionRunning set Id = %d, Valor = %d, AccountID = '%s', Nick = '%s'", Auction.CurrentAuction.Index, Auction.CurrentAuction.Player.Valor, Auction.CurrentAuction.Player.Info[0], Auction.CurrentAuction.Player.Info[1])
    CreateAsyncQuery('UpdateAuction', query, -1, 0)
end

function Auction.QueryAsync(queryName, identification, aIndex)
    if queryName ~= "ResumeAuction" then
        return 0
    end

    local serverid = tonumber(QueryAsyncGetValue(identification, 'ServerId'))
    local leilaoid = tonumber(QueryAsyncGetValue(identification, 'Id'))
    local valor = tonumber(QueryAsyncGetValue(identification, 'Valor'))
    local accountid = QueryAsyncGetValue(identification, 'AccountID')
    local nick = QueryAsyncGetValue(identification, 'Nick')
	
    QueryAsyncDelete(identification)

    if leilaoid == -1 then
        return 1
    end

    if serverid ~= Auction_Config.ServerId then
        return 1
    end

    Auction.CurrentAuction = {Index = leilaoid, Nome = Auction_Config.Leilao[leilaoid].Nome, Item = Auction_Config.Leilao[leilaoid].Item, Lance = Auction_Config.Leilao[leilaoid].Lance, Moeda = Auction_Config.Leilao[leilaoid].Moeda, Player = {Info = {[0] = accountid, [1] = nick}, Valor = valor}}
    Auction.Started = 1
    Auction.AcceptBid = true
    Auction.TimerRunning = Timer.Interval(1, Auction.Running)
    return 1
end

function Auction.Finalizar()
    local query = string.format("INSERT INTO Auctions (AccountID, Nick, Nome, Valor, Moeda, Dia) values ('%s', '%s', '%s', %d, '%s', GETDATE())", Auction.CurrentAuction.Player.Info[0], Auction.CurrentAuction.Player.Info[1], Auction.CurrentAuction.Nome, Auction.CurrentAuction.Player.Valor ,Auction_Config.Moeda[Auction.CurrentAuction.Moeda].Nome)
    CreateAsyncQuery('InsertAuctionHistory', query, -1, 0)

    for i in ipairs(Auction_Config.Premio[Auction.CurrentAuction.Index]) do
        local item = Auction_Config.Premio[Auction.CurrentAuction.Index][i]
		NpcRescueItem.InsertItem(Auction.CurrentAuction.Player.Info[0], item.Index, item.Level, item.Skill, item.Luck, item.Opt, item.Excelente, 0, 0, 255, 255, 255, 255, 255, 255, 60, item.Tempo*86400)
    end
    Auction.Clear()
end

Auction.Init()

return Auction
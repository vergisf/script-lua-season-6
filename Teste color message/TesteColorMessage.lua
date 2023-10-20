TesteColorMessage = {}

function TesteColorMessage.Init()
    Commands.Register('/messaget', TesteColorMessage.Message)
end

function TesteColorMessage.Message(aIndex, arguments)
    local color = command:getNumber(arguments, 1)
    
    SendMessage(string.format('Teste de mensagem com a cor %d', color), aIndex, color)
    SendMessage('TESTE COM FONTE MAIUSCULA', aIndex, color)
end

TesteColorMessage.Init()

return TesteColorMessage

-- true ativa o sistema, false desativa
LimparInventario_Ativado = true

-- Numero do packet usado no sistema
LimparInventario_Packet = 0x32

-- Gerar log com os itens que foram removidos, true sim, false n�o
LimparInventario_Log = true

-- Caso tenha o script de Central de seguran�a deixe true, se nao tiver deixe false
LimparInventario_Central = true

-- true, exige que a central de seguran�a esteja ativada na conta, se nao estiver, n�o deixa usar o comando
-- false, se a central nao estiver ativada ele permite usar o comando
LimparInventario_CentralAtivada = true

-- true exige que a central esteja liberada (computador confiavel) para usar, false ignora a central
LimparInventario_CentralLiberada = true

-- Bloqueia o uso da fun��o pelo vip, true pode usar, false n�o pode
LimparInventario_Vip = {}
LimparInventario_Vip[0] = true
LimparInventario_Vip[1] = true
LimparInventario_Vip[2] = true

-- Mensagens ao player
LimparInventario_Textos = {}
LimparInventario_Textos["Eng"] = {
[1] = " Fun��o n�o dispon�vel no seu plano vip",
[2] = " � necess�rio ter a Central de Seguran�a habilitada para usar essa fun��o",
[3] = " Central de Seguran�a: Computador n�o registrado",
[4] = " Invent�rio limpo com sucesso",
}
LimparInventario_Textos["Por"] = {
[1] = " Fun��o n�o dispon�vel no seu plano vip",
[2] = " � necess�rio ter a Central de Seguran�a habilitada para usar essa fun��o",
[3] = " Central de Seguran�a: Computador n�o registrado",
[4] = " Invent�rio limpo com sucesso",
}
LimparInventario_Textos["Spn"] = {
[1] = " Fun��o n�o dispon�vel no seu plano vip",
[2] = " � necess�rio ter a Central de Seguran�a habilitada para usar essa fun��o",
[3] = " Central de Seguran�a: Computador n�o registrado",
[4] = " Invent�rio limpo com sucesso",
}
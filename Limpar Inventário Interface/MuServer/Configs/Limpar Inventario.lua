
-- true ativa o sistema, false desativa
LimparInventario_Ativado = true

-- Numero do packet usado no sistema
LimparInventario_Packet = 0x32

-- Gerar log com os itens que foram removidos, true sim, false não
LimparInventario_Log = true

-- Caso tenha o script de Central de segurança deixe true, se nao tiver deixe false
LimparInventario_Central = true

-- true, exige que a central de segurança esteja ativada na conta, se nao estiver, não deixa usar o comando
-- false, se a central nao estiver ativada ele permite usar o comando
LimparInventario_CentralAtivada = true

-- true exige que a central esteja liberada (computador confiavel) para usar, false ignora a central
LimparInventario_CentralLiberada = true

-- Bloqueia o uso da função pelo vip, true pode usar, false não pode
LimparInventario_Vip = {}
LimparInventario_Vip[0] = true
LimparInventario_Vip[1] = true
LimparInventario_Vip[2] = true

-- Mensagens ao player
LimparInventario_Textos = {}
LimparInventario_Textos["Eng"] = {
[1] = " Função não disponível no seu plano vip",
[2] = " É necessário ter a Central de Segurança habilitada para usar essa função",
[3] = " Central de Segurança: Computador não registrado",
[4] = " Inventário limpo com sucesso",
}
LimparInventario_Textos["Por"] = {
[1] = " Função não disponível no seu plano vip",
[2] = " É necessário ter a Central de Segurança habilitada para usar essa função",
[3] = " Central de Segurança: Computador não registrado",
[4] = " Inventário limpo com sucesso",
}
LimparInventario_Textos["Spn"] = {
[1] = " Função não disponível no seu plano vip",
[2] = " É necessário ter a Central de Segurança habilitada para usar essa função",
[3] = " Central de Segurança: Computador não registrado",
[4] = " Inventário limpo com sucesso",
}
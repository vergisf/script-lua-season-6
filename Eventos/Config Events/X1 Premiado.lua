
-- true ativa o evento, false desativa
X1Premiado_Ativado = false

-- Agenda do evento automático
X1Premiado_Agenda = {
{DiaDoMes = -1, DiaDaSemana = -1, Hora = 14, Minuto = 25},
}

--Comando para abrir o evento
X1Premiado_ComandoAbrir = "/abrirx1"

--Comando para cancelar o evento
X1Premiado_ComandoCancelar = "/cancelarx1"

--Comando para ir ao evento
X1Premiado_ComandoIr = "/x1premiado"

--Tempo para ficar o comando de ir aberto no evento automatico
X1Premiado_TempoAberto = 15

--Local do evento
X1Premiado_Mapa = 1
X1Premiado_Area = {X1 = 145, Y1 = 196, X2 = 149, Y2 = 199}
X1Premiado_GmSpot = {X = 147, Y = 196}
X1Premiado_Player1Spot = {X = 146, Y = 198}
X1Premiado_Player2Spot = {X = 148, Y = 198}

-- true permite a classe ir ao evento, false nao permite
-- 0 SM, 1 BK, 2 ELF, 3 MG, 4 DL
X1Premiado_ClassesPermitidas = {}
X1Premiado_ClassesPermitidas[0] = false
X1Premiado_ClassesPermitidas[1] = true
X1Premiado_ClassesPermitidas[2] = false
X1Premiado_ClassesPermitidas[3] = false
X1Premiado_ClassesPermitidas[4] = true

-- Premiação do evento
X1Premiado_Premio = {Nome = "Cash", Valor = 100, Tabela = "MEMB_INFO", Coluna = "zcash", Where = "memb___id", Tipo = 0}
X1Premiado_Pontos = {Valor = 1, Tabela = "Character", Coluna = "resets", Where = "Name", Tipo = 1}
X1Premiado_Pontos2 = {Valor = 1, Tabela = "Character", Coluna = "resets", Where = "Name", Tipo = 1}

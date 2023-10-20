--Função de Ativar ou Desativar o Evento Automatico
BattleRoyale_SWITCH = 0 -- 1 ATIVADO // 0 DESATIVADO


--Day -> Só vai rodar no dia que você selecionar
-->Day of Week -> Dia da semana que vai rodar numero dos dias: (0 Domingo), (1 Segunda), (2 Terça), (3 Quarta), (4 Quinta), (5 Sexta), (6 Sábado)
--Caso todos os 2 Day e DayOfWeek esteja -1, então vai valer apenas a Hour e Minute.
EVENT_BattleRoyale = { 
{_Day = -1, _DayOfWeek = -1, _Hour = 14, _Minute = 35},
}

--Comando de Abrir e de Ir Ao Evento
BattleRoyale_COMANDO_ABRIR = "/abrirbattle"
BattleRoyale_COMANDO_IR = "/battle"

-- O evento acontece em stadium, porém, pode ser usado outro mapa, basta configurar abaixo
-- a safearea deve obrigatoriamente ser uma extensão na parte de cima da area de pvp, do mesmo jeito que stadium
BattleRoyale_MapNumber = 6
BattleRoyale_PvpArea = {X1 = 55, Y1 = 142, X2 = 69, Y2 = 159}
BattleRoyale_SafeArea = {X1 = 55, Y1 = 161, X2 = 69, Y2 = 177}
BattleRoyale_SafeCentro = {X = 63, Y = 168}
BattleRoyale_PvpCentro = {X = 63, Y = 150}

-- Classes permitidas a aprticipar do evento
-- 0 SM, 1 BK, 2 ELF, 3 MG, 4 DL
BattleRoyale_Classepermitida = {}
BattleRoyale_Classepermitida[0] = false
BattleRoyale_Classepermitida[1] = true
BattleRoyale_Classepermitida[2] = false
BattleRoyale_Classepermitida[3] = false
BattleRoyale_Classepermitida[4] = true

-- Level minimo para entrar no evento
BattleRoyale_LevelMinimo = 100

-- true Remover os pontos de status do char, false deixa como esta
BattleRoyale_ResetStats = true
-- Quantidade de pontos que recebera para distribuir
BattleRoyale_Points = 40000

--Contagem Regressiva de Abertura do evento
BattleRoyale_TIMER_OPEN = 15 -- Tempo em Segundos !

BattleRoyale_Premio = {Nome = "Cash", Valor = 100, Tabela = "MEMB_INFO", Coluna = "zcash", Where = "memb___id", Tipo = 0}
BattleRoyale_Pontos = {Valor = 1, Tabela = "Character", Coluna = "resets", Where = "Name", Tipo = 1}
BattleRoyale_Pontos2 = {Valor = 1, Tabela = "Character", Coluna = "resets", Where = "Name", Tipo = 1}

-- configurar lista de drops
EVENT_DROP_ITEM_BATTLE = {
{Section = 0, ID = 0, DropCount = 5},
{Section = 0, ID = 12, DropCount = 5},
{Section = 0, ID = 11, DropCount = 5},
{Section = 0, ID = 8, DropCount = 5},
{Section = 0, ID = 19, DropCount = 5},
{Section = 2, ID = 4, DropCount = 5},
{Section = 2, ID = 12, DropCount = 5},
{Section = 6, ID = 5, DropCount = 5},
{Section = 6, ID = 12, DropCount = 5},
{Section = 6, ID = 13, DropCount = 5},
{Section = 6, ID = 8, DropCount = 5},
{Section = 7, ID = 0, DropCount = 5},
{Section = 8, ID = 0, DropCount = 5},
{Section = 9, ID = 0, DropCount = 5},
{Section = 10, ID = 0, DropCount = 5},
{Section = 11, ID = 0, DropCount = 5},
{Section = 7, ID = 1, DropCount = 5},
{Section = 8, ID = 1, DropCount = 5},
{Section = 9, ID = 1, DropCount = 5},
{Section = 10, ID = 1, DropCount = 5},
{Section = 11, ID = 1, DropCount = 5},
{Section = 7, ID = 8, DropCount = 5},
{Section = 8, ID = 8, DropCount = 5},
{Section = 9, ID = 8, DropCount = 5},
{Section = 10, ID = 8, DropCount = 5},
{Section = 11, ID = 8, DropCount = 5},
{Section = 7, ID = 9, DropCount = 5},
{Section = 8, ID = 9, DropCount = 5},
{Section = 9, ID = 9, DropCount = 5},
{Section = 10, ID = 9, DropCount = 5},
{Section = 11, ID = 9, DropCount = 5},
{Section = 7, ID = 16, DropCount = 5},
{Section = 8, ID = 16, DropCount = 5},
{Section = 9, ID = 16, DropCount = 5},
{Section = 10, ID = 16, DropCount = 5},
{Section = 11, ID = 16, DropCount = 5},
{Section = 12, ID = 2, DropCount = 15},
}
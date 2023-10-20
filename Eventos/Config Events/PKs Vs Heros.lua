--Day -> Só vai rodar no dia que você selecionar
-->Day of Week -> Dia da semana que vai rodar numero dos dias: (0 Domingo), (1 Segunda), (2 Terça), (3 Quarta), (4 Quinta), (5 Sexta), (6 Sábado)
--Caso todos os 2 Day e DayOfWeek esteja -1, então vai valer apenas a Hour e Minute.
EVENT_PKsVsHeros = { 
{_Day = -1, _DayOfWeek = -1, _Hour = 01, _Minute = 40},
{_Day = -1, _DayOfWeek = -1, _Hour = 07, _Minute = 40},
{_Day = -1, _DayOfWeek = -1, _Hour = 10, _Minute = 40}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 13, _Minute = 40}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 15, _Minute = 45}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 16, _Minute = 01}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 23, _Minute = 48}, 
}


--Função de Ativar ou Desativar o Evento Automatico
PKsVsHeros_SWITCH = 0 -- 1 ATIVADO // 0 DESATIVADO

--Comando de Abrir e de Ir Ao Evento
PKsVsHeros_COMMAND_OPEN = "/abrirpkvshero"
PKsVsHeros_COMMAND_GO = "/pkvshero"


--Contagem Regressiva de Abertura do evento
PKsVsHeros_TIMER_OPEN = 15 -- Tempo em Segundos !

-- premiação do evento
PKsVsHeros_PremioMoeda1 = {Nome = "Cash", Quantidade = 30, Coluna = "Cash"}
PKsVsHeros_PremioMoeda2 = {Nome = "Cash", Quantidade = 20, Coluna = "Cash"}
PKsVsHeros_PremioMoeda3 = {Nome = "Cash", Quantidade = 10, Coluna = "Cash"}
PKsVsHeros_PremioPonto1 = {Quantidade = 3, Coluna = "PKsVsHeros"}
PKsVsHeros_PremioPonto2 = {Quantidade = 2, Coluna = "PKsVsHeros"}
PKsVsHeros_PremioPonto3 = {Quantidade = 1, Coluna = "PKsVsHeros"}

PKsVsHeros_Premio2Ponto1 = {Quantidade = 3, Coluna = "PKsVsHeros"}
PKsVsHeros_Premio2Ponto2 = {Quantidade = 2, Coluna = "PKsVsHeros"}
PKsVsHeros_Premio2Ponto3 = {Quantidade = 1, Coluna = "PKsVsHeros"}


PKsVsHeros_Mapa = 50
PKsVsHeros_AreaEvento = {X1 = 0, Y1 = 0, X2 = 50, Y2 = 50}
PKsVsHeros_MoveGm = {X = 225, Y = 226}
PKsVsHeros_MoveTimeA = {X = 225, Y = 227}
PKsVsHeros_MoveTimeB = {X = 225, Y = 227}
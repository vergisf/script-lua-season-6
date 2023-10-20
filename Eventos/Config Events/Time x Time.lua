--Day -> Só vai rodar no dia que você selecionar
-->Day of Week -> Dia da semana que vai rodar numero dos dias: (0 Domingo), (1 Segunda), (2 Terça), (3 Quarta), (4 Quinta), (5 Sexta), (6 Sábado)
--Caso todos os 2 Day e DayOfWeek esteja -1, então vai valer apenas a Hour e Minute.
EVENT_TimexTime = { 
{_Day = -1, _DayOfWeek = -1, _Hour = 02, _Minute = 07},
{_Day = -1, _DayOfWeek = -1, _Hour = 07, _Minute = 40},
{_Day = -1, _DayOfWeek = -1, _Hour = 10, _Minute = 40}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 13, _Minute = 40}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 16, _Minute = 00}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 16, _Minute = 01}, 
{_Day = -1, _DayOfWeek = -1, _Hour = 00, _Minute = 03}, 
}

--Função de Ativar ou Desativar o Evento Automatico
TimexTime_SWITCH = 0 -- 1 ATIVADO // 0 DESATIVADO

--Contagem Regressiva de Abertura do evento
TimexTime_TIMER_OPEN = 15 -- Tempo em Segundos !

--Comando de Abrir e de Ir Ao Evento
TimexTime_COMMAND_OPEN = "/abrirtimextime"
TimexTime_COMMAND_GO = "/timextime"

-- premiação do evento (para os 
TimexTime_PremioMoeda1 = {Nome = "Cash", Quantidade = 30, Coluna = "Cash"}
TimexTime_PremioMoeda2 = {Nome = "Cash", Quantidade = 20, Coluna = "Cash"}
TimexTime_PremioMoeda3 = {Nome = "Cash", Quantidade = 10, Coluna = "Cash"}

TimexTime_PremioPonto1 = {Quantidade = 3, Coluna = "PKsVsHeros"}
TimexTime_PremioPonto2 = {Quantidade = 2, Coluna = "PKsVsHeros"}
TimexTime_PremioPonto3 = {Quantidade = 1, Coluna = "PKsVsHeros"}

TimexTime_Premio2Ponto1 = {Quantidade = 3, Coluna = "PKsVsHeros"}
TimexTime_Premio2Ponto2 = {Quantidade = 2, Coluna = "PKsVsHeros"}
TimexTime_Premio2Ponto3 = {Quantidade = 1, Coluna = "PKsVsHeros"}

TimexTime_Mapa = 50
TimexTime_AreaEvento = {X1 = 0, Y1 = 0, X2 = 50, Y2 = 50}
TimexTime_MoveGm = {X = 225, Y = 226}
TimexTime_MoveTimeA = {X = 225, Y = 227}
TimexTime_MoveTimeB = {X = 225, Y = 227}
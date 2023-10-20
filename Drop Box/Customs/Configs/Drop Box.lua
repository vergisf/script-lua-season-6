-- true ativa o sistema, false desativa
DropBox_Ativado = true

-- Index de identificação
-- Nome da Box
-- Grupo no item.txt
-- Id no item.txt
-- Level para dropar (-1 qualquer level)
-- Porcentagem - true para usar, false para deixar aleatorio
-- Inventario - true para dropar no inventario, false para dropar no mapa
-- Vip minimo para o player poder dropar a box
DropBox_Config = {
	{Index = 1, Nome = "Box Teste", Grupo = 14, Id = 32, Level = -1, Porcentagem = true, Inventario = true, Vip = 0},
}

-- Index de Identificação
-- Nome do Item
-- Grupo no item.txt
-- Id no item.txt
-- Level Minimo (0 a 15)
-- Level Maximo (0 a 15)
-- Durabilidade Minima (0 a 255)
-- Durabilidade Maxima (0 a 255)
-- Skill - 0 não, 1 sim, -1 aleatório
-- Luck - 0 não, 1 sim, -1 aleatório
-- Option Minima (0 a 7)
-- Option Maxima (0 a 7)
-- Excelente Minimo (0 a 6)
-- Excelente Maximo (0 a 6)
-- Quantidade para dropar - caso coloque 0, será considerado drop troll e avisara que o jogador foi trolado
-- Dias - 0 para item normal, a partir de 1 quantidade de dias do item temporario
-- Porcentagem (0.01 a 100)
-- Anunciar drop no global - true sim, false não
-- Soltar fogos ao dropar - true sim, false não
-- LimiteDeDrop -1 para nao limitar o drop do item, 1 ou mais para limitar a quantidade de vezes que aquele item pode ser dropado pela box
-- Identificação de drops extras - 0 sem drop extra, a partir de 1 a identificação na config abaixo
DropBox_Itens = {
	{Index = 1, Nome = "Item Teste", Grupo = 0, Id = 06, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 255, Skill = -1, Luck = -1, OptMin = 0, OptMax = 7, ExcMin = 6, ExcMax = 6, Ancient = 0, Quantidade = 2, Dias = -1, Porcentagem = 50, AnunciarGlobal = true, Fogos = true, LimiteDeDrop =  -1, Extras =  1},
	{Index = 1, Nome = "Item Teste", Grupo = 0, Id = 20, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 255, Skill = -1, Luck = -1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Ancient = 0, Quantidade = 1, Dias = -1, Porcentagem = 50, AnunciarGlobal = true, Fogos = true, LimiteDeDrop = -1, Extras = -1},
	{Index = 1, Nome = "Kit Anel", Grupo = 13, Id = 5, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 255, Skill = -1, Luck = -1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Ancient = 0, Quantidade = 1, Dias = -1, Porcentagem = 50, AnunciarGlobal = true, Fogos = true, LimiteDeDrop = -1, Extras = 2},
}

-- Index de Identificação configurada em Extras acima
-- Level Minimo (0 a 15)
-- Level Maximo (0 a 15)
-- Durabilidade Minima (0 a 255)
-- Durabilidade Maxima (0 a 255)
-- Skill - 0 não, 1 sim, -1 aleatório
-- Luck - 0 não, 1 sim, -1 aleatório
-- Option Minima (0 a 7)
-- Option Maxima 0 a 7)
-- Excelente Minimo (0 a 6)
-- Excelente Maximo (0 a 6)
-- Quantidade para dropar
-- Dias - 0 para item normal, a partir de 1 quantidade de dias do item temporario
-- Porcentagem (0.01 a 100)
DropBox_Extras = {
	{Index = 1, Grupo = 0, Id = 2, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 15, Skill = -1, Luck = -1, OptMin = 0, OptMax = 7, ExcMin = 0, ExcMax = 6, Ancient = 0, Quantidade = 1, Dias = -1},
	{Index = 1, Grupo = 6, Id = 1, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 15, Skill = -1, Luck = -1, OptMin = 0, OptMax = 7, ExcMin = 0, ExcMax = 6, Ancient = 0, Quantidade = 3, Dias =  3},
	{Index = 1, Grupo = 2, Id = 1, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 15, Skill = -1, Luck = -1, OptMin = 0, OptMax = 7, ExcMin = 0, ExcMax = 6, Ancient = 0, Quantidade = 1, Dias = -1},
	{Index = 2, Grupo = 13, Id = 6, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 15, Skill = -1, Luck = -1, OptMin = 0, OptMax = 7, ExcMin = 0, ExcMax = 6, Ancient = 0, Quantidade = 2, Dias = -1},
}
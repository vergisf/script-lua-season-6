-- true ativa o sistema, false desativa
NovaJoia_Ativado = true

NovaJoia_Packet = 34

-- Mensagem quando tem sucesso na utiliza��o da j�ia (caso queira usar o nome da joia basta colocar %s)
NovaJoia_MensagemSucesso = " A Evolução foi bem-sucedida "

-- Mensagem quando falha na utiliza��o da j�ia (caso queira usar o nome da joia basta colocar %s)
NovaJoia_MensagemFalha = " A Evolução falhou "

-- Mensagem quando a j�ia n�o pode ser usada pelo niveld e vip do player
NovaJoia_MensagemVIp = " Voc� n�o pode usar essa j�ia "

-- Index para identificar no NovaJoia_ItemOriginal
-- Nome da j�ia
-- grupo no item.txt
-- id no item.txt
-- level da joia (-1 qualquer level)
-- Nivel de vip para poder usar a joia (true pode, false nao pode) (0 = free, 1 = vip 1, 2 = vip 2)
-- Taxa de sucesso por vip de 0.01 a 100 (0 = free, 1 = vip 1, 2 = vip 2)
NovaJoia_Config = {
	{Index = 1, Nome = "Jewel Of Evolution", Grupo = 14, Id = 207, Level = -1, Vip = {[0] = true, [1] = true, [2] = true}, Sucesso = {[0] = 10, [1] = 20, [2] = 0}},
	{Index = 2, Nome = "Jewel Of Black", 	 Grupo = 14, Id = 208, Level = -1, Vip = {[0] = true, [1] = true, [2] = true}, Sucesso = {[0] = 10, [1] = 20, [2] = 0}}
}
-- Index do NovaJoia_Config
-- Index para identificar no NovaJoia_ItemNovo
-- grupo do item no item.txt
-- id do item no item.txt
-- level do item (-1 qualquer level)
NovaJoia_ItemOriginal = {
	{Index = 2, ItemNovo = 1, Grupo = 07, Id = 76, Level = -1, Excelente = false, CriarItemNexSeFalhar = false, DeletarSeFalhar = true},
	{Index = 2, ItemNovo = 2, Grupo = 08, Id = 76, Level = -1, Excelente = false, CriarItemNexSeFalhar = false, DeletarSeFalhar = true},
	{Index = 2, ItemNovo = 3, Grupo = 09, Id = 76, Level = -1, Excelente = false, CriarItemNexSeFalhar = false, DeletarSeFalhar = true},
	{Index = 2, ItemNovo = 4, Grupo = 10, Id = 76, Level = -1, Excelente = false, CriarItemNexSeFalhar = false, DeletarSeFalhar = true},
	{Index = 2, ItemNovo = 5, Grupo = 11, Id = 76, Level = -1, Excelente = false, CriarItemNexSeFalhar = false, DeletarSeFalhar = true},
}

NovaJoia_NovoItemSeDeletar = {
	Grupo = 0, Id = 20, LevelMin = 0, LevelMax = 0, DurMin = 0, DurMax = 0, Skill = 0, Luck = 0, OptMin = 0, OptMax = 0, ExcMin = 0, ExcMax = 0, Quantidade = 1, Dias = -1, Extras = true
}

NovaJoia_NovoItemSeDeletarExtras = {
	{ Grupo = 0, Id = 20, LevelMin = 15, LevelMax = 15, DurMin = 255, DurMax = 255, Skill = 1, Luck = 1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Quantidade = 1, Dias = -1}
}

-- ItemNovo do NovaJoia_ItemOriginal
-- Grupo do item no item.txt
-- Id do item no item.txt
-- Level Minimo (0 a 15)
-- Level Maximo (0 a 15)
-- Durabilidade Minima (0 a 255)
-- Durabilidade Maxima (0 a 255)
-- Skill - 0 n�o, 1 sim, -1 aleat�rio
-- Luck - 0 n�o, 1 sim, -1 aleat�rio
-- Option Minima (0 a 7)
-- Option Maxima (0 a 7)
-- Excelente Minimo (0 a 6)
-- Excelente Maximo (0 a 6)
-- Quantidade para criar (minimo 1)
-- Dias - -1 para item normal, a partir de 1 quantidade de dias do item temporario
-- Index para identificar no NovaJoia_ItemNovoExtra (-1 para nao criar itens extras)
NovaJoia_ItemNovo = {
	{Index = 1, Grupo = 07, Id = 81, LevelMin = 13, LevelMax = 13, DurMin = 255, DurMax = 255, Skill = 1, Luck = 1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Quantidade = 1, Dias = -1, Extras = -1},
	{Index = 2, Grupo = 08, Id = 81, LevelMin = 13, LevelMax = 13, DurMin = 255, DurMax = 255, Skill = 1, Luck = 1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Quantidade = 1, Dias = -1, Extras = -1},
	{Index = 3, Grupo = 09, Id = 81, LevelMin = 13, LevelMax = 13, DurMin = 255, DurMax = 255, Skill = 1, Luck = 1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Quantidade = 1, Dias = -1, Extras = -1},
	{Index = 4, Grupo = 10, Id = 81, LevelMin = 13, LevelMax = 13, DurMin = 255, DurMax = 255, Skill = 1, Luck = 1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Quantidade = 1, Dias = -1, Extras = -1},
	{Index = 5, Grupo = 11, Id = 81, LevelMin = 13, LevelMax = 13, DurMin = 255, DurMax = 255, Skill = 1, Luck = 1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Quantidade = 1, Dias = -1, Extras = -1},
}


-- Extras do NovaJoia_ItemNovo
-- Grupo do item no item.txt
-- Id do item no item.txt
-- Level Minimo (0 a 15)
-- Level Maximo (0 a 15)
-- Durabilidade Minima (0 a 255)
-- Durabilidade Maxima (0 a 255)
-- Skill - 0 n�o, 1 sim, -1 aleat�rio
-- Luck - 0 n�o, 1 sim, -1 aleat�rio
-- Option Minima (0 a 7)
-- Option Maxima (0 a 7)
-- Excelente Minimo (0 a 6)
-- Excelente Maximo (0 a 6)
-- Quantidade para criar (minimo 1)
-- Dias - -1 para item normal, a partir de 1 quantidade de dias do item temporario
NovaJoia_ItemNovoExtra = {
	{Index = 1, Grupo = 0, Id = 21, LevelMin = 0, LevelMax = 15, DurMin = 0, DurMax = 255, Skill = -1, Luck = -1, OptMin = 7, OptMax = 7, ExcMin = 6, ExcMax = 6, Quantidade = 1, Dias = -1},
}
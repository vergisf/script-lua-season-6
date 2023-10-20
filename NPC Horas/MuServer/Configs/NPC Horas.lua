-- true ativa o sistema, false desativa
NPCHoras_Ativado = true

-- Numero do packet usado pelo sistema (tem que ser o mesmo no cliente)
NPCHoras_Packet = 121

-- true Conta como online quando esta em offattack, offhelper e offstore, false n?o conta
-- s? use false se estiver no update 65+, updates anteriores nao tem essa fun??o
NPCHoras_ContarOffline = true

-- Classe do Monstro
-- N�mero do Mapa
-- Coordenada X
-- Coordenada Y
-- Dire��o do Monstro
NPCHoras_Monstro = {
    Classe = 415, Mapa = 0, X = 130, Y = 134, Dir = 3
}

NPCHoras_Tabela		= "MEMB_INFO"
NPCHoras_ColunaHora	= "HorasOn"
NPCHoras_ColunaTemp	= "HorasTemp"
NPCHoras_Where		= "memb___id"
NPCHoras_Tipo		= 0


NPCHoras_Itens = {
[1 ] = {Nome = "Reaper Sword [RL]",	     Valor = 60,  Grupo = 0,  Id = 114,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[2 ] = {Nome = "Reaper Mace [RL]",	     Valor = 60,  Grupo = 0,  Id = 115,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[3 ] = {Nome = "Reaper Spear [RL]",	     Valor = 60,  Grupo = 0,  Id = 116,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[4 ] = {Nome = "Reaper Staff [RL]",	     Valor = 60,  Grupo = 5,  Id = 66,   Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[5 ] = {Nome = "Reaper Shield [RL]",	 Valor = 60,  Grupo = 6,  Id = 243,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[6 ] = {Nome = "Reaper Helm [RL]",	     Valor = 80,  Grupo = 7,  Id = 267,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[7 ] = {Nome = "Reaper Armor [RL]",	     Valor = 80,  Grupo = 8,  Id = 267,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[8 ] = {Nome = "Reaper Pants [RL]",	     Valor = 80,  Grupo = 9,  Id = 267,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[9 ] = {Nome = "Reaper Gloves [RL]",	 Valor = 80,  Grupo = 10, Id = 267,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[10] = {Nome = "Reaper Boots [RL]",	     Valor = 80,  Grupo = 11, Id = 267,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 63},
[11] = {Nome = "Reaper Cape [RL]",	     Valor = 120, Grupo = 12, Id = 279,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 47},
[12] = {Nome = "Reaper Wing [RL]",	     Valor = 120, Grupo = 12, Id = 280,  Level = 15, Dur = 255, Skill = 1, Luck = 1, Option = 7, Exc = 47},
}

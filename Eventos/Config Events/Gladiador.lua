
Gladiador_Define = {}
-- true ativa o sistema, false desativa
Gladiador_Define.Ativado = false

Gladiador_Define.ComandoAbrir		= "/abrirgladiador"	-- Comando para abrir o evento  /comando tempo
Gladiador_Define.ComandoIr			= "/gladiador"		-- comando para participar do evento
Gladiador_Define.ComandoIniciar	= "/giniciar"		-- comando para inciar o evento, usado apos o termino do tempo od comando abrir
Gladiador_Define.ComandoChamar		= "/gproximo"		-- comando para chamar a proxima luta
Gladiador_Define.ComandoCancelar	= "/gcancelar"		-- comando para cancelar o evento
Gladiador_Define.ComandoFinaliar	= "/gfim"			-- comando para finaliza o evento e premiar o vencedor
Gladiador_Define.ComandoWin		= "/gwin"			-- comando para finalizar uma luta  /comando 1/2
Gladiador_Define.ComandoInfo		= "/ginfo"			-- comando para saber a posição para usar o comando win e quando nao houver luta, mostra quantos players restam no evento
Gladiador_Define.ComandoCorrigir	= "/gcorrigir"		-- comando para corrigir o resultado de uma luta

Gladiador_Define.MinimoPlayers = 3		-- minimo de players para o evento ocorrer
Gladiador_Define.MaximoPlayers = 10	-- maximo de players, após atingir esse limite nenhum player pode entrar no evento

Gladiador_Define.Spawn = {Mapa = 6, X = 195, Y = 195} -- coordenada para onde os players que participarão do evento serão movidos
Gladiador_Define.Spot = {}
Gladiador_Define.Spot[1] = {Mapa = 6, X = 215, Y = 195} -- coordenada do lutador 1
Gladiador_Define.Spot[2] = {Mapa = 6, X = 217, Y = 195} -- coordenada do lutador 2

Gladiador_Define.Premio_Tabela	= "MEMB_INFO" 		-- tabela no sql da moeda premio
Gladiador_Define.Premio_Coluna	= "Cash"	 		-- coluna no sql da moeda premio
Gladiador_Define.Premio_Where	= "memb___id"		-- coluna de identificação do player
Gladiador_Define.Premio_Tipo	= 0					-- tipo de identificador. Login: 0, Nick: 1
Gladiador_Define.Premio_Nome	= "Cash"			-- nome da moeda
Gladiador_Define.Premio_Valor	= 50				-- valor a ser creditado ao player

return Gladiador_Define
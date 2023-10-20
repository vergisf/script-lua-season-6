PvpControl_Config = {
    -- true Ativa o sistema, false desativa
    Ativado = true,

    -- Quantidade de resets que permite ativar o pvp
    Resets = 50,

    -- Mapas onde o sistema funciona
    Mapas = {0,2,3},

    -- Mensagens do sistema
    Message = {
        ["Por"] = {
            [1] = "Seu PVP está desabilitado nesse mapa",
            [2] = "Atinja %d Resets para liberar",
            [3] = "O PVP de %s está desabilitado nesse mapa",
        },
        ["Eng"] = {
            [1] = "Seu PVP está desabilitado nesse mapa",
            [2] = "Atinja %d Resets para liberar",
            [3] = "O PVP de %s está desabilitado nesse mapa",
        },
        ["Spn"] = {
            [1] = "Seu PVP está desabilitado nesse mapa",
            [2] = "Atinja %d Resets para liberar",
            [3] = "O PVP de %s está desabilitado nesse mapa",
        },
    }
}

return PvpControl_Config
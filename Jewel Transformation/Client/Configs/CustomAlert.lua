CustomAlert_Config = {
    enable = true,
    packget = 34,
    window = 689,

    principalView = {
        text = {
            [1] = "Deseja mesmo fazer isso?",
            [2] = "Essa ação pode ser irreversível e seu item sumir",
        },
        x = 213,
        y = 124,
        width = 191,
        heigth = 70,
        color = {
            r = 0.00,
            g = 0.00,
            b = 0.00,
            alpha = 0.9
        }
    },

    buttons = {
        buttonConfirm = {
            index = 1,
            title = 'Confirmar',
            x = 236,
            y = 164,
            width = 50,
            heigth = 18,
            color = {
                r = 0.17,
                g = 0.17,
                b = 0.17,
                alpha = 0.9
            },
            colorHover = {
                r = 0.36,
                g = 0.36,
                b = 0.36,
                alpha = 1
            }
        },

        buttonCancel = {
            index = 2,
            title = 'Cancelar',
            x = 330,
            y = 164,
            width = 50,
            heigth = 18,
            color = {
                r = 0.17,
                g = 0.17,
                b = 0.17,
                alpha = 0.9
            },
            colorHover = {
                r = 0.36,
                g = 0.36,
                b = 0.36,
                alpha = 1
            }
        }
    }
}

return CustomAlert_Config
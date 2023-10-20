VipCard_Config = {
	Enabled = true,

	Packet = 76,

	ExpireDateColumn = "AccountExpireDate",

	Cards = {
		{Section = 14, Index = 207, Vip = 1, Days = 10, Name = "Vip KZ (10 Dias)"},
		{Section = 14, Index = 208, Vip = 1, Days = 20, Name = "Vip KZ (20 Dias)"},
		{Section = 14, Index = 209, Vip = 1, Days = 30, Name = "Vip KZ (30 Dias)"},
	},

	Message = {
		["Por"] = {
			[1] = " %d Dia(s) de Vip adicionado a sua conta",
			[2] = " Tipo de vip inferior ao seu plano Vip atual",
			[3] = " Seu plano vip foi alterado para %s",
		},

		["Eng"] = {
			[1] = " %d day(s) of Vip added to your account",
			[2] = " Vip level inferior to you current vip",
			[3] = " Your vip was upgraded to %s",
		},

		["Spn"] = {
			[1] = " %d d�a(s) de Vip agregado a su cuenta",
			[2] = " Tipo de vip inferior ao seu plano Vip atual",
			[3] = " Seu plano vip foi alterado para %s",
		}
	},

}

return VipCard_Config
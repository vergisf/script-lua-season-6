
HourDate = {}

function HourDate.Init()
    if HourDate_Config.enable then 
		InterfaceController.MainProc(HourDate.MakeInterface)
	end
end

function HourDate.MakeInterface()
    local date = os.date('%x')
    local hour = os.date('%X')

    SetFontType(HourDate_Config.size_font)
	SetTextBg(HourDate_Config.color_bg.r, HourDate_Config.color_bg.g, HourDate_Config.color_bg.b, HourDate_Config.color_bg.alpha)
	SetTextColor(HourDate_Config.color_text.r, HourDate_Config.color_text.g, HourDate_Config.color_text.b, HourDate_Config.color_text.alpha)

	RenderText3(HourDate_Config.config_x, HourDate_Config.config_y, string.format('Data: %s | Horário: %s ', date, hour), HourDate_Config.config_sizebg, 0)
end

HourDate.Init()

return HourDate
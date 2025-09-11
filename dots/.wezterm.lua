local wezterm = require 'wezterm'

return {
	default_prog = { "pwsh", "/nologo" },
	color_scheme = "rose-pine",

    font = wezterm.font("JetBrainsMonoNL NF", { weight = "Regular" }),
	font_size = 10,

	window_decorations = "RESIZE",
    enable_tab_bar = false,
	max_fps = 160,

    window_close_confirmation = "NeverPrompt",

    window_background_opacity = 0.5,
    win32_system_backdrop = "Mica",

    window_close_confirmation = "NeverPrompt",

    adjust_window_size_when_changing_font_size = false,

    keys = {
        {
            key = 'w',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
    },
}


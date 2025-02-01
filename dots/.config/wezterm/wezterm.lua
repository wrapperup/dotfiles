local wezterm = require 'wezterm'

return {
	default_prog = { "pwsh", "/nologo" },
	color_scheme = "rose-pine",

	font_size = 10,
    harfbuzz_features = {"calt=0", "clig=0", "liga=0"},

	window_decorations = "RESIZE",
    enable_tab_bar = false,
	max_fps = 160,

    window_close_confirmation = "NeverPrompt",

    window_background_opacity = 0.0,
    win32_system_backdrop = "Mica",

    keys = {
        {
            key = 'w',
            mods = 'CMD',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
    }
}


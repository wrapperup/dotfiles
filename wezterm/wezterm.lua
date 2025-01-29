local wezterm = require 'wezterm'

return {
	front_end = "OpenGL",
	default_prog = { "pwsh", "/nologo" },
	color_scheme = "rose-pine",
	-- colors = {
	-- 	background = "#320026",
	-- },
	window_background_opacity = 0.93,
	font = wezterm.font("JetBrainsMonoNL NF", { weight = "Regular" }),
	font_size = 10,
	use_fancy_tab_bar = false,
	enable_tab_bar = false,
	tab_bar_at_bottom = false,
	window_decorations = "RESIZE",
	max_fps = 160,
}


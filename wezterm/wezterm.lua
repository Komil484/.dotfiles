local wezterm = require("wezterm")
local config = {}

config.default_prog = { "powershell", "-NoLogo" }

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13
config.color_scheme = "Tokyo Night Storm"

-- config.enable_kitty_keyboard = true

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false

config.tab_max_width = 32
config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.4cell",
	bottom = "0cell",
}

-- config.color_scheme = "Github"
configs = {}
config.window_background_gradient = {
	-- colors = { "#001f4d", "#49024b" },
	colors = { "#152e48", "#242a49" },
	orientation = "Horizontal",
}

-- start maximized
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config

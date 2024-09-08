local wezterm = require("wezterm")
local config = {}

config.default_prog = { "powershell", "-NoLogo" }

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Tokyo Night Storm"

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0cell",
	bottom = "0cell",
}

-- start maximized
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config

local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Argonaut'
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Source Code Pro'
config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = 'NeverPrompt'

return config

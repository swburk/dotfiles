local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'Catppuccin Latte'
config.font = wezterm.font 'Source Code Pro'
config.font_size = 14
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = 'NeverPrompt'

config.keys = {
	{
		key = 'n',
		mods = 'CMD',
		action = wezterm.action.SpawnCommandInNewWindow {
			cwd = wezterm.home_dir,
		},
	},
	{
		key = 'r',
		mods = 'CMD|SHIFT',
		action = wezterm.action.PromptInputLine {
			description = 'Enter tab name',
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},
}

return config

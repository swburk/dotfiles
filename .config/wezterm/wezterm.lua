local wezterm = require('wezterm')
local act = wezterm.action
local config = wezterm.config_builder()

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Light'
end

if get_appearance():find('Dark') then
	config.color_scheme = 'Catppuccin Mocha'
else
	config.color_scheme = 'Catppuccin Latte'
end
config.font_size = 14
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.initial_cols = 88
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = 'NeverPrompt'

config.keys = {
	{ key = 'UpArrow', mods = 'SHIFT', action = act.ScrollToPrompt(-1) },
	{ key = 'DownArrow', mods = 'SHIFT', action = act.ScrollToPrompt(1) },
}
config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = 'Left' } },
		action = act.SelectTextAtMouseCursor('SemanticZone'),
		mods = 'NONE',
	},
}

return config

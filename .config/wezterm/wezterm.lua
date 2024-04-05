local wezterm = require 'wezterm'
local config = {}

function scheme_for_appearance(appearance)
	if appearance:find('Dark') then
		return 'Catppuccin Mocha'
	else
		return 'Catppuccin Latte'
	end
end

-- Change the color scheme when the system appearance changes.
wezterm.on('window-config-reloaded', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

-- Use PowerShell on Windows.
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
	config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 14
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = 'NeverPrompt'

config.keys = {
	-- Scroll to the previous/next prompt.
	{
		key = 'UpArrow', mods = 'SHIFT',
		action = wezterm.action.ScrollToPrompt(-1)
	},
	{
		key = 'DownArrow', mods = 'SHIFT',
		action = wezterm.action.ScrollToPrompt(1)
	},
}

return config

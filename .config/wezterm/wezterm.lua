local wezterm = require 'wezterm'
local config = {}

function scheme_for_appearance(appearance)
	if appearance:find 'Dark' then
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

-- Hide the scrollbar when the alternate screen is active.
wezterm.on("update-status", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.colors then
    overrides.colors = {}
  end
  if pane:is_alt_screen_active() then
    overrides.colors.scrollbar_thumb = "transparent"
  else
    overrides.colors.scrollbar_thumb = nil
  end
  window:set_config_overrides(overrides)
end)

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.initial_cols = 80
config.initial_rows = 24
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = 'NeverPrompt'

config.keys = {
	-- Open new windows in the home directory.
	{
		key = 'n',
		mods = 'CMD',
		action = wezterm.action.SpawnCommandInNewWindow {
			cwd = wezterm.home_dir,
		},
	},
	-- Rename current tab.
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

local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font('JetBrainsMono Nerd Font Propo')
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'
config.window_padding = { bottom = 0, left = 0, right = 0, top = 0 }

return config

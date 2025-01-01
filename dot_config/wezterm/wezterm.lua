local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- c.f. List of color schemes: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Monokai (dark) (terminal.sexy)'
config.window_background_opacity = 0.85
config.font = wezterm.font_with_fallback {
  'Source Code Pro',
  'Noto Sans Mono CJK JP'
}

config.initial_cols = 140
config.initial_rows = 40

config.use_ime = true

-- Return the config to wezterm
return config

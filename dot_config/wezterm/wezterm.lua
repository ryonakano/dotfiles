local wezterm = require("wezterm")
local config = wezterm.config_builder()

--[[----------------------------------------------------------------------------
General
----------------------------------------------------------------------------]]--
config.use_ime = true

--[[----------------------------------------------------------------------------
Appearance
----------------------------------------------------------------------------]]--
-- c.f. List of color schemes: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Monokai (dark) (terminal.sexy)"

config.font = wezterm.font_with_fallback {
  "Source Code Pro",
  "Noto Sans Mono CJK JP",
}

-- Unfortunatelly it is only for Windows and macOS that WezTerm provides the background blur feature
-- Use alternative way on Linux, e.g. the applications blur feature of Blur my Shell in case of GNOME
config.window_background_opacity = 0.85

config.initial_cols = 140
config.initial_rows = 40

--[[----------------------------------------------------------------------------
Tab customization
Many thanks to https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization
----------------------------------------------------------------------------]]--
-- Remove unnecessary GUI widget for tab management in favor of hotkeys
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

-- Make the tabbar transparent
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
-- Unify the background color of the tabbar and the console
config.window_background_gradient = {
  colors = {
    "#000000",
  },
}
-- Hide borders between each tab
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

-- Customize tab appearance
wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    local background = "#5c6d74"
    local foreground = "#FFFFFF"

    if tab.is_active then
      background = "#ae8b2d"
      foreground = "#FFFFFF"
    end

    local title = string.format(
      "   %s   "
      , wezterm.truncate_right(tab.active_pane.title, max_width - 1)
    )

    return {
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
    }
  end
)

return config

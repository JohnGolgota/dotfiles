-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.default_prog = { "pwsh", "-NoLogo" }

-- For example, changing the color scheme:
-- config.color_scheme = "ayu"
-- config.color_scheme = "Butrin (Gogh)"
config.color_scheme = "carbonfox"

config.window_background_opacity = 0.6

-- and finally, return the configuration to wezterm
return config

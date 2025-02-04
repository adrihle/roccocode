local C = require('config.constants')

local TOKYONIGHT = require('plugins.ui.theme.tokyonight')
local ROSEPINE  = require('plugins.ui.theme.rosepine')

local THEMES = {
  [C.THEMES.TOKYONIGHT] = TOKYONIGHT,
  [C.THEMES.ROSEPINE] = ROSEPINE,
}

return {
  THEMES[Roccocode.theme],
}

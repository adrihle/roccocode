local MAPPER = require('utils.functions.mapping');

local CATEGORY = 'Window'

local function getid(id)
  return 'window-' .. id
end

local function getkeybind(key)
  return '<leader>w' .. key
end

MAPPER.Map({
  keybind = '<S-Left>',
  command = '<C-w>h',
  id = getid('left_move'),
  category = CATEGORY,
  description = 'Move left between buffers in screen'
})

MAPPER.Map({
  keybind = '<S-Down>',
  command = '<C-w>j',
  id = getid('down-move'),
  category = CATEGORY,
  description = 'Move down between buffers in screen'
})

MAPPER.Map({
  keybind = '<S-Up>',
  command = '<C-w>k',
  id = getid('up-move'),
  category = CATEGORY,
  description = 'Move up between buffers in screen'
})

MAPPER.Map({
  keybind = '<S-Right>',
  command = '<C-w>l',
  id = getid('right-move'),
  category = CATEGORY,
  description = 'Move right between buffers in screen'
})

MAPPER.Map({
  keybind = getkeybind('v'),
  command = '<C-w>v',
  id = getid('split-v'),
  category = CATEGORY,
  description = 'Split window vertically'
})

MAPPER.Map({
  keybind = getkeybind('h'),
  command = '<C-w>s',
  id = getid('split-h'),
  category = CATEGORY,
  description = 'Split window horizontally'
})

MAPPER.Map({
  keybind = getkeybind('q'),
  command = '<C-w>q',
  id = getid('close-window'),
  category = CATEGORY,
  description = 'Close current window'
})


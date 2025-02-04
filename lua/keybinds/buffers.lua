local MAPPER = require('utils.functions.mapping');

local CATEGORY = "Buffers"

local function getid(id)
  return 'buffers-' .. id
end

local function getkeybind(key)
  return '<leader>b' .. key
end

MAPPER.Map({
  keybind = getkeybind('t'),
  command = '<C-6>',
  id = getid('toggle'),
  category = CATEGORY,
  description = 'Toggle between actual and previous buffer'
})

MAPPER.Map({
  keybind = getkeybind('n'),
  command = ':bnext<CR>',
  id = getid('next'),
  category = CATEGORY,
  description = 'Change to the next buffer'
})

MAPPER.Map({
  keybind = getkeybind('p'),
  command = ':bprev<CR>',
  id = getid('prev'),
  category = CATEGORY,
  description = 'Change to the previous buffer'
})

MAPPER.Map({
  keybind = getkeybind('q'),
  command = ':b#|bd#<CR>',
  id = getid('close'),
  category = CATEGORY,
  description = 'Close current buffer'
})

MAPPER.Map({
  keybind = getkeybind('x'),
  command = ':%bd|e#|bd#<CR>',
  id = getid('close-all-but-current'),
  category = CATEGORY,
  description = 'Close all except the current buffer'
})


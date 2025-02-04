local MAPPER = require('utils.functions.mapping')

local CATEGORY = 'LSP Saga'

local function get_command(command)
  return '<Cmd>Lspsaga ' .. command .. '<CR>'
end

local function get_id(id)
  return 'saga_' .. id
end

local function get_keybind(letter)
  return '<leader>l' .. letter
end

MAPPER.Map({
  keybind = get_keybind('f'),
  command = get_command('finder'),
  category = CATEGORY,
  id = get_id('finder'),
  description = 'Find references for variable'
})

MAPPER.Map({
  keybind = get_keybind('h'),
  command = get_command('hover_doc'),
  category = CATEGORY,
  id = get_id('hover'),
  description = 'Hover file where variable is declared'
})

MAPPER.Map({
  keybind = get_keybind('p'),
  command = get_command('peek_definition'),
  category = CATEGORY,
  id = get_id('peek'),
  description = 'Peek definition for variable'
})

MAPPER.Map({
  keybind = get_keybind('+'),
  command = get_command('diagnostic_jump_next'),
  category = CATEGORY,
  id = get_id('diag_next'),
  description = 'Jump next diagnostic'
})

MAPPER.Map({
  keybind = get_keybind('i'),
  command = get_command('incoming_calls'),
  category = CATEGORY,
  id = get_id('incoming'),
  description = 'Find where variable is being called'
})

MAPPER.Map({
  keybind = get_keybind('o'),
  command = get_command('outgoing_calls'),
  category = CATEGORY,
  id = get_id('outgoing'),
  description = 'Pending definition'
})

MAPPER.Map({
  keybind = get_keybind('t'),
  command = get_command('term_toggle'),
  category = CATEGORY,
  id = get_id('term'),
  description = 'Hover a terminal'
})

MAPPER.Map({
  keybind = get_keybind('l'),
  command = get_command('outline'),
  category = CATEGORY,
  id = get_id('outline'),
  description = 'Side outlined variables of file'
})

MAPPER.Map({
  keybind = get_keybind('r'),
  command = get_command('rename'),
  category = CATEGORY,
  id = get_keybind('rename'),
  description = 'Rename variable'
})

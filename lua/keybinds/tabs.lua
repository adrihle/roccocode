local MAPPER = require('utils.functions.mapping');

local CATEGORY = "Tabs"

local function getid(id)
  return 'tabs-' .. id
end

local function getkeybind(key)
  return '<leader>t' .. key
end

MAPPER.Map({
  keybind = getkeybind('o'),
  command = ':tabnew<CR>',
  id = getid('new'),
  category = CATEGORY,
  description = 'Open a new tab'
})

MAPPER.Map({
  keybind = getkeybind('c'),
  command = ':tabclose<CR>',
  id = getid('close'),
  category = CATEGORY,
  description = 'Close current tab'
})

MAPPER.Map({
  keybind = getkeybind('n'),
  command = ':tabn<CR>',
  id = getid('next'),
  category = CATEGORY,
  description = 'Go to the next tab'
})

MAPPER.Map({
  keybind = getkeybind('p'),
  command = ':tabp<CR>',
  id = getid('previous'),
  category = CATEGORY,
  description = 'Go to the previous tab'
})


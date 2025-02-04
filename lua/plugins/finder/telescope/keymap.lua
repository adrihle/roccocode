local MAPPER = require('utils.functions.mapping')

local CATEGORY = 'Telescope'

local function getid(id)
  return 'telescope-' .. id
end

local builtin = require('telescope.builtin')

MAPPER.Map({
  keybind = '<leader>ff',
  command = builtin.find_files,
  category = CATEGORY,
  id = getid('find-file'),
  description = 'Find commited file by name'
})

MAPPER.Map({
  keybind = '<leader>fg',
  command = builtin.live_grep,
  category = CATEGORY,
  id = getid('grep-file'),
  description = 'Grep text through commited files'
})

MAPPER.Map({
  keybind = '<leader>fs',
  command = builtin.live_grep,
  category = CATEGORY,
  id = getid('grep-string'),
  description = 'Grep string through commited files'
})

MAPPER.Map({
  keybind = '<leader>fb',
  command = builtin.buffers,
  category = CATEGORY,
  id = getid('find_buffers'),
  description = 'Find active buffers'
})

MAPPER.Map({
  keybind = '<leader>fh',
  command = builtin.help_tags,
  category = CATEGORY,
  id = getid('find_help_tags'),
  description = 'Find help tags'
})

MAPPER.Map({
  keybind = '<leader>fm',
  command = "<CMD>:Telescope mapper<CR>",
  category = CATEGORY,
  id = getid('mapper'),
  description = 'Find and grep keymaps'
})


local MAPPER = require('utils.functions.mapping')

local CATEGORY = 'Formatter'

local function getid(id)
  return 'formatter-' .. id
end

MAPPER.Map({
  keybind = '<leader>lf',
  command = '"<CMD>:lua vim.lsp.buf.format{ async = true }<CR>',
  category = CATEGORY,
  id = getid('format_file'),
  description = 'Format document with linter'
})

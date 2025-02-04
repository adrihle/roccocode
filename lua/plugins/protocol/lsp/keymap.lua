local MAPPER = require('utils.functions.mapping')
local C = require('config.constants')

local CATEGORY = 'LSP'

local function getid(id)
  return 'lsp-' .. id
end

local function getkeybind(keybind)
  return '<leader>l' .. keybind
end

MAPPER.Map({
  keybind = getkeybind('d'),
  command = '<cmd>lua vim.lsp.buf.definition()<CR>',
  category = CATEGORY,
  id = getid('definition'),
  description = 'Go to cursor variable definition',
})

-- MAPPER.Map({
--   keybind = getkeybind('r'),
--   command = '<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>',
--   category = CATEGORY,
--   id = getid('references'),
--   description = 'Go to cursor variable references'
-- })

MAPPER.Map({
  keybind = getkeybind('-'),
  command = '<cmd>lua vim.lsp.buf.code_action()<CR>',
  category = CATEGORY,
  id = getid('code_action'),
  description = 'Hover code actions'
})

MAPPER.Map({
  keybind = getkeybind('.'),
  command = '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',
  category = CATEGORY,
  id = getid('format'),
  description = 'Format file'
})

MAPPER.Map({
  keybind = getkeybind('s'),
  command = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
  category = CATEGORY,
  id = getid('signature_help'),
  description = 'Show signature help'
})

MAPPER.Map({
  mode = C.MAPPING.MODE.VISUAL,
  keybind = getkeybind('f'),
  command = "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>",
  category = CATEGORY,
  id = getid('range_format'),
  description = 'Format range of code'
})

local DIAGNOSTIC_WINDOW_STYLES = "{ border = 'rounded', max_width = 100 }"

MAPPER.Map({
  keybind = getkeybind(','),
  command = '<cmd>lua vim.diagnostic.open_float(' .. DIAGNOSTIC_WINDOW_STYLES .. ')<CR>',
  category = CATEGORY,
  id = getid('diagnostic_float'),
  description = 'Open float diagnostic'
})

MAPPER.Map({
  keybind = getkeybind('+'),
  command = '<cmd>lua vim.diagnostic.goto_next({ float = ' .. DIAGNOSTIC_WINDOW_STYLES .. '})<CR>',
  category = CATEGORY,
  id = getid('diagnostic_next'),
  description = 'Go next diagnostic'
})

MAPPER.Map({
  keybind = getkeybind('-'),
  command = '<cmd>lua vim.diagnostic.goto_prev({ float = ' .. DIAGNOSTIC_WINDOW_STYLES .. '})<CR>',
  category = CATEGORY,
  id = getid('diagnostic_prev'),
  description = 'Go prev diagnostic'
})

MAPPER.Map({
  keybind = getkeybind('t'),
  command = '<cmd>LspToggleAutoFormat<CR>',
  category = CATEGORY,
  id = getid('toggle_save_format'),
  description = 'Toggle auto format on save'
})


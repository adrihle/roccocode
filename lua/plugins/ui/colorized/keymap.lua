local MAPPER = require('utils.functions.mapping')

local CATEGORY = 'Colorized'

local function getid(id)
  return 'colorized' .. id
end

MAPPER.Map({
  keybind = '<leader>uc',
  command = "<CMD>:ColorizerAttachToBuffer<CR>",
  category = CATEGORY,
  id = getid('buffer colorized'),
  description = 'Colorized hex colors into the buffers'
})

MAPPER.Map({
  keybind = '<leader>ud',
  command = "<CMD>:ColorizerDetachFromBuffer<CR>",
  category = CATEGORY,
  id = getid('buffer decolorized'),
  description = 'DeColorized hex colors into the buffers'
})


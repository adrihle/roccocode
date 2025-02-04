local MAPPER = require('utils.functions.mapping')

local CATEGORY = 'Tree'
local COMMAND_DEFAULT = ''

local function TreeMapper(config)
  MAPPER.VirtualMap({
    id = 'tree-' .. config.id,
    category = CATEGORY,
    command = COMMAND_DEFAULT,
    description = 'FROM TREE BUFFER: ' .. config.description,
    keybind = config.keybind,
  })
end

TreeMapper({
  id = 'vsplit',
  keybind = '<C-v>',
  description = 'Open buffer in vertical split',
})

TreeMapper({
  id = 'split',
  keybind = '<C-x>',
  description = 'Open buffer in horizontal split',
})

TreeMapper({
  id = 'tabnew',
  keybind = '<C-t>',
  description = 'Open buffer in a new tab',
})

TreeMapper({
  id = 'prev_sibling',
  keybind = '<',
  description = 'Move to previously silbing file/folder',
})

TreeMapper({
  id = 'next_sibling',
  keybind = '>',
  description = 'Move to next silbing file/folder',
})

TreeMapper({
  id = 'parent_node',
  keybind = 'P',
  description = 'Move to the parent node of the cursor file/folder',
})

TreeMapper({
  id = 'first_sibling',
  keybind = 'K',
  description = 'Move to the first sibling of the current folder',
})

TreeMapper({
  id = 'last_sibling',
  keybind = 'J',
  description = 'Move to next silbing file/folder',
})

TreeMapper({
  id = 'toggle_ignore',
  keybind = 'I',
  description = 'Toggle tree between ignored files',
})

TreeMapper({
  id = 'toggle_dotfiles',
  keybind = 'H',
  description = 'Toggle tree between dotfiles and current folder',
})

TreeMapper({
  id = 'refresh',
  keybind = 'R',
  description = 'Refresh tree bufrer',
})

TreeMapper({
  id = 'append',
  keybind = 'a',
  description = 'Create file/folder in current cursor path',
})

TreeMapper({
  id = 'delete',
  keybind = 'd',
  description = 'Remove cursor file/folder',
})

TreeMapper({
  id = 'trash',
  keybind = 'D',
  description = 'Trash cursor file/folder',
})

TreeMapper({
  id = 'rename',
  keybind = 'r',
  description = 'Rename cursor file/folder',
})

TreeMapper({
  id = 'full_rename',
  keybind = '<C-r>',
  description = 'Full rename cursor file/folder',
})

TreeMapper({
  id = 'cut',
  keybind = 'x',
  description = 'Cut cursor file/folder',
})

TreeMapper({
  id = 'copy',
  keybind = 'c',
  description = 'Copy cursor file/folder',
})

TreeMapper({
  id = 'copy_name',
  keybind = 'y',
  description = 'Copy cursor file/folder',
})

TreeMapper({
  id = 'copy_path',
  keybind = 'Y',
  description = 'Copy cursor file/folder path',
})

TreeMapper({
  id = 'copy_absolute_path',
  keybind = 'gy',
  description = 'Copy cursor file/folder absolute path',
})

TreeMapper({
  id = 'dir_up',
  keybind = '-',
  description = 'Show dir up of tree',
})

TreeMapper({
  id = 'system_open',
  keybind = 's',
  description = 'Open file through system open',
})

TreeMapper({
  id = 'close',
  keybind = 'q',
  description = 'Close tree buffer',
})

TreeMapper({
  id = 'collapse_all',
  keybind = 'W',
  description = 'Collapse all folders opened in tree',
})

TreeMapper({
  id = 'search_node',
  keybind = 'S',
  description = 'Search into the tree nodes',
})

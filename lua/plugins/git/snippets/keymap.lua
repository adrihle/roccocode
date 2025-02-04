local MAPPER = require('utils.functions.mapping')

local CATEGORY = 'Git'

local function getid(id)
  return 'git' .. id
end

local function getkeybind(key)
  return '<leader>g' .. key
end

MAPPER.Map({
  keybind = getkeybind('b'),
  command = '<CMD>:GitBlame<CR>',
  category = CATEGORY,
  id = getid('blame'),
  description = 'Open a panel with the git blames'
})

MAPPER.Map({
  keybind = getkeybind('o'),
  command = "<CMD>lua require('git.browse').open(false)<CR>",
  category = CATEGORY,
  id = getid('grep-file'),
  description = 'Grep text through commited files'
})

MAPPER.Map({
  keybind = getkeybind('n'),
  command = "<CMD>:GitCreatePullRequest<CR>",
  category = CATEGORY,
  id = getid('grep-string'),
  description = 'Grep string through commited files'
})

MAPPER.Map({
  keybind = getkeybind('p'),
  command = "<CMD>lua require('git.browse').pull_request()<CR>",
  category = CATEGORY,
  id = getid('find_buffers'),
  description = 'Find active buffers'
})

MAPPER.Map({
  keybind = getkeybind('g'),
  command = '<CMD>:LazyGit<CR>',
  category = CATEGORY,
  id = getid('lazygit'),
  description = 'Open Lazygit'
})



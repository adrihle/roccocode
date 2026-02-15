local opts = { silent = true, noremap = true }

local function toggle_or_connect()
  if tonumber(vim.env.OPENCODE_PORT) then
    require('opencode').select_server()
  else
    require('opencode').toggle()
  end
end

local function ask_this()
  require('opencode').ask('@this ')
end

vim.keymap.set({ 'n', 'x' }, '<leader>oa', ask_this, vim.tbl_extend('force', opts, {
  desc = 'Ask opencode with current context'
}))

vim.keymap.set({ 'n', 'x' }, '<leader>oi', ask_this, vim.tbl_extend('force', opts, {
  desc = 'Ask opencode with current context'
}))

vim.keymap.set('n', '<leader>ox', function()
  require('opencode').select()
end, vim.tbl_extend('force', opts, {
  desc = 'Open opencode actions'
}))

vim.keymap.set('n', '<leader>ot', toggle_or_connect, vim.tbl_extend('force', opts, {
  desc = 'Toggle or connect opencode'
}))

vim.keymap.set('n', '<leader>os', function()
  require('opencode').select_server()
end, vim.tbl_extend('force', opts, {
  desc = 'Select opencode server'
}))

vim.keymap.set({ 'n', 'x' }, '<leader>oe', function()
  require('opencode').prompt('Explain @this', { submit = true })
end, vim.tbl_extend('force', opts, {
  desc = 'Explain selected code with opencode'
}))

vim.keymap.set('n', '<leader>ok', function()
  require('opencode').command('session.half.page.up')
end, vim.tbl_extend('force', opts, {
  desc = 'Scroll opencode messages up'
}))

vim.keymap.set('n', '<leader>oj', function()
  require('opencode').command('session.half.page.down')
end, vim.tbl_extend('force', opts, {
  desc = 'Scroll opencode messages down'
}))

vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], vim.tbl_extend('force', opts, {
  desc = 'Exit terminal mode (double escape)'
}))

vim.keymap.set('t', '<C-]>', [[<C-\><C-n>]], vim.tbl_extend('force', opts, {
  desc = 'Exit terminal mode'
}))

vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], vim.tbl_extend('force', opts, {
  desc = 'Exit terminal mode'
}))

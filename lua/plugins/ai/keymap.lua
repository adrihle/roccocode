local opts = { silent = true, noremap = true }
local is_toggling = false

local function safe_toggle()
  if is_toggling then
    return
  end

  is_toggling = true
  pcall(function()
    require('opencode').toggle()
  end)

  vim.defer_fn(function()
    is_toggling = false
  end, 150)
end

local function ask_this()
  require('opencode').start()
  vim.schedule(function()
    require('opencode').ask('@this ')
  end)
end

local function toggle_opencode_from_terminal()
  local esc = vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'n', false)
  vim.schedule(function()
    safe_toggle()
  end)
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

vim.keymap.set('n', '<leader>ot', function()
  safe_toggle()
end, vim.tbl_extend('force', opts, {
  desc = 'Toggle opencode terminal'
}))

vim.keymap.set({ 'n', 'x' }, '<leader>oe', function()
  require('opencode').prompt('Explain @this', { submit = true })
end, vim.tbl_extend('force', opts, {
  desc = 'Explain selected code with opencode'
}))

vim.keymap.set('t', '<leader>ot', toggle_opencode_from_terminal, vim.tbl_extend('force', opts, {
  desc = 'Toggle opencode terminal'
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

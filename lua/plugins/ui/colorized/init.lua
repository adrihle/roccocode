local NAME = 'norcalli/nvim-colorizer.lua'

local CONFIG = function ()
  local status_ok, colorized = pcall(require, 'colorized')

  if not status_ok then
    return
  end

  colorized.setup({
    "*",
    css = { rgb_fn = true },
    html = { names = false }
  }, { mode = 'background' })

  vim.cmd [[autocmd BufReadPost,BufNewFile * ColorizerAttachToBuffer]]

end

return {
  {
    NAME,
    lazy = false,
    config = CONFIG,
  }
}

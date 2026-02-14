local NAME = 'nickjvandyke/opencode.nvim'

local CONFIG = function()
  vim.g.opencode_opts = {
    provider = {
      enabled = 'terminal',
      terminal = {
        split = 'right',
        width = math.floor(vim.o.columns * 0.45),
      },
    },
  }
  vim.o.autoread = true
end

return {
  {
    NAME,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = CONFIG,
    event = 'VeryLazy',
  }
}

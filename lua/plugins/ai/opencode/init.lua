local NAME = 'nickjvandyke/opencode.nvim'

local CONFIG = function()
  local external_port = tonumber(vim.env.OPENCODE_PORT)
  local local_port = 38000 + (vim.fn.getpid() % 20000)

  if external_port then
    vim.g.opencode_opts = {
      port = external_port,
      provider = {
        toggle = function()
          require('opencode').select_server()
        end,
        start = function()
          error('No opencode server found on OPENCODE_PORT. Start it in your dedicated terminal tab.', 0)
        end,
        stop = function() end,
      },
    }
  else
    vim.g.opencode_opts = {
      port = local_port,
      provider = {
        enabled = 'snacks',
        cmd = 'opencode --port',
        snacks = {
          auto_close = true,
          win = {
            position = 'float',
            enter = true,
            border = Roccocode.ui.float.border,
            bo = {
              filetype = 'opencode_terminal',
            },
          },
        },
      },
    }
  end

  vim.o.autoread = true
end

return {
  {
    NAME,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/snacks.nvim',
    },
    config = CONFIG,
    event = 'VeryLazy',
  }
}

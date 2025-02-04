local TABLES = require('utils.functions.tables')

local GITSIGNS = require('plugins.git.gitsigns')
local SNIPPETS = require('plugins.git.snippets')

local LAZYGIT = {
    {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },
}

return TABLES.table_merge(
  GITSIGNS,
  LAZYGIT,
  SNIPPETS
)

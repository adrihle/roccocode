local TABLES    = require('utils.functions.tables')

local AUTOPAIRS = require('plugins.core.autopairs')
local COMMENT = require('plugins.core.comment')

local CORE      = {
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
  { "tpope/vim-surround" },
}

return TABLES.table_merge(
  CORE,
  AUTOPAIRS,
  COMMENT
)

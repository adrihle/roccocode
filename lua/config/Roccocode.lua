------------------------------------------------
--                                            --
--    This is a main configuration file for   --
--                    Roccocode               --
--      Change variables which you need to    --
--                into this folder            --
--                                            --
------------------------------------------------

local icons = require("utils.icons")
local C = require('config.constants')

Roccocode = {
  _VERSION = "1.0.0",
  theme = C.THEMES.TOKYONIGHT,
  colorscheme = C.THEMES.TOKYONIGHT,
  ui = {
    colors = {
      primary = "#488dff",
      secondary = "#FFA630",
      border = "#1A1B26",
    },
    float = {
      border = "rounded",
    },
  },
  plugins = {
    completion = {
      select_first_on_enter = false,
    },
    experimental_noice = {
      enabled = false,
    },
    rooter = {
      patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" },
    },
    zen = {
      enabled = true,
    },
    tree = {
      width = 30,
    },
    mason = {
      ensure_installed = {
        "bashls",
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "ts_ls",
        "pyright",
        "dockerls",
        "yamlls"
      }
    },
    treesitter = {
      ensure_installed = {
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "vue",
        "astro",
        "svelte",
        "gitcommit",
        "graphql",
        "json",
        "json5",
        "lua",
        "markdown",
        "prisma",
        "vim",
        "python",
      },
    },
    formatters = {
      ensure_installed = {
        "prettier",
        "stylua",
        "black",
      },
    },
  },
  icons = icons,
  statusline = {
    path_enabled = false,
    path = "relative", -- absolute/relative
  },
  lsp = {
    virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
  },
}

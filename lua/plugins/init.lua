local TABLES = require('utils.functions.tables')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local CORE     = require('plugins.core')
local FINDER   = require('plugins.finder')
local UI       = require('plugins.ui')
local PROTOCOL = require('plugins.protocol')
local GIT      = require('plugins.git')

local PLUGINS  = TABLES.table_merge(
  CORE,
  UI,
  FINDER,
  PROTOCOL,
  GIT
)

require("lazy").setup({ PLUGINS }, {
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
  ui = {
    border = Roccocode.ui.float.border,
  }
})

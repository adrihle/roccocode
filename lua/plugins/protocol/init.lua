local TABLES = require('utils.functions.tables')

local MASON = require('plugins.protocol.mason')
local LSP = require('plugins.protocol.lsp')
local CMP = require('plugins.protocol.cmp')
local TYPESCRIPT = require('plugins.protocol.typescript')
local TREESITTER = require('plugins.protocol.treesitter')
local FORMATTER = require('plugins.protocol.formatter')
local SAGA = require('plugins.protocol.saga')
local INLAYHINTS = require('plugins.protocol.lsp-inlinehint')

return TABLES.table_merge(
  LSP,
  MASON,
  CMP,
  TYPESCRIPT,
  TREESITTER,
  FORMATTER,
  SAGA,
  INLAYHINTS
)

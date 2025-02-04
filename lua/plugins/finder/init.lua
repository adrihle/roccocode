local TABLES    = require('utils.functions.tables')

local TELESCOPE = require('plugins.finder.telescope')
local MAPPER    = require('plugins.finder.mapper')

return TABLES.table_merge(
  MAPPER,
  TELESCOPE
)

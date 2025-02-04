local C = require('config.constants')

local DEFAULT_CATEGORY = 'Undefined'
local DEFAULT_DESCRIPTION = 'Pending to define'

local MAPPER = {}

local mapper_ready, Mapper = pcall(require, "nvim-mapper")
if not mapper_ready then
  return MAPPER
end

local function cloneTable(table)
  local table2 = {}
  for k, v in pairs(table) do table2[k] = v end
  return table2
end

local function getMapOptions(desc, id)
  local descTable = { desc = desc or id }
  local table = cloneTable(C.MAPPING.OPTIONS)
  for k, v in pairs(descTable) do table[k] = v end
  return table
end

local function injectMapConfig(mapper, config)
  mapper(
    config.mode or C.MAPPING.MODE.NORMAL,
    config.keybind,
    config.command,
    config.options or getMapOptions(config.menu, config.id),
    config.category or DEFAULT_CATEGORY,
    config.id,
    config.description or DEFAULT_DESCRIPTION
  )
end

MAPPER.Map = function(config)
  injectMapConfig(Mapper.map, config)
end

MAPPER.BufferMap = function(config)
  injectMapConfig(Mapper.map_buf, config)
end

MAPPER.VirtualMap = function(config)
  injectMapConfig(Mapper.map_virtual, config)
end

return MAPPER;

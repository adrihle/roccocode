local SERVERS = {
  LUA = require('plugins.protocol.servers.lua_ls'),
  TYPESCRIPT = require('plugins.protocol.servers.typescript'),
  HTML = require('plugins.protocol.servers.html'),
  CSS = require('plugins.protocol.servers.cssls'),
  JSON = require('plugins.protocol.servers.jsonls'),
  BASH = require('plugins.protocol.servers.bashls'),
  ESLINT = require('plugins.protocol.servers.eslint'),
  PYTHON = require('plugins.protocol.servers.python'),
}

return SERVERS

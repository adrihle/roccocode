local NAME = 'L3MON4D3/LuaSnip'

local DEPENDENCIES = { "rafamadriz/friendly-snippets" }

local CONFIG = function()
  local status_ok, vscode = pcall(require, "luasnip.loaders.from_vscode")
  if not status_ok then
    return
  end

  vscode.load({
    include = { "javascript" }
  })

  require('luasnip').filetype_extend("typescriptreact", { "html" })
end

return {
  {
    NAME,
    dependencies = DEPENDENCIES,
    config = CONFIG,
  }
}

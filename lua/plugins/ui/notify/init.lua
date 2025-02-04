local NAME = 'rcarriga/nvim-notify'

local CONFIG = function()
  require('notify').setup({
    background_colour = '#000000'
  })
end

local INIT = function()
  local banned_messages = {
    "No information available",
    "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
    "LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
  }
  vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
      if msg == banned then
        return
      end
    end
    return require("notify")(msg, ...)
  end
end

return {
  {
    NAME,
    config = CONFIG,
    init = INIT
  }
}

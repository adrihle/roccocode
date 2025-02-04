local NAME = 'nvimdev/lspsaga.nvim';

local DEPENDENCIES = {
  'nvim-treesitter/nvim-treesitter', -- optional
  'nvim-tree/nvim-web-devicons'      -- optional
}

local CONFIG = function()
  local saga_ok, saga = pcall(require, "lspsaga")

  if (not saga_ok) then
    return
  end

  saga.setup({
    finder = {
      max_height = 0.6,
      keys = {
        vsplit = 'v'
      }
    }
  })
end

return {
  {
    NAME,
    dependencies = DEPENDENCIES,
    config = CONFIG
  }
}

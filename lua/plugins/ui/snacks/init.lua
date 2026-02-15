local NAME = 'folke/snacks.nvim'

return {
  {
    NAME,
    opts = {
      terminal = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
    },
    lazy = true,
  }
}

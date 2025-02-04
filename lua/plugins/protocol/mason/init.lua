local NAME = 'williamboman/mason.nvim'

local DEPENDENCIES = { "williamboman/mason-lspconfig.nvim" }

local CONFIG = function()
  local mason_ok, mason = pcall(require, "mason")
  local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")

  if not mason_ok or not mason_lsp_ok then
    return
  end

  mason.setup({
    ui = {
      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = Roccocode.ui.float.border or "rounded",
    },
    ensure_installed = {
      "mypy",
      "ruff",
      "black",
    }
  })

  mason_lsp.setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = Roccocode.plugins.mason.ensure_installed,
    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = true,
  })
end

return {
  {
    NAME,
    cmd = "Mason",
    config = CONFIG,
    dependencies = DEPENDENCIES,
    opts = {
      registries = { 'lua:mason-registry.index' },
      PATH = 'append',
    },
    build = ':MasonUpdate'
  }
}

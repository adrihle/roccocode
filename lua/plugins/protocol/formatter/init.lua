local NAME = 'jose-elias-alvarez/null-ls.nvim'

local DEPENDENCIES = {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      automatic_setup = true,
      ensure_installed = Roccocode.plugins.formatters.ensure_installed,
      automatic_installation = true,
    },
  }
}

local CONFIG = function()
  -- Using protected call
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  -- Setting up border for NullLsInfo like lspconfig ui

  -- Setting up null ls
  null_ls.setup({
    border = "rounded",
    debug = false,
    sources = {
      formatting.prettier.with({
        extra_filetypes = { "toml" },
        extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      }),
      formatting.black.with({
        extra_args = {"--line-lenght=120"}
      }),
      formatting.isort,
      formatting.stylua,
      formatting.google_java_format,
      diagnostics.flake8,
    },
  })
end

return {
  {
    NAME,
    dependencies = DEPENDENCIES,
    config = CONFIG,
    keys = {
      {
        "<leader>lf",
        "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
        desc = "Format",
      },
      { "<leader>ln", "<cmd>NullLsInfo<cr>", desc = "NullLsInfo" },
    },
  }
}

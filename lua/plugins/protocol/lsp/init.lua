local NAME = 'neovim/nvim-lspconfig'

local DEPENDENCIES = {
  'mason.nvim',
  'hrsh7th/cmp-nvim-lsp',
  'nvimdev/lspsaga.nvim',
}

local CONFIG = function()
  local SERVERS = require('plugins.protocol.servers')

  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      silent = true,
      border = Roccocode.ui.float.border,
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = Roccocode.ui.float.border
    }),
  }

  vim.diagnostic.config({
    virtual_text = Roccocode.lsp.virtual_text,
    float = { border = Roccocode.ui.float.border },
  })

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  -- LUA
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    handlers = handlers,
    settings = SERVERS.LUA.settings,
  })
  vim.lsp.enable("lua_ls")

  -- ESLINT
  vim.lsp.config("eslint", {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = SERVERS.ESLINT.on_attach,
    settings = SERVERS.ESLINT.settings,
  })
  vim.lsp.enable("eslint")

  -- JSON
  vim.lsp.config("jsonls", {
    capabilities = capabilities,
    handlers = handlers,
    settings = SERVERS.JSON.settings,
  })
  vim.lsp.enable("jsonls")

  -- PYTHON
  vim.lsp.config("pyright", {
    handlers = handlers,
    capabilities = capabilities,
    settings = SERVERS.PYTHON.settings,
  })
  vim.lsp.enable("pyright")

  -- CSS
  vim.lsp.config("cssls", {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = SERVERS.CSS.on_attach,
    settings = SERVERS.CSS.settings,
  })
  vim.lsp.enable("cssls")

  -- BASH
  vim.lsp.config("bashls", {
    capabilities = capabilities,
    handlers = handlers,
  })
  vim.lsp.enable("bashls")

  -- EMMET
  vim.lsp.config("emmet_ls", {
    capabilities = capabilities,
    handlers = handlers,
    filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
    init_options = {
      showexpandedabbreviation = "always",
      syntaxProfiles = {
        jsx = "html",
        tsx = "html",
      },
    },
  })

  vim.lsp.enable("emmet_ls")
end

return {
  {
    NAME,
    dependencies = DEPENDENCIES,
    lazy = false,
    config = CONFIG,
  }
}

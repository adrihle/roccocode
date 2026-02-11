local NAME = 'neovim/nvim-lspconfig'

local DEPENDENCIES = {
  'mason.nvim',
  'hrsh7th/cmp-nvim-lsp',
  'nvimdev/lspsaga.nvim',
  -- "jose-elias-alvarez/typescript.nvim",
}

local CONFIG = function()
  local typescript_ok, typescript = pcall(require, "typescript")
  local SERVERS = require('plugins.protocol.servers')

  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      silent = true,
      border = Roccocode.ui.float.border,
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = Roccocode.ui.float.border
    }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      { virtual_text = Roccocode.lsp.virtual_text }
    ),
  }

  local function on_attach() end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  -- LUA
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = SERVERS.LUA.settings,
  })
  vim.lsp.enable("lua_ls")

  -- TYPESCRIPT
  if typescript_ok then
    typescript.setup({
      disable_commands = false,
      debug = false,
      server = {
        capabilities = SERVERS.TYPESCRIPT.capabilities,
        handlers = SERVERS.TYPESCRIPT.handlers,
        on_attach = SERVERS.TYPESCRIPT.on_attach,
        settings = SERVERS.TYPESCRIPT.settings,
      },
    })
  end

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
    on_attach = on_attach,
    settings = SERVERS.JSON.settings,
  })
  vim.lsp.enable("jsonls")

  -- PYTHON
  vim.lsp.config("pyright", {
    handlers = handlers,
    on_attach = on_attach,
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
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  })
  vim.lsp.enable("bashls")

  -- EMMET
  vim.lsp.config("emmet_ls", {
    filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
    init_options = {
      showexpandedabbreviation = "always",
      syntaxProfiles = {
        jsx = "html",
        tsx = "html",
      },
    },
  })

  vim.lsp.config("dartls", {
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    init_options = {
      closingLabels = true,
      flutterOutline = true,
      onlyAnalyzeProjectsWithOpenFiles = true,
      outline = true,
      suggestFromUnimportedLibraries = true,
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
      },
    },
    on_attach = function(client, bufnr)
      -- tus keymaps, autocommands, etc.
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })

  vim.lsp.enable("emmet_ls")
end

return {
  {
    NAME,
    dependencies = DEPENDENCIES,
    servers = false,
    lazy = false,
    config = CONFIG,
    -- opts = {
    --   servers = {
    --     ts_ls = {
    --       settings = {
    --         typescript = {
    --           inlayHints = {
    --             includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
    --             includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --             includeInlayVariableTypeHints = true,
    --             includeInlayFunctionParameterTypeHints = true,
    --             includeInlayVariableTypeHintsWhenTypeMatchesName = true,
    --             includeInlayPropertyDeclarationTypeHints = true,
    --             includeInlayFunctionLikeReturnTypeHints = true,
    --             includeInlayEnumMemberValueHints = true,
    --           },
    --         },
    --         javascript = {
    --           inlayHints = {
    --             includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
    --             includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --             includeInlayVariableTypeHints = true,
    --
    --             includeInlayFunctionParameterTypeHints = true,
    --             includeInlayVariableTypeHintsWhenTypeMatchesName = true,
    --             includeInlayPropertyDeclarationTypeHints = true,
    --             includeInlayFunctionLikeReturnTypeHints = true,
    --             includeInlayEnumMemberValueHints = true,
    --           },
    --         },
    --       },
    --     },
    --   },
    --   inlay_hints = {
    --     enabled = true,
    --   },
    --   setup = {
    --     ts_ls = function(_, opts)
    --       require("typescript").setup({ server = opts })
    --       return true
    --     end,
    --   },
    -- },
  }
}

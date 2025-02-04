local NAME = 'neovim/nvim-lspconfig'

local DEPENDENCIES = {
  'mason.nvim',
  'hrsh7th/cmp-nvim-lsp',
  'nvimdev/lspsaga.nvim',
  -- "jose-elias-alvarez/typescript.nvim",
}

local CONFIG = function()
  local lspconfig = require("lspconfig")
  local typescript_ok, typescript = pcall(require, "typescript")
  local SERVERS = require('plugins.protocol.servers')

  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      silent = true,
      border = Roccocode.ui.float.border,
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = Roccocode.ui.float.border }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      { virtual_text = Roccocode.lsp.virtual_text }
    ),
  }

  local function on_attach()
    -- set up buffer keymaps, etc.
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = SERVERS.LUA.settings,
  })

  if typescript_ok then
    typescript.setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false,            -- enable debug logging for commands
      -- LSP Config options
      server = {
        capabilities = SERVERS.TYPESCRIPT.capabilities,
        handlers = SERVERS.TYPESCRIPT.handlers,
        on_attach = SERVERS.TYPESCRIPT.on_attach,
        settings = SERVERS.TYPESCRIPT.settings,
      },
    })
  end

  lspconfig.eslint.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = SERVERS.ESLINT.on_attach,
    settings = SERVERS.ESLINT.settings,
  })

  lspconfig.jsonls.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = SERVERS.JSON.settings,
  })

  lspconfig.pyright.setup({
    handlers = handlers,
    -- filetypes = { "python" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = SERVERS.PYTHON.settings,
  })

  lspconfig.cssls.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = SERVERS.CSS.on_attach,
    settings = SERVERS.CSS.settings,
  })

  lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  })
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

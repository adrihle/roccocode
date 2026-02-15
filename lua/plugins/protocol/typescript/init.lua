local NAME = 'pmizio/typescript-tools.nvim'

local DEPENDENCIES = {
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
}

local CONFIG = function()
  local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

  local filter = require("utils.functions.lsp").filter
  local filterReactDTS = require("utils.functions.lsp").filterReactDTS

  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      silent = true,
      border = Roccocode.ui.float.border,
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = Roccocode.ui.float.border }),
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return baseDefinitionHandler(err, filtered_result, method, ...)
      end

      baseDefinitionHandler(err, result, method, ...)
    end,
  }

  local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end

  require("typescript-tools").setup({
    on_attach = on_attach,
    handlers = handlers,
    settings = {
      separate_diagnostic_server = true,
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
      },
    },
  })
end

return {
  {
    NAME,
    dependencies = DEPENDENCIES,
    config = CONFIG,
    event = { "BufReadPre", "BufNewFile" },
    ft = { "typescript", "typescriptreact" },
  }
}

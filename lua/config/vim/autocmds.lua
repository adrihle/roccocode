-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })
-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })
-- Show `` in specific files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.json" },
  command = "setlocal conceallevel=0" })

if vim.lsp.inlay_hint then
  vim.lsp.inlay_hint.enable(false)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if vim.lsp.inlay_hint then
      pcall(vim.lsp.inlay_hint.enable, false, { bufnr = args.buf })
    end
  end,
})

local NAME = 'lvimuser/lsp-inlayhints.nvim'

local CONFIG = function()
  local lsp_inlay_ok, lsp_inlay = pcall(require, 'lsp-inlayhints')

  if not lsp_inlay_ok then
    return
  end

  lsp_inlay.setup({
    inlay_hints = {
      parameter_hints = {
        show = true,
        prefix = "<- ",
        separator = ", ",
        remove_colon_start = false,
        remove_colon_end = true,
      },
      type_hints = {
        -- type and other hints
        show = true,
        prefix = "",
        separator = ", ",
        remove_colon_start = false,
        remove_colon_end = false,
      },
      only_current_line = false,
      -- separator between types and parameter hints. Note that type hints are
      -- shown before parameter
      labels_separator = "  ",
      -- whether to align to the length of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- highlight group
      highlight = "LspCodeLens",
    },
    enabled_at_startup = true,
    debug_mode = false,
  })
end

return {
  {
    NAME,
    config = CONFIG,
  }
}

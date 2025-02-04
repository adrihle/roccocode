local NAME = 'folke/tokyonight.nvim'

-- auxiliar variables
local MAIN_COLOR = Roccocode.ui.colors.primary
local SECONDARY_COLOR = Roccocode.ui.colors.secondary
local NONE = "None"

local applyColorscheme = function()
  vim.cmd([[colorscheme tokyonight-storm]])
end

local applyConfig = function()
  local present, tokyonight = pcall(require, "tokyonight")
  if not present then
    return
  end

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Setup storm                                        │
  -- ╰──────────────────────────────────────────────────────────╯
  tokyonight.setup({
    style = "storm",
    transparent = true,    -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value `:help attr-list`
      comments = NONE,
      keywords = "italic",
      functions = "bold",
      variables = "italic",
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark",              -- style for sidebars, see below
      floats = "dark",                -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false,             -- dims inactive windows
    lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    on_colors = function(colors)
      colors.border = Roccocode.ui.colors.border
    end,
    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    -- on_highlights = function(highlights, colors) end,
    on_highlights = function(hl, color)
      hl.TelescopeTitle = {
        fg = SECONDARY_COLOR,
      }
      hl.TelescopeNormal = {
        bg = NONE,
        fg = NONE,
      }
      hl.TelescopeBorder = {
        bg = NONE,
        fg = MAIN_COLOR,
      }
      hl.TelescopeMatching = {
        fg = SECONDARY_COLOR,
      }
      hl.MsgArea = {
        fg = color.fg_dark,
      }
    end,
  })
end

local applyStyles = function()
  local c = require("tokyonight.colors").setup()
  -- Set Colorscheme
  -- vim.cmd("colorscheme " ..Roccocode.colorscheme)

  -- Roccocode Colors
  vim.api.nvim_set_hl(0, "RoccocodePrimary", { fg = MAIN_COLOR })
  vim.api.nvim_set_hl(0, "RoccocodeSecondary", { fg = SECONDARY_COLOR })

  vim.api.nvim_set_hl(0, "RoccocodePrimaryBold", { bold = true, fg = MAIN_COLOR })
  vim.api.nvim_set_hl(0, "RoccocodeSecondaryBold", { bold = true, fg = SECONDARY_COLOR })

  vim.api.nvim_set_hl(0, "RoccocodeHeader", { bold = true, fg = MAIN_COLOR })
  vim.api.nvim_set_hl(0, "RoccocodeHeaderInfo", { bold = true, fg = SECONDARY_COLOR })
  vim.api.nvim_set_hl(0, "RoccocodeFooter", { bold = true, fg = SECONDARY_COLOR })

  -- Tokyonight Colorscheme Specific Config
  if Roccocode.colorscheme == "tokyonight" then
    -- Lines
    vim.api.nvim_set_hl(0, "CursorLineNR", { link = "RoccocodeSecondary" })
    vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })

    -- Floats/Windows
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = NONE, fg = NONE })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = NONE, fg = MAIN_COLOR })
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = NONE, fg = MAIN_COLOR })
    vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = NONE })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "#16161e", fg = "#16161e" })
    vim.api.nvim_set_hl(0, "BqfPreviewBorder", { link = "FloatBorder" })

    -- Tree
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { bg = NONE, fg = NONE })

    -- Diagnostics

    -- Misc
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = NONE })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = NONE })
    vim.api.nvim_set_hl(0, "rainbowcol1", { fg = c.blue, ctermfg = 9 })
    vim.api.nvim_set_hl(0, "Boolean", { fg = "#F7768E" })
    vim.api.nvim_set_hl(0, "BufferOffset", { link = "RoccocodeSecondary" })

    -- Completion Menu Colors
    local highlights = {
      CmpItemAbbr = { fg = c.dark3, bg = NONE },
      CmpItemKindClass = { fg = c.orange },
      CmpItemKindConstructor = { fg = c.purple },
      CmpItemKindFolder = { fg = c.blue2 },
      CmpItemKindFunction = { fg = c.blue },
      CmpItemKindInterface = { fg = c.teal, bg = NONE },
      CmpItemKindKeyword = { fg = c.magneta2 },
      CmpItemKindMethod = { fg = c.red },
      CmpItemKindReference = { fg = c.red1 },
      CmpItemKindSnippet = { fg = c.dark3 },
      CmpItemKindVariable = { fg = c.cyan, bg = NONE },
      CmpItemKindText = { fg = "LightGrey" },
      CmpItemMenu = { fg = "#C586C0", bg = NONE },
      CmpItemAbbrMatch = { fg = "#569CD6", bg = NONE },
      CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = NONE },
    }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = c.blue0 })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end

local CONFIG = function()
  applyColorscheme()
  applyConfig()
  applyStyles()
end

return {
  NAME,
  config = CONFIG,
  lazy = false,
  priority = 1000,
}

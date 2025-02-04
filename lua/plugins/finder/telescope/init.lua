local NAME = 'nvim-telescope/telescope.nvim'

local FZF_PLUGIN = {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = "make",
}

local DEPENDENCIES = { { "nvim-lua/plenary.nvim" }, FZF_PLUGIN, { "nvim-lua/popup.nvim" }, { "gregorias/nvim-mapper" } }

local CONFIG = function()
  local telescope_setup, telescope = pcall(require, "telescope")
  if not telescope_setup then
    return
  end

  local actions_setup, actions = pcall(require, "telescope.actions")
  if not actions_setup then
    return
  end

  local previewers = require("telescope.previewers")
  local sorters = require("telescope.sorters")

  telescope.load_extension('mapper')
  telescope.load_extension('fzf')

  telescope.setup {
    defaults = {
      -- layout_config = {
      --   prompt_position = "bottom",
      --   preview_cutoff = 120,
      --   horizontal = { mirror = false },
      --   vertical = { mirror = false }
      -- },
      find_command = {
        'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
      },
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      -- layout_strategy = "horizontal",
      file_sorter = sorters.get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      path_display = {},
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      buffer_previewer_maker = previewers.buffer_previewer_maker,
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default + actions.center
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
        },
      },
    },
    extensions = {
      fzf = {
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  }
end

return {
  {
    NAME,
    lazy = false,
    dependencies = DEPENDENCIES,
    config = CONFIG,
  }
}

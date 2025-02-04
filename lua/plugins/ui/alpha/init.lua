local NAME = "goolord/alpha-nvim"

local CONFIG = function()
  local present, alpha = pcall(require, "alpha")
  if not present then
    return
  end

  local dashboard = require("alpha.themes.dashboard")
  local icons = require("utils.icons")
  local if_nil = vim.F.if_nil

  local HEADERS = require('plugins.ui.alpha.header')

  dashboard.section.header.type = "text";
  dashboard.section.header.val = HEADERS.rocco;
  dashboard.section.header.opts = {
    position = "center",
    hl = "RoccocodeHeader",
  }

  local leader = "SPC"

  --- @param sc string
  --- @param txt string
  --- @param keybind string optional
  --- @param keybind_opts table optional
  local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
      position = "center",
      shortcut = sc,
      cursor = 5,
      width = 50,
      align_shortcut = "right",
      hl_shortcut = "RoccocodePrimary",
    }
    if keybind then
      keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
      opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
      -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
      local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
      vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
      type = "button",
      val = txt,
      on_press = on_press,
      opts = opts,
    }
  end

  dashboard.section.buttons.val = {
    button("SPC s h", icons.fileRecent .. " " .. "Recents", "<cmd>Telescope oldfiles hidden=true<CR>", {}),
    button("SPC / u", icons.container .. " " .. "Update Plugins", "<cmd>Lazy update<CR>", {}),
    button("SPC / i", icons.container .. " " .. "Manage Plugins", "<cmd>Lazy<CR>", {}),
    button("SPC / c", icons.cog .. " " .. "Settings", "<cmd>e $MYVIMRC<CR>", {}),
    button("-", icons.exit .. " " .. "Exit", "<cmd>exit<CR>", {}),
  }

  local function footer()
    local plugins = require("lazy").stats().count
    local v = vim.version()
    local roccocode_version = Roccocode._VERSION
    return string.format(" v%d.%d.%d  " .. icons.container .. "%d  " .. " %s ", v.major, v.minor, v.patch, plugins,
      roccocode_version)
  end

  dashboard.section.footer.val = {
    footer()
  }
  dashboard.section.footer.opts = {
    position = "center",
    hl = "RoccocodeFooter",
  }

  local section = {
    header = dashboard.section.header,
    buttons = dashboard.section.buttons,
    footer = dashboard.section.footer,
  }

  local opts = {
    layout = {
      { type = "padding", val = 3 },
      section.header,
      { type = "padding", val = 1 },
      section.hi_top_section,
      section.hi_middle_section,
      section.hi_bottom_section,
      { type = "padding", val = 2 },
      section.buttons,
      { type = "padding", val = 3 },
      section.footer,
    },
    opts = {
      margin = 5
    },
  }

  alpha.setup(opts)

  vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = "alpha_tabline",
    pattern = "alpha",
    command = "set showtabline=0 laststatus=0 noruler",
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = "alpha_tabline",
    pattern = "alpha",
    callback = function()
      vim.api.nvim_create_autocmd("BufUnload", {
        group = "alpha_tabline",
        buffer = 0,
        command = "set showtabline=2 ruler laststatus=3",
      })
    end,
  })
end

return {
  {
    NAME,
    config = CONFIG,
    lazy = false,
  },
}

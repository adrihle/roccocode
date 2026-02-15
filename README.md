# ROCCO.CODE

![ROCCO.CODE Logo](https://res.cloudinary.com/dlj66ezaw/image/upload/v1738702597/PORTFOLIO/projects/ad1stpu3e9hejlvizg15.avif)

A personal Neovim setup focused on speed, clarity, and low-friction coding.

- Fast startup with `lazy.nvim`
- Modern LSP stack (`nvim-lspconfig`, `typescript-tools.nvim`, `none-ls.nvim`)
- Practical UI + keymaps for daily web/backend work
- Hybrid AI workflow with `opencode.nvim` (external session + per-project float)

## Why this config exists

This is not a "collect every plugin" config. It is intentionally curated to stay fast, stable, and useful in real projects.

The goal is simple: keep your hands on the keyboard and your attention on the code.

## Stack overview

- **Plugin manager:** `lazy.nvim`
- **LSP:** native Neovim LSP + `nvim-lspconfig`
- **TypeScript:** `pmizio/typescript-tools.nvim`
- **Formatting/lint integration:** `nvimtools/none-ls.nvim` + `mason-null-ls.nvim`
- **Syntax/highlighting:** Treesitter
- **Finder:** Telescope
- **UI:** Tokyonight, Lualine, NvimTree, Notify, Snacks
- **AI:** `opencode.nvim` with hybrid mode support

## Installation

```sh
# Backup existing Neovim config (optional)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repo
git clone https://github.com/adrihle/roccocode.git ~/.config/nvim

# Install and sync plugins
nvim +Lazy\ sync +qall
```

## First-run checks

```sh
# Basic startup validation
nvim --headless +qa

# Optional health checks
nvim --headless '+checkhealth lspconfig' '+checkhealth opencode' '+qa'
```

## Keymaps you will actually use

- `<leader>fm` -> open keymap index (`nvim-mapper`)
- `<leader>lf` -> format current buffer
- `<leader>la` -> code actions
- `<leader>ot` -> toggle/connect Opencode session
- `<leader>oa` -> ask Opencode with current context (`@this`)
- `<leader>oe` -> explain selected code

## Opencode workflow (hybrid)

This config supports two AI interaction modes:

1. **External server mode** (great for your main project)
   - Start Opencode in a dedicated terminal tab.
   - Open Neovim with `OPENCODE_PORT` exported for that instance.
2. **Floating local mode** (great for secondary projects)
   - Open Neovim normally (without `OPENCODE_PORT`).
   - `<leader>ot` opens Opencode in a floating terminal via Snacks.

This gives you strong per-project isolation while keeping a powerful external workflow for deep sessions.

## Project structure

- `init.lua` -> entry point
- `lua/config` -> core settings and globals (`Roccocode`)
- `lua/plugins` -> plugin specs grouped by domain (`core`, `ui`, `protocol`, `finder`, `git`, `ai`)
- `lua/keybinds` -> editor-level keymaps
- `lua/utils` -> shared Lua helpers

## Preview

![Screenshot 1](https://res.cloudinary.com/dlj66ezaw/image/upload/v1738702819/PORTFOLIO/projects/nu1gexuiwvanbau5ktzy.png)

## Contributing

Issues and PRs are welcome.

If you want to propose changes, keep them focused and aligned with the core principle: performance + clarity over feature bloat.

## License

MIT.

---

Dedicated to Rocco. Always watching, always inspiring.

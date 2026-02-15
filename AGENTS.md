# AGENTS.md

Operational guide for agentic coding assistants working in this Neovim config.

## Scope and intent
- Repository type: personal Neovim configuration written in Lua.
- Entry point: `init.lua`.
- Main code roots: `lua/config`, `lua/plugins`, `lua/keybinds`, `lua/utils`.
- Plugin manager: `lazy.nvim` (bootstrapped in `lua/plugins/init.lua`).
- No formal CI workflow files are present in `.github/workflows/`.

## Quick project map
- `init.lua`: loads config, plugins, and keybinds.
- `lua/config/init.lua`: loads `config.vim` and `config.roccocode`.
- `lua/config/Roccocode.lua`: global user settings table (`Roccocode`).
- `lua/plugins/init.lua`: lazy bootstrap and plugin registration.
- `lua/plugins/**/init.lua`: plugin specs and setup functions.
- `lua/utils/functions/*.lua`: small shared utilities.
- `install/run.sh`: helper shell script for Homebrew setup.

## Build / lint / test commands

### Baseline bootstrap and sync
- Install/sync plugins (documented in `README.md`):
  - `nvim +Lazy\ sync +qall`
- Headless equivalent (useful for automation):
  - `nvim --headless "+Lazy! sync" +qa`

### "Build" checks for this repo
- There is no dedicated compile/build pipeline for this Lua config.
- Practical validation command:
  - `nvim --headless +qa`
- This confirms startup does not crash during module loading.

### Lint and formatting
- No repo-local lint config (`.luacheckrc`, `selene.toml`) is present.
- Formatting is configured through `none-ls` + external tools in Neovim:
  - `stylua` for Lua
  - `prettier` for web formats
  - `black`/`isort` for Python
- In-editor format keymaps exist (`<leader>lf`, `<leader>fm`).
- Optional CLI formatting for changed Lua files (if `stylua` is installed):
  - `stylua lua init.lua`

### Test status
- There is no committed automated test suite in this repo right now.
- No `tests/` directory or `*_spec.lua` files are present.

### Running a single test (important)
- Current state: not applicable until tests are added.
- If future tests use Plenary/Busted, a single test file command is typically:
  - `nvim --headless -c "PlenaryBustedFile tests/path/to/file_spec.lua" +qa`
- If using plain Busted directly, common single-file form is:
  - `busted tests/path/to/file_spec.lua`
- Before assuming either command, confirm the chosen test harness exists in the repo.

## Code style guidelines inferred from this codebase

### Lua module structure
- Prefer one module per file returning a table.
- Common pattern:
  - local constants at top
  - local `CONFIG = function() ... end`
  - final `return { ... }` plugin spec or exported table
- Keep setup side effects inside config/setup functions where possible.

### Imports and requires
- Use `local X = require('module.path')` at top for required modules.
- Use `pcall(require, 'module')` for optional dependencies that may be missing.
- On optional dependency failure, return early without throwing.
- Match existing quote style per file (predominantly single quotes in local modules).

### Naming conventions
- Uppercase locals for pseudo-constants: `NAME`, `DEPENDENCIES`, `CONFIG`.
- Lower snake_case for ordinary locals and table fields.
- Module tables often use uppercase identifiers when treated as namespaces (`TABLES`, `MAPPER`).
- Keymap IDs are descriptive and kebab-like via helper concatenation.

### Formatting and layout
- Indentation is 2 spaces.
- Trailing commas are commonly used in multiline tables.
- Keep tables vertically aligned only when already present; do not over-align new code.
- Prefer short, focused local functions over deeply nested inline logic.
- Avoid unnecessary comments; keep comments for non-obvious behavior.

### Types and contracts
- There are no Lua type annotations enforced in this repo.
- Use runtime guards/assertions for function contracts when helpful.
- Existing pattern for defensive checks:
  - `assert(type(x) == "table", "...")`

### Error handling and resilience
- Prefer fail-soft behavior for plugin-dependent features:
  - guard with `pcall`
  - return early on failure
- Do not hard-fail startup for optional UI tooling.
- Keep diagnostics and formatting behavior configurable through `Roccocode`.

### Plugin configuration conventions
- Plugin specs are grouped by domain under `lua/plugins/<domain>/`.
- Each plugin module tends to expose a lazy spec table.
- Declare `dependencies`, `keys`, `cmd`, and `config` explicitly.
- Use shared global config (`Roccocode`) rather than hardcoding repeated values.

### Keymaps and commands
- Prefer central mapping helper utilities under `lua/utils/functions/mapping.lua`.
- Include map metadata where possible (`id`, `description`, `category`).
- Reuse constants for repeated key sequences/commands.

### Globals and shared state
- `Roccocode` is intentionally global and acts as central settings.
- Avoid introducing new globals unless matching an established pattern.
- For utility modules, prefer `local M = {}` + `return M` (or existing repo pattern).

### File and folder naming
- Keep new Lua modules within existing domain layout.
- Follow current naming style for plugin files:
  - `init.lua` for module entry
  - feature-specific files like `keymap.lua`, `on_attach.lua`

## Agent workflow recommendations for this repo
- Read `init.lua` and `lua/plugins/init.lua` first to understand load order.
- When adding plugin behavior, update the relevant domain folder only.
- Preserve existing keybinding patterns and helper usage.
- Prefer minimal, targeted edits over broad refactors.
- Validate with `nvim --headless +qa` after any structural change.

## Cursor and Copilot instruction files
- Checked `.cursor/rules/**`: not present.
- Checked `.cursorrules`: not present.
- Checked `.github/copilot-instructions.md`: not present.
- Therefore, there are currently no additional Cursor/Copilot-specific rule files to mirror.

## Known caveats to keep in mind
- `lua/config/init.lua` requires `config.roccocode` while file is `Roccocode.lua`.
- This works on case-insensitive filesystems but can break on case-sensitive setups.
- Be cautious when renaming/moving files with case-only changes.

## Change checklist for agents
- Keep edits ASCII unless file already requires Unicode glyphs.
- Avoid destructive git operations.
- Do not add new tooling configs unless requested.
- If introducing tests, also document exact run commands in this file.
- If adding lint tools, include both full-run and single-file commands.

## Minimum command set to remember
- `nvim +Lazy\ sync +qall`
- `nvim --headless "+Lazy! sync" +qa`
- `nvim --headless +qa`
- `stylua lua init.lua` (optional; only if `stylua` is installed)

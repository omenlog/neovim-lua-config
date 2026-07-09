# Neovim config

Personal Neovim configuration organized around a small core and modular plugin specs.

## Structure

```text
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    ├── plugins
    │   └── *.lua
    └── snippets
```

## Layout

- `init.lua`
  - entry point
  - loads core options and keymaps
  - sets the auto-reload/checktime autocmd
  - boots the plugin system

- `lua/config/options.lua`
  - editor options
  - UI behavior
  - global settings

- `lua/config/keymaps.lua`
  - custom keybindings
  - navigation, buffers, tooling, and picker shortcuts

- `lua/config/lazy.lua`
  - bootstraps `lazy.nvim`
  - sets runtime paths
  - loads plugin specs from `lua/plugins`

- `lua/plugins/`
  - one file per plugin or feature area
  - each file returns a lazy.nvim spec
  - plugin configuration is kept local to the relevant module

- `lua/snippets/`
  - custom snippet definitions

- `lazy-lock.json`
  - plugin lockfile for reproducible installs

## Notes

- Plugin choices may change over time; the main convention is to keep the config modular.
- New functionality should generally be added in `lua/plugins/` or one of the `lua/config/` files, depending on whether it is plugin-specific or core editor behavior.

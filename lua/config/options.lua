-- Disable unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.lazygit_floating_window_scaling_factor = 1.0

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Highlight current line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- set autoread
vim.opt.autoread = true

vim.opt.updatetime = 200

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Clipboard
vim.opt.clipboard = "unnamed"

-- Leader Key
vim.g.mapleader = " "

-- gui colors
vim.opt.termguicolors = true

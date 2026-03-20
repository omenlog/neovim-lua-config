-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

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


require("config.keymaps")
require("config.lazy")

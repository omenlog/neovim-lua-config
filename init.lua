-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Clipboard
vim.opt.clipboard = "unnamed"

-- Leader Key
vim.g.mapleader = " "

-- gui colors
vim.opt.termguicolors = true


require("config.keymaps")
require("config.lazy")

local set = vim.opt
local global = vim.g

set.number = true
set.termguicolors = true
set.swapfile = false 
set.backup = false
set.tabstop = 4
set.smartindent = true
set.shiftwidth = 4
set.diffopt="vertical"
set.cmdheight = 2
set.expandtab = true
set.smarttab = true
set.foldmethod="indent"

-- Setting AutoSave when the Neovim lost focus
vim.api.nvim_command('autocmd FocusLost * silent update')

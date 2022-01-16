local set = vim.opt

set.number = true
set.termguicolors = true
set.swapfile = false 
set.backup = false
set.tabstop = 2
set.smartindent = true
set.shiftwidth = 2
set.diffopt="vertical"
set.cmdheight = 2
set.foldmethod="indent"
-- Setting AutoSave when the Neovim lost focus
vim.api.nvim_command('autocmd FocusLost * silent update')

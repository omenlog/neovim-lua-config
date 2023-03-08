local set = vim.opt

-- line numbers
set.number = true
set.relativenumber = true

-- appearance
set.termguicolors = true

-- swap and backup files
set.swapfile = false
set.backup = false

-- tab and identation
set.tabstop = 4
set.shiftwidth = 4
set.smartindent = true
set.expandtab = true
set.smarttab = true

-- line wrapping
set.wrap = false

-- searching 
set.ignorecase = true
set.smartcase = true
set.hlsearch = false

-- folding 
set.foldmethod = "indent"
set.foldenable = false

-- clipboard
set.clipboard = "unnamed"

-- mouse support
set.mouse = "a"

-- split windows
set.splitright = true
set.splitbelow = true

-- command bar
vim.o.ls = 0;
vim.o.ch = 0;
set.cmdheight = 2

set.diffopt = "vertical"
set.laststatus = 3
vim.o.updatetime = 500


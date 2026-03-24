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

local auto_reload_external = vim.api.nvim_create_augroup("auto_reload_external", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained", "VimResume" }, {
	group = auto_reload_external,
	callback = function()
		if vim.bo.buftype == "" and vim.fn.mode() ~= "c" then
			vim.cmd("silent! checktime")
		end
	end,
})



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

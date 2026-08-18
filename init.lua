require("config.options")

-- Define leaders before lazy.nvim loads plugin mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v", "o" }, "<Space>", "<Nop>", { silent = true })

-- loading lazy plugin manager
require("config.lazy")

require("config.keymaps")

local auto_reload_external = vim.api.nvim_create_augroup("auto_reload_external", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained", "VimResume" }, {
	group = auto_reload_external,
	callback = function()
		if vim.bo.buftype == "" and vim.fn.mode() ~= "c" then
			vim.cmd("silent! checktime")
		end
	end,
})

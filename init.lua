require("options")
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

require("config.lazy")

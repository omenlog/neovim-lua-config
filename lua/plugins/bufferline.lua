return {
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
	config = function ()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				numbers = "ordinal",
				style_preset = {
					bufferline.style_preset.minimal,
					bufferline.style_preset.no_italic,
				},
			}
		})

		local function match_buffer_bg()
			local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
			if not normal or not normal.bg then
				return
			end

			for _, group in ipairs(vim.fn.getcompletion("BufferLine", "highlight")) do
				local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
				if ok and hl then
					hl.bg = normal.bg
					vim.api.nvim_set_hl(0, group, hl)
				end
			end
		end

		local augroup = vim.api.nvim_create_augroup("BufferLineMatchBufferBg", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = augroup,
			pattern = "*",
			callback = match_buffer_bg,
		})
		match_buffer_bg()
	end
}
}

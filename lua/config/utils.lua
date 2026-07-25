local M = {}

function M.copy_ref(options)
	local path = vim.fn.expand("%:.")
	local result = path

	if options.visual == true then
		local start_line = vim.fn.line("v")
		local end_line = vim.fn.line(".")

		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end

		result = path .. ":" .. start_line .. ":" .. end_line
		vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
	end

	vim.ui.input({ prompt = "Prompt (optional): " }, function(note)
		note = note or ""

		if note ~= "" then
			result = result .. " " .. note
		end

		vim.fn.setreg("+", result)
		vim.notify("Copied: " .. result)
	end)
end

return M

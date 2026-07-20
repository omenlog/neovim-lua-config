local M = {}

function M.copy_ref(options)
	local path   = vim.fn.expand("%:.")
	local result = path

	if options.visual == true then
		-- v is the line where the visual mode started this is the anchor
		local start_line = vim.fn.line("v")

		-- this is the line where the cursor is at the moment
		local end_line = vim.fn.line(".")

		-- this means the selection was madem upward invert the numbers
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end

		-- now append the range to the result
		result = path .. ":" .. start_line .. ":" .. end_line

		-- exit visual mode
		vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
	end

	local note = vim.fn.input("Prompt (optional): ")
	if note ~= "" then
		-- append note to the result using an space as separator
		result = result .. " " .. note
	end

	-- adding result to the system clipboard which is + register
	vim.fn.setreg('+', result)

	-- showing a message that the text was added to the clipboard
	vim.notify("Copied: " .. result)
end

return M

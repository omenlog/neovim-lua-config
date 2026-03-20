return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		event = "BufReadPre",
		config = function()
			require("git-conflict").setup({
				default_mappings = false,
				disable_diagnostics = false,
			})

			local group = vim.api.nvim_create_augroup("GitConflictDiagnostics", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "GitConflictDetected",
				callback = function()
					local bufnr = vim.api.nvim_get_current_buf()
					vim.diagnostic.enable(false, { bufnr = bufnr })
				end,
			})
			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "GitConflictResolved",
				callback = function()
					local bufnr = vim.api.nvim_get_current_buf()
					vim.diagnostic.enable(true, { bufnr = bufnr })
				end,
			})
		end,
		keys = {
			{ "<leader>co", "<cmd>GitConflictChooseOurs<CR>", desc = "Conflict: accept current (ours)" },
			{ "<leader>ct", "<cmd>GitConflictChooseTheirs<CR>", desc = "Conflict: accept incoming (theirs)" },
			{ "<leader>cb", "<cmd>GitConflictChooseBoth<CR>", desc = "Conflict: accept both" },
			{ "<leader>c0", "<cmd>GitConflictChooseNone<CR>", desc = "Conflict: accept none" },
			{ "]x", "<cmd>GitConflictNextConflict<CR>", desc = "Conflict: next" },
			{ "[x", "<cmd>GitConflictPrevConflict<CR>", desc = "Conflict: previous" },
		},
	},
}

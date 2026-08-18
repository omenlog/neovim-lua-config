return {
	{
		"folke/snacks.nvim",
		lazy = false,
		opts = {
			input = { enabled = true },
			indent = { enabled = true, animate = { enabled = false } },
			lazygit = {
				-- Hide (rather than quit) the terminal before opening the file.
				-- <leader>g then restores the same LazyGit session and hunk.
				config = {
					os = {
						edit =
						'nvim --server "$NVIM" --remote-send "<C-\\\\><C-n>q" && nvim --server "$NVIM" --remote-tab {{filename}}',
						editAtLine =
						'nvim --server "$NVIM" --remote-send "<C-\\\\><C-n>q" && nvim --server "$NVIM" --remote-tab {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>"',
					},
				},
				win = {
					width = 0,
					height = 0
				},
			},
		},
	},
}

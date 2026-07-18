return {
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup({
				pickers = {
					find_files = {
						hidden = true,
						find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' },
					}
				},
			})
		end,
	},
}

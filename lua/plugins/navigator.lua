return {
	{
		'omenlog/neovim-navigator',
		lazy = false,
		config = function()
			require("navigator").setup()
		end
	},
}

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false
				}
			})
		end
	},
	{
		"EdenEast/nightfox.nvim", name = "carbonfox", priority = 1000
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = { "carbonfox", "catppuccin", "rose-pine" }
				-- add the config here
			})
		end
	}
}

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
			config = function()
				require("catppuccin").setup({
					integrations = {
						treesitter = true,
					},
					custom_highlights = function(colors)
						return {
							["@tag"] = { fg = colors.blue },
							["@tag.attribute"] = { fg = colors.teal },
							["@tag.delimiter"] = { fg = colors.sky },
						}
					end,
				})
			end,
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

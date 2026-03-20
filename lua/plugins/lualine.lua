return {
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() 
			require('lualine').setup({
				  sections = {
						lualine_c = {
							function()
								local ok, oil = pcall(require, "oil")
								if ok then
									local dir = oil.get_current_dir()
									if dir then
										return vim.fn.fnamemodify(dir, ":.")
									end
								end
								return vim.fn.expand('%:.')
							end
						}
				}
			})
		end
}
}

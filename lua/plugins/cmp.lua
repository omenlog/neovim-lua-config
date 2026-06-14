return {
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = {
				preset = "super-tab",
				["<CR>"] = { "accept", "fallback" },
			},
			snippets = { preset = "luasnip", score_offset = 5 },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = true },
			},
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
			},
		},
		opts_extend = { "sources.default" },
	},
}

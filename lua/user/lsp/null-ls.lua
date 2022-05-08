local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
        formatting.stylua,
		formatting.eslint_d,
        --
        -- Eslint diagnostics
		diagnostics.eslint_d.with({
            filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
            extra_args = {"--config", ".eslintrc"}
        }),
        diagnostics.tsc.with({
            prefer_local = "node_modules/.bin"
        }),
		diagnostics.stylelint.with({
            extra_args = {"--config" ,""},
            prefer_local = "node_modules/.bin"
		})
	},
})

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
        --
        -- Eslint formatting
		formatting.eslint_d.with({
			filetypes = {"javascript", "javascriptreact"},
			extra_args = {"--fix"}
		}),
		formatting.eslint_d.with({
			filetypes = {"typescript", "typescriptreact"},
      extra_args = { "--no-eslintrc","--config", "ts.eslint.json" },
			condition = function(utils)
				return utils.root_has_file({"ts.eslint.json"})
			end
		}),
        --
        -- Eslint diagnostics
		diagnostics.eslint_d.with({
			filetypes = {"javascript", "javascriptreact"}
		}),
		diagnostics.eslint_d.with({
			filetypes = {"typescript", "typescriptreact"},
            extra_args = { "--no-eslintrc","--config", "ts.eslint.json" },
			condition = function(utils)
				return utils.root_has_file({"ts.eslint.json"})
			end
		}),
		diagnostics.stylelint.with({
            extra_args = {"--config" ,""},
            prefer_local = "node_modules/.bin"
		})
	},
})

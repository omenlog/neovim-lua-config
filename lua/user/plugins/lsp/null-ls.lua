local null_ls_setup, null_ls = pcall(require, "null-ls")
if not null_ls_setup then
    print('null-ls not found')
    return
end

-- formatting
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d
    }
})

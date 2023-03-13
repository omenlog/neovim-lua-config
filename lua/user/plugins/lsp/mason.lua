local mason_setup, mason = pcall(require, 'mason')
if not mason_setup then 
    print('mason not found')
    return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then 
    print('mason lsp config not found')
    return
end

mason.setup({})

mason_lspconfig.setup {
    ensure_installed = { "lua_ls", "tsserver" }
}

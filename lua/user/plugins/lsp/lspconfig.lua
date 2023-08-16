local lspconfig_status, lsp_config = pcall(require, "lspconfig")
if (not lspconfig_status) then
    print('lsp config not found')
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

local navbuddy_setup, navbuddy = pcall(require, "nvim-navbuddy")
if not navbuddy_setup then
    print('nav buddy not found')
    return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>co', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Attach nav buddy
    navbuddy.attach(client, bufnr)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    -- lsp formatting
    vim.keymap.set('n', '<leader>f', "<cmd>lua vim.lsp.buf.format()<CR>", opts)

    -- lsp saga keymap
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
    vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)   -- show  diagnostics for line   vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

    -- typescript specific keymaps (e.g. rename file and update imports)
    if client.name == "tsserver" then
        vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")      -- rename file and update imports
        vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
        vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")    -- remove unused variables (not in youtube nvim video)
    end

    if client.name == 'ocamllsp' then
        vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
    end

    -- if client.server_capabilities.documentFormattingProvider then
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --         group = vim.api.nvim_create_augroup("Format", { clear = true }),
    --         buffer = bufnr,
    --         callback = function() vim.lsp.buf.formatting_seq_sync() end
    --     })
    -- end

    -- vim.api.nvim_create_autocmd("CursorHold", {
    --     buffer = bufnr,
    --     callback = function()
    --         local opts_ = {
    --             focusable = false,
    --             close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --             border = 'rounded',
    --             source = 'always',
    --             prefix = ' ',
    --             scope = 'cursor',
    --         }
    --
    --         vim.diagnostic.open_float(nil, opts_)
    --         -- if diagnostic_result == nil then
    --         --     print('executing hover')
    --         --     vim.lsp.buf.hover()
    --         -- end
    --     end
    -- })
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- servers configuration
lsp_config.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    }
}

lsp_config.ocamllsp.setup({
    name = 'ocamllsp',
    cmd = { 'ocamllsp' },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = lsp_config.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project",
        "dune-workspace"),
    capabilities = capabilities,
    on_attach = on_attach,
    -- settings = {
    --     ocamllsp = {
    --         diagnostics = {
    --             on_open = true,
    --             on_change = true,
    --             on_save = true
    --         },
    --         debounce = 200
    --     }
    -- }
})

typescript.setup({
    server = {
        capabilities = capabilities,
        single_file_support = false,
        on_attach = on_attach,
        root_dir = lsp_config.util.root_pattern("package.json")
    }
})

lsp_config.denols.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc")
}

lsp_config.astro.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp_config.tailwindcss.setup {}

-- vim.diagnostic.config({
--     virtual_text = {
--         prefix = "●"
--     },
--     signs = true,
--     update_in_insert = true,
--     underline = false,
--     severity_sort = true,
--     float = {
--         border = "rounded",
--         source = "always",
--         header = "",
--         prefix = "",
--     },
-- })
--
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         underline = false,
--         update_in_insert = true,
--         virtual_text = { spacing = 4, prefix = "●" },
--         severity_sort = true,
--     })

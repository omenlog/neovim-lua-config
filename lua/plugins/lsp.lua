return {
  -- Mason (LSP installer)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridge mason <-> lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",        -- TypeScript / JavaScript
          "eslint",       -- ESLint diagnostics for JS/TS
          "html",
          "cssls",
          "tailwindcss",
          "jsonls",
        },
      })
    end,
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-lspconfig.nvim",
    },
    config = function()
      -- 👇 connect completion capabilities with LSP
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_blink, blink = pcall(require, "blink.cmp")
      if has_blink and blink.get_lsp_capabilities then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      -- 🔑 keymaps (applied when LSP attaches)
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>ai", function()
          vim.lsp.buf.code_action({
            apply = true,
            context = { only = { "source.addMissingImports.ts" } },
          })
        end, opts)
        vim.keymap.set("n", "<leader>oi", function()
          vim.lsp.buf.code_action({
            apply = true,
            context = { only = { "source.organizeImports.ts" } },
          })
        end, opts)
      end

      -- setup handlers were removed in mason-lspconfig; configure servers directly.
      local default_servers = { "ts_ls", "html", "cssls", "tailwindcss", "jsonls" }
      for _, server_name in ipairs(default_servers) do
        local config = {
          capabilities = capabilities,
          on_attach = on_attach,
        }

        if server_name == "ts_ls" then
          config.init_options = {
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
            },
          }
        end

        vim.lsp.config(server_name, config)
        vim.lsp.enable(server_name)
      end

      -- ESLint (catches no-undef and other lint diagnostics in JS/TS files)
      vim.lsp.config("eslint", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("eslint")

      -- ✨ custom config for Lua (Neovim)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")
    end,
  },
}

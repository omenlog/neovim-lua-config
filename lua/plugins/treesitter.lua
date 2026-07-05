return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local web_filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "astro",
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = web_filetypes,
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}

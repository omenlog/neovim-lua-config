return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
    opts = {
      focus = true,
    },
    init = function()
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_text = {
          spacing = 2,
          source = "if_many",
          prefix = "●",
          severity = { min = vim.diagnostic.severity.WARN },
        },
      })
    end,
  },
}

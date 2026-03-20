return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>dv",
        "<cmd>DiffviewOpen<cr>",
        mode = "n",
        desc = "Open Diffview",
      },
    },
    opts = {},
  },
}

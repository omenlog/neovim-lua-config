return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      opencode = function()
        return require("codecompanion.adapters").extend("acp", {
          name = "opencode",
          env = {
            url = "http://localhost:4096", -- OpenCode server
          },
        })
      end,
    },

    strategies = {
      chat = {
        adapter = "opencode",
      },
      inline = {
        adapter = "opencode",
      },
    },
  },
}

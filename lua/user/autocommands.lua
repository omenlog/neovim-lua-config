local api = vim.api

-- Save files on focus lost
api.nvim_create_autocmd("FocusLost", {
    command = "silent! update",
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({timeout = 1000})",
})

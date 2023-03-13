local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
    print('telescope not found')
end

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules" }
    },
})

telescope.load_extension('fzf')

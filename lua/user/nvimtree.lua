local status, nvim_tree = pcall(require, 'nvim-tree')

if not status then
    print('nvim-tree not found')
    return
end

-- recommended settings from the official documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    -- disable_netrw       = true,
    -- hijack_netrw        = true,
    -- open_on_setup       = false,
    -- ignore_ft_on_setup  = {},
    -- auto_close          = false,
    -- open_on_tab         = false,
    -- hijack_cursor       = false,
    -- update_cwd          = false,
    -- update_to_buf_dir   = {
    --     enable = true,
    --     auto_open = true,
    -- },
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                },
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    diagnostics         = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    -- update_focused_file = {
    --     enable      = false,
    --     update_cwd  = false,
    --     ignore_list = {}
    -- },
    -- system_open         = {
    --     cmd  = nil,
    --     args = {}
    -- },
    -- filters             = {
    --     dotfiles = false,
    --     custom = {}
    -- },
    -- git                 = {
    --     enable = true,
    --     ignore = true,
    --     timeout = 500,
    -- },
    -- view                = {
    --     width = 30,
    --     height = 30,
    --     hide_root_folder = false,
    --     side = 'left',
    --     auto_resize = false,
    --     mappings = {
    --         custom_only = false,
    --         list = {}
    --     },
    --     number = false,
    --     relativenumber = false,
    --     signcolumn = "yes"
    -- },
    -- trash               = {
    --     cmd = "trash",
    --     require_confirm = true
    -- }
})

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split screen
keymap("n", "<C-]>", ":vsplit<CR>", opts)
keymap("n", "<C-[>", ":split<CR>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Toggle File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle <CR>", opts)

-- Ctrl + S to save
keymap("i", "<C-s>", "<ESC>:w<CR>", opts);
keymap("n", "<C-s>", ":w<CR>", opts);

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Ctrl+P to launch Telescope find_files
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = false}))<cr>" ,opts)


-- Move text u and down in Normal mode 
keymap("n", "∆", ":m .+1<CR>==", opts)
keymap("n", "˚", ":m .-2<CR>==", opts)

-- Move text u and down in Visual mode 
keymap("v", "∆", ":m .+1<CR>==", opts)
keymap("v", "˚", ":m .-2<CR>==", opts)

-- Move text u and down in Visual Block mode 
keymap("x", "∆", ":m '>+1<CR>gv=gv", opts)
keymap("x", "˚", ":m '<-2<CR>gv=gv", opts)

-- Trouble keymaps
keymap("n","<C-d>",":Trouble document_diagnostics<CR>",opts);
keymap("n","∂",":TroubleClose <CR>",opts);

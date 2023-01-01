local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

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

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Ctrl+P to launch Telescope find_files
keymap("n", "<C-p>", ":Telescope find_files<CR>" ,opts)
keymap("n", "<leader>s", ":Telescope live_grep<CR>" ,opts)

-- Buffers keymaps
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bd<CR>", opts)
keymap("n", "<C-b>", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>1",":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2",":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3",":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4",":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5",":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6",":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7",":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8",":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9",":BufferLineGoToBuffer 9<CR>", opts)

-- Move text u and down in Normal mode 
keymap("n", "∆", ":m .+1<CR>==", opts)
keymap("n", "˚", ":m .-2<CR>==", opts)

-- Move text u and down in Visual mode 
keymap("v", "∆", ":m .+1<CR>==", opts)
keymap("v", "˚", ":m .-2<CR>==", opts)

-- Move text u and down in Visual Block mode 
keymap("x", "∆", ":m '>+1<CR>gv=gv", opts)
keymap("x", "˚", ":m '<-2<CR>gv=gv", opts)

-- Duplicate a block of code in visual mode
keymap("v", "<S-d>", ":'<,'>t'><CR>", opts)

-- Add ; at the end of the line with <Opt-;>k
keymap("n", "…", "A;<ESC>", opts)
keymap("i", "…", "<ESC>A;<ESC>", opts)

-- Trouble keymaps
keymap("n","∂",":TroubleToggle document_diagnostics<CR>",opts);

-- Git keymaps
keymap("n","∫",":Git blame<CR>",opts);
keymap("n","<leader>g",":LazyGit <CR>",opts);

-- Luasnip keymaps
keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap("i", "<C-p>", "<Plug>luasnip-previous-choice", {})
keymap("s", "<C-p>", "<Plug>luasnip-previous-choice", {})

-- Folding keymaps
keymap('n', "<leader><leader>","za", {})

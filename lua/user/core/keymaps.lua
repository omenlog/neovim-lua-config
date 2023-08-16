local opts = { noremap = true, silent = true }

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

keymap('i', "jj", '<ESC>:w<CR>', opts);
keymap('i', "kk", '<ESC>:w<CR>', opts);

-- code navigation
keymap("n", "<leader>cn", ":Navbuddy<CR>", opts)

-- buffer keymaps
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts)
keymap("n", "<leader>w", ":close<CR>", opts)

-- Better vertical movement
keymap("n", "<leader>d", "<C-d>zz", opts)
keymap("n", "<leader>u", "<C-u>zz", opts)

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

-- Save keymaps
keymap("n", "<leader>s", ":w<CR>", opts);
--
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
keymap("n", "<leader>p", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fw", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Buffers keymaps
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bd<CR>", opts)
keymap("n", "<C-b>", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)

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
keymap("n", "<leader>;", "A;<ESC>", opts)

-- Git keymaps
keymap("n", "∫", ":Git blame<CR>", opts);
keymap("n", "<leader>g", ":LazyGit <CR>", opts);

-- Luasnip keymaps
keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap("i", "<C-p>", "<Plug>luasnip-previous-choice", {})
keymap("s", "<C-p>", "<Plug>luasnip-previous-choice", {})

-- Folding keymaps
keymap('n', "<leader><leader>", "za", {})

-- tooling keymaps
keymap('n', "<leader>t", ":!npm run jest:update %<CR>", {})
keymap('n', "<leader>td", ":!deno test<CR>", {})

-- Peek Markdown keymap
keymap('n', "<leader>mp", "<cmd>lua require('peek').open()<CR>", {})

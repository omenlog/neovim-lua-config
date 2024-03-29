local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins

    -- Colorschemes
    use 'tomasr/molokai'
    use 'dracula/vim'
    use 'gosukiwi/vim-atom-dark'
    use 'tomasiser/vim-code-dark'
    use 'bluz71/vim-nightfly-guicolors'
    use 'yonlu/omni.vim'
    use 'navarasu/onedark.nvim'
    use 'rose-pine/neovim'
    use 'ishan9299/nvim-solarized-lua'
    use 'folke/tokyonight.nvim'
    use 'Mofiqul/vscode.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })


    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require 'nvim-tree'.setup {} end
    }

    -- Buffers Tools
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

    -- Git integration
    use "kdheepak/lazygit.nvim"
    use "mhinz/vim-signify"
    use "f-person/git-blame.nvim"

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Syntax highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- Autocompletion
    use {
        "hrsh7th/nvim-cmp", -- The completion plugin
        requires = { "L3MON4D3/LuaSnip" }
    }
    use "hrsh7th/cmp-buffer"       -- buffer completions
    use "hrsh7th/cmp-path"         -- path completions
    use "hrsh7th/cmp-cmdline"      -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
        "jose-elias-alvarez/typescript.nvim"
    }

    -- LSP Saga
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    })

    -- Linting and formatting
    use "jose-elias-alvarez/null-ls.nvim"

    -- Comments
    use 'numToStr/Comment.nvim'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- nav buddy
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",    -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        }
    }

    -- auto tag and autp pairs
    use "windwp/nvim-ts-autotag"
    use "windwp/nvim-autopairs"

    -- surround
    use "tpope/vim-surround"

    -- Better tmux navigation
    use "christoomey/vim-tmux-navigator"

    -- maximize splits
    use "szw/vim-maximizer"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt` vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'vim-airline/vim-airline'
  use 'mkitt/tabline.vim'
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use {'fatih/vim-go', cmd = {'GoUpdateBinaries'}}
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'preservim/nerdtree'
  use 'rust-lang/rust.vim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'ribru17/bamboo.nvim'
  use 'prettier/vim-prettier'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'wakatime/vim-wakatime'
  use 'tpope/vim-fugitive'
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  use "ram191/friendly-snippets"
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp",
    dependencies = { "ram191/friendly-snippets" }
  })
  use "folke/trouble.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "https://github.com/tpope/vim-surround"
  use "mattn/emmet-vim"
  use "lewis6991/gitsigns.nvim"
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end
  })
end)


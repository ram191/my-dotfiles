-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'preservim/nerdtree'
  use 'navarasu/onedark.nvim' use 'rust-lang/rust.vim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'ribru17/bamboo.nvim'
  use 'prettier/vim-prettier'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end)


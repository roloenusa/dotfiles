-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'}
  }

  use('nvim-treesitter/playground')

  use('tomasiser/vim-code-dark', {
	  as = 'codedark',
	  config = function()
		  vim.cmd('colorscheme codedark')
	  end
  })

  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  use({'neovim/nvim-lspconfig',
	  requires = {
		  { "williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},
		  {"hrsh7th/cmp-nvim-lsp"},
		  {"hrsh7th/cmp-buffer"},
		  {"hrsh7th/cmp-path"},
		  {"hrsh7th/cmp-cmdline"},
		  {"hrsh7th/nvim-cmp"},
		  {"L3MON4D3/LuaSnip"},
		  {"saadparwaiz1/cmp_luasnip"},
		  -- {"j-hui/fidget.nvim"}, -- This is a from theprimeagen setup. Don't know if i need it.
		  {"rafamadriz/friendly-snippets"},
	  }
  })
end)

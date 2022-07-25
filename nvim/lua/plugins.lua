
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- smooth scroll
	use 'psliwka/vim-smoothie'

	-- Themes
	use 'ntk148v/vim-horizon'
	use 'morhetz/gruvbox'
	use 'EdenEast/nightfox.nvim'

	-- File Explorer with Icons
	use 'kyazdani42/nvim-tree.lua'

	-- Commenter
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	--Airline themes
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- react stuff
	use 'MaxMEllon/vim-jsx-pretty'

	use 'neoclide/vim-jsx-improve'

	-- Emmet
	use 'mattn/emmet-vim'

	-- Auto pair
	use 'jiangmiao/auto-pairs'
	-- Surronding w/ brackets
	use 'kylechui/nvim-surround'

	--Git client
	use 'tpope/vim-fugitive'

	--Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- LSP Support
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	-- Autocompletion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'

	--  Snippets
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	use 'VonHeikemen/lsp-zero.nvim'

	--LSP UI
	use 'glepnir/lspsaga.nvim'

	-- telescope fzf
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'kyazdani42/nvim-web-devicons'

	use 'windwp/nvim-ts-autotag'

	-- Debugger
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'

	--Line error msg
	use 'Maan2003/lsp_lines.nvim'

	-- Package manager 
	use {
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end
	}

	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		config = function()
			require('bufferline').setup()
		end
	}
end)


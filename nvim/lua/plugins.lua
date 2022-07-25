local Plug = vim.fn['plug#']

-- TODO: Convert to packer 
vim.call('plug#begin', '~/.config/nvim/plugged')

-- smooth scroll
Plug 'psliwka/vim-smoothie'

-- Themes
-- Plug 'dracula/vim'
 Plug 'ntk148v/vim-horizon'
-- Plug 'kyoz/purify', { 'rtp': 'vim' }
-- Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'
-- Plug 'sainnhe/sonokai'
-- Plug 'sainnhe/gruvbox-material'

-- File Explorer with Icons
-- Plug 'scrooloose/erdtree'
-- Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' -- optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

-- Commenter
Plug 'numToStr/Comment.nvim'

--Airline themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- react stuff
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'neoclide/vim-jsx-improve'

-- Emmet
Plug 'mattn/emmet-vim'

-- Surronding w/ brackets
Plug 'kylechui/nvim-surround'

--Git client
Plug 'tpope/vim-fugitive'

--Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})

-- LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

-- Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

--  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'

--LSP UI
Plug 'glepnir/lspsaga.nvim'

-- telescope fzf
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'windwp/nvim-ts-autotag'

-- Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

--Line error msg
Plug 'Maan2003/lsp_lines.nvim'

vim.call('plug#end')

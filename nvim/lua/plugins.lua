vim.cmd [[packadd packer.nvim]]
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- smooth scroll
  use 'psliwka/vim-smoothie'

  -- Themes
  use { "ellisonleao/gruvbox.nvim" }
  use 'EdenEast/nightfox.nvim'
  use 'navarasu/onedark.nvim'
  use 'Shatur/neovim-ayu'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'folke/tokyonight.nvim'
  use 'tiagovla/tokyodark.nvim'
  use 'B4mbus/oxocarbon-lua.nvim'
  use {'shaunsingh/oxocarbon.nvim', run = './install.sh'}
  use 'sam4llis/nvim-tundra'
  use "lunarvim/horizon.nvim"

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
  use {
    'neovim/nvim-lspconfig',
  }
  use "jose-elias-alvarez/null-ls.nvim"
  use 'williamboman/nvim-lsp-installer'
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('renamer').setup()
    end
  }

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
  use "nvim-telescope/telescope-file-browser.nvim"
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-terminal.lua'
  use 'camgraff/telescope-tmux.nvim'


  use 'windwp/nvim-ts-autotag'

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use "nvim-telescope/telescope-dap.nvim"

  -- Bufferline
  use 'akinsho/bufferline.nvim'

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Indent line
  use "lukas-reineke/indent-blankline.nvim"

  -- Easy Motion
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'asdfghjkletovxqpybzciurn' }
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup()
    end

  }

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Better marks
  use 'ThePrimeagen/harpoon'

  -- Welcome message
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end)

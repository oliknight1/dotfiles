filetype plugin on
call plug#begin("~/.vim/plugged")
" smooth scroll
Plug 'psliwka/vim-smoothie'

" Themes
" Plug 'dracula/vim'
" Plug 'ntk148v/vim-horizon'
" Plug 'kyoz/purify', { 'rtp': 'vim' }
" Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'sainnhe/sonokai'
" Plug 'sainnhe/gruvbox-material'

" File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Commenter
Plug 'preservim/nerdcommenter'

"Auto pairing
Plug 'jiangmiao/auto-pairs'

" JS syntax highlighting, indentation etc.,
Plug 'pangloss/vim-javascript'

" Go LSP
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Fuzzy finding
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Airline themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" react stuff
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'neoclide/vim-jsx-improve'

" Emmet
Plug 'mattn/emmet-vim'

" Surronding w/ brackets
Plug 'tpope/vim-surround'

"Git client
Plug 'tpope/vim-fugitive'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Language Server
Plug 'neovim/nvim-lspconfig'

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"LSP UI
Plug 'glepnir/lspsaga.nvim'

" telescope fzf
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'


call plug#end()

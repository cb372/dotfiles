set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin()

" General
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
Plug 'neomake/neomake'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'embear/vim-localvimrc'
Plug 'aserebryakov/vim-todo-lists'
Plug 'chrisbra/csv.vim'
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-surround'

" Completions and snippets
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'

" Filesystem/search
Plug 'scrooloose/nerdtree'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'AckslD/nvim-neoclip.lua'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Scala
Plug 'scalameta/nvim-metals'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" JS/React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Idris
Plug 'idris-hackers/idris-vim'

" Elm
Plug 'elmcast/elm-vim'

call plug#end()

lua require('basics')
lua require('mappings')
lua require('telescope_config')
lua require('treesitter_config')
lua require('neoclip_config')
lua require('search')
lua require('completions')
lua require('metals_config')

for fpath in split(globpath('~/.config/nvim/config', '*.vim'), '\n')
  exe 'source' fpath
endfor

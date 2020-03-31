set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

syntax on
filetype plugin indent on

call plug#begin()

" General
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
"Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'embear/vim-localvimrc'
Plug 'aserebryakov/vim-todo-lists'
Plug 'chrisbra/csv.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-surround'

" Filesystem/search
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Tags
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" JS/React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

" Idris
Plug 'idris-hackers/idris-vim'

" Elm
Plug 'elmcast/elm-vim'

" LSP
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

for fpath in split(globpath('~/.config/nvim/config', '*.vim'), '\n')
  exe 'source' fpath
endfor

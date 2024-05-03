
"" General
"Plug 'bronson/vim-trailing-whitespace'
"Plug 'tpope/vim-unimpaired'
"Plug 'mattn/emmet-vim'
"Plug 'chrisbra/csv.vim'
"Plug 'dhruvasagar/vim-zoom'
"Plug 'tpope/vim-surround'

"" Git
"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-rhubarb'

lua require('core.basics')
lua require('core.mappings')
lua require('core.search')

lua require('lazy_setup')

for fpath in split(globpath('~/.config/nvim/config', '*.vim'), '\n')
  exe 'source' fpath
endfor

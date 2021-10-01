
set ignorecase    " ignore case when searching

set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

set incsearch     " show search matches as you type

set nohlsearch    " do not highlight search matches

nnoremap <C-n> :Files<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap H :History<CR>

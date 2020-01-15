let g:neoformat_enabled_haskell = ['hindent', 'stylishhaskell']
let g:neoformat_run_all_formatters = 1

let g:neomake_haskell_enabled_makers = ['hlint']

au FileType haskell map a= :Tabularize /=<CR>
au FileType haskell map a; :Tabularize /::<CR>
au FileType haskell map a- :Tabularize /-><CR>

let g:haskell_project_errorformat = '%E%f:%l:%c:\ error:%#,' .
      \ '%W%f:%l:%c:\ warning:%#,' .
      \ '%W%f:%l:%c:\ warning:\ [-W%.%#]%#,' .
      \ '%f:%l:%c:\ %trror: %m,' .
      \ '%f:%l:%c:\ %tarning: %m,' .
      \ '%E%f:%l:%c:%#,' .
      \ '%E%f:%l:%c:%m,' .
      \ '%W%f:%l:%c:\ Warning:%#,' .
      \ '%C\ \ %m%#,' .
      \ '%-G%.%#'

au FileType haskell,lhaskell setlocal makeprg=stack\ build
au FileType haskell,lhaskell setlocal errorformat=g:haskell_project_errorformat

" Disabled because I'm suspicious that it's messing with Scala files e.g.
" wiping their contents
"augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
"augroup END

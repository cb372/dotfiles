set tags=.tags

let g:autotagTagsFile=".tags"

map <C-o> :CtrlPTag<CR>
map <C-i> :TagbarToggle<CR>

" Regenerate tags file
map <C-u> :!ctags -R -f ./.tags .<CR>

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'        : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }


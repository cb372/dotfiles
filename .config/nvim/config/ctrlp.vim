" Keymaps for CtrlP
let g:ctrlp_map = '<C-n>'

" Set up some ignores for Ctrl-P plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ }

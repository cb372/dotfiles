set termguicolors

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
highlight PMenu                 ctermfg=232 ctermbg=13
highlight PMenuSel              ctermfg=232 ctermbg=12

" work around for telescope.nvim
" (https://github.com/nvim-telescope/telescope.nvim/issues/2145)
highlight NormalFloat ctermfg=LightGrey

" Don't want a nasty grey gutter
highlight clear SignColumn
let g:gitgutter_set_sign_backgrounds = 1

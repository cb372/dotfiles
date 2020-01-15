if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Use <leader>* to search for word under cursor in any file in the current dir
nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

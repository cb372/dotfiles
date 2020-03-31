
" Change <Leader> (both global and local) from \ to ,
let mapleader=","
let maplocalleader=","

" Remap <Ctrl-C> to do the same thing as <Esc>.
" By default they behave very similarly but not exactly the same.
" e.g. Ctrl-C does not trigger the 'InsertLeave' event.
inoremap <C-c> <Esc>

" Turn F1 into ESC (much more useful than online help!)
map <F1> <Esc>
imap <F1> <Esc>

" Press space <char> to insert just one char without going into insert mode
nmap <Space> i_<Esc>r

" Disable arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" hybrid number mode
set relativenumber
set number

" Move between windows without having to press Ctrl-W
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Never let the cursor get right to the top/bottom of window
set scrolloff=3

" make backspace work across line breaks
set backspace=indent,eol,start

" copy/paste directly to/from OSX clipboard (no need to use "+y to copy)
set clipboard=unnamed

" a tab = 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

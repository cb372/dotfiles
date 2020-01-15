syntax on
filetype plugin indent on

" make backspace work across line breaks
set backspace=indent,eol,start

" copy/paste directly to/from OSX clipboard (no need to use "+y to copy)
set clipboard=unnamed

" change <Leader> (both global and local) from \ to ,
let mapleader=","
let maplocalleader=","

" Always show status bar
set laststatus=2

set shiftwidth=2
set tabstop=2
set expandtab

" Set tabstop to 4 spaces for some languages
autocmd FileType java setlocal shiftwidth=4 tabstop=4

" Add folding to XML files
let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax

" Enable jumping to closing XML tag using %
runtime macros/matchit.vim

" Disable arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set pastetoggle=<leader>t

set incsearch     " show search matches as you type

" Save a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Press Ctrl-r to search/replace the currently highlighted text
vnoremap <C-r> <Esc>:%s/<C-r>+//gc<left><left><left>

" Turn F1 into ESC (much more useful than online help!)
map <F1> <Esc>
imap <F1> <Esc>

" Press space <char> to insert just one char without going into insert mode
nmap <Space> i_<Esc>r

" Use <leader>p to paste without yanking the old data into the yank register
vnoremap <leader>p "_dP"

" Write the current buffer to a temp file and load it in the Scala REPL
function RunInScalaREPL()
    let l:tmpfile = tempname() . '.scala'
    execute 'write ' . l:tmpfile
    execute '!scala -i ' . l:tmpfile
endfunction
command Scala call RunInScalaREPL()
command REPL call RunInScalaREPL()

" Move between windows without having to press Ctrl-W
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Never let the cursor get right to the top/bottom of window
set scrolloff=3

" Use f for vim-sneak, because remapping s is too annoying
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

function CreatePdfCommands()
  if !exists(":Pdf") 
    " Generate PDFs of Manning chapter or whole book without leaving vim
    " Note: expand("%:t") gives the filename (without path) of currently open file
    command Pdf execute '!check-pdf ' . expand("%:t") 
    command PdfBook execute '!check-pdf'
  endif
endfunction

autocmd FileType xml call CreatePdfCommands()

" Status line
hi statusline ctermfg=LightGray ctermbg=Black
set laststatus=2
set statusline=
set statusline +=\ %n                "buffer number
set statusline +=\ %{&ff}            "file format
set statusline +=\ %y                "file type
set statusline +=\ %<%F            "full path
set statusline +=\ %m                "modified flag
set statusline +=\ %=%5l             "current line
set statusline +=\ /%L               "total lines
set statusline +=\ %4v             "virtual column number
set statusline +=\ 0x%04B          "character under cursor

" Create parent directory of current file
command Mkdir execute ':!mkdir -p %:h'

" hybrid number mode
set relativenumber
set number

" use python to format JSON
com! FormatJSON %!python -m json.tool

" Always show status bar
set laststatus=2

hi statusline ctermfg=LightGray ctermbg=Black
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

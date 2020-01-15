" Save a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Create parent directory of current file
command Mkdir execute ':!mkdir -p %:h'

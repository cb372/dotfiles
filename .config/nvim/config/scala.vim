au BufRead,BufNewFile *.sbt set filetype=scala
au BufRead,BufNewFile *.sc set filetype=scala

" Write the current buffer to a temp file and load it in the Scala REPL
function RunInScalaREPL()
    let l:tmpfile = tempname() . '.scala'
    execute 'write ' . l:tmpfile
    execute '!scala -i ' . l:tmpfile
endfunction
command Scala call RunInScalaREPL()
command REPL call RunInScalaREPL()




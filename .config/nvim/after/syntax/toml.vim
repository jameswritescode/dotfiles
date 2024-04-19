let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @VIM syntax/vim.vim
let b:current_syntax = s:bcs

syntax region tomlString matchgroup=Statement start=+'''"vim+ end=+'''+ contains=@VIM

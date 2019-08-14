let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
let b:current_syntax = s:bcs

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @JSON syntax/json.vim
let b:current_syntax = s:bcs

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @GQL syntax/graphql.vim
let b:current_syntax = s:bcs

syntax region rubyHereDocGQL matchgroup=Statement start=+<<\(\~\|-\)\z(GQL\)+ end=+\(\s\+\)\?\z1$+ contains=@GQL
syntax region rubyHereDocSQL matchgroup=Statement start=+<<\(\~\|-\)\z(SQL\)+ end=+\(\s\+\)\?\z1$+ contains=@SQL
syntax region rubyHereDocSQL matchgroup=Statement start=+<<\(\~\|-\)\z(JSON\)+ end=+\(\s\+\)\?\z1$+ contains=@JSON

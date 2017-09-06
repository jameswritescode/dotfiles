" TODO: Squash squiggle/dash regions into one region.

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
let b:current_syntax = s:bcs

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @JSON syntax/json.vim
let b:current_syntax = s:bcs

syntax region rubyHereDocSQL matchgroup=Statement start=+<<\z(SQL\)+ end=+^\z1$+ contains=@SQL
syntax region rubyHereDocDashSQL matchgroup=Statement start=+<<-\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL
syntax region rubyHereDocSquiggleSQL matchgroup=Statement start=+<<\~\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL

syntax region rubyHereDocJSON matchgroup=Statement start=+<<\z(JSON\)+ end=+^\z1$+ contains=@JSON
syntax region rubyHereDocDashJSON matchgroup=Statement start=+<<-\z(JSON\)+ end=+\s\+\z1$+ contains=@JSON
syntax region rubyHereDocSquiggleJSON matchgroup=Statement start=+<<\~\z(JSON\)+ end=+\s\+\z1$+ contains=@JSON

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @GQL syntax/graphql.vim
let b:current_syntax = s:bcs

syntax region jsGraphqlTemplateString start=+`\n\s\+\(mutation\|query\)+ end=+`;+ contains=@GQL,jsTemplateExpression,jsSpecial extend

hi def link jsGraphqlTemplateString jsTemplateString

syn cluster jsExpression add=jsGraphqlTemplateString

hi xmlAttrib cterm=italic ctermfg=179

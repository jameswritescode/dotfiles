let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @YAML syntax/yaml.vim
let b:current_syntax = s:bcs

syntax region shHereDocYaml matchgroup=Statement start=+<<\z(YAML\)+ end=+\(\s\+\)\?\z1$+ contains=@YAML

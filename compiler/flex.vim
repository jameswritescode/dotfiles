" Vim compiler file for Adobe Flex 2
" Compiler: Adobe Flex 2 (mxmlc)
" Maintainer: swaroopNOSPAM@swaroopch.info
" Last Change: 2006-12-29 Fri

if exists("current_compiler")
    finish
endif
let current_compiler = "flex"

" flex location
setlocal makeprg=E:\mea\flex\bin\mxmlc\ %

setlocal errorformat =
    \%f(%l):\ Error:\ %m

" vim: filetype=vim

function! CustomHighlights() abort
  hi ALEError guifg=red gui=bold
  hi ALEErrorSign guifg=red
  hi ALEWarning guifg=yellow gui=bold
  hi ALEWarningSign guifg=yellow
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

function! CustomHighlights() abort
  hi ALEError       guifg=red gui=bold
  hi ALEErrorSign   guifg=red
  hi ALEWarning     guifg=yellow gui=bold
  hi ALEWarningSign guifg=yellow

  hi JamesDiffAdd    guifg=#98C379
  hi JamesDiffChange guifg=#E5C07B
  hi JamesDiffDelete guifg=#E06C75
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

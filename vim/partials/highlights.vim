function! CustomHighlights() abort
  hi ALEError       guifg=red
  hi ALEErrorSign   guifg=red
  hi ALEWarning     guifg=yellow
  hi ALEWarningSign guifg=yellow

  hi JamesDiffAdd    guifg=#98C379
  hi JamesDiffChange guifg=#E5C07B
  hi JamesDiffDelete guifg=#E06C75

  hi Pmenu guibg=#262931

  hi WhichKeyGroup guifg=#E06C75 gui=bold
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

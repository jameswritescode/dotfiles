function! CustomHighlights() abort
  hi ALEError       guifg=red gui=bold
  hi ALEErrorSign   guifg=red
  hi ALEWarning     guifg=yellow gui=bold
  hi ALEWarningSign guifg=yellow

  hi JamesDiffAdd    guifg=#98C379
  hi JamesDiffChange guifg=#E5C07B
  hi JamesDiffDelete guifg=#E06C75

  " TODO: Undo this later? Floating window is hard-coded to Normal:Pmenu
  " hi WhichKey guibg=#282c34 guifg=#61afef
  " hi WhichKeyDesc guibg=#282c34 guifg=#E06C75
  " hi WhichKeyGroup guibg=#282c34 gui=bold guifg=#E06C75
  " hi WhichKeySeperator guibg=#282c34 guifg=#98C379
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

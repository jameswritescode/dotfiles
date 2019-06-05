function! CustomHighlights() abort
  hi ALEError   guifg=red
  hi ALEWarning guifg=yellow

  hi link ALEErrorSign   ALEError
  hi link ALEWarningSign ALEWarning

  hi JamesDiffAdd    guifg=#98C379
  hi JamesDiffChange guifg=#E5C07B
  hi JamesDiffDelete guifg=#E06C75

  hi clear MatchParen
  hi MatchParen gui=bold

  hi Pmenu guibg=#262931

  hi WhichKeyGroup guifg=#E06C75 gui=bold

  hi xmlAttrib gui=italic
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

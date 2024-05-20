function! CustomHighlights() abort
  """""""
  " ale "
  """""""
  hi ALEError   guifg=red gui=underline
  hi ALEErrorSign guifg=red

  hi ALEWarning guifg=yellow gui=underline
  hi ALEWarningSign guifg=yellow

  """""""""""
  " matchup "
  """""""""""
  hi clear MatchParen
  hi MatchParen gui=bold

  """""""""""""
  " which-key "
  """""""""""""
  hi WhichKeyGroup guifg=#e06c75 gui=bold

  """""""""
  " Other "
  """""""""
  hi Pmenu guibg=#282c34
  hi jsxAttrib gui=italic guifg=#e5c07b
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

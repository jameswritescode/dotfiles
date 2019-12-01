function! CustomHighlights() abort
  """""""
  " ale "
  """""""
  hi ALEError   guifg=red gui=underline
  hi ALEErrorSign guifg=red

  hi ALEWarning guifg=yellow gui=underline
  hi ALEWarningSign guifg=yellow

  """"""""""""
  " coc.nvim "
  """"""""""""
  hi CustomCocDiffAdd guifg=#98c379
  hi CustomCocDiffChange guifg=#e5c07b
  hi CustomCocDiffDelete guifg=#e06c75

  hi CocErrorHighlight guifg=red gui=underline
  hi link CocErrorFloat ALEErrorSign
  hi link CocErrorSign ALEErrorSign

  hi link CocHintLine CustomCocDiffChange
  hi link CocHintSign CocHintLine

  hi CocInfoHighlight guifg=lightblue gui=underline
  hi CocInfoSign guifg=lightblue
  hi CocInfoFloat guifg=lightblue

  hi CocWarningHighlight guifg=yellow gui=underline
  hi link CocWarningFloat ALEWarningSign
  hi link CocWarningSign ALEWarningSign

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
  hi Pmenu guibg=#262931
  hi jsxAttrib gui=italic guifg=#e5c07b
  hi jsFlowGeneric gui=italic guifg=#e5c07b
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

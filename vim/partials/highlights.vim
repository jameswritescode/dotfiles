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
  hi CustomCocDiffAdd guifg=#98C379
  hi CustomCocDiffChange guifg=#E5C07B
  hi CustomCocDiffDelete guifg=#E06C75

  hi CocErrorHighlight guifg=red gui=underline
  hi link CocErrorFloat ALEErrorSign
  hi link CocErrorSign ALEErrorSign

  hi link CocHintLine CustomCocDiffChange
  hi link CocHintSign CocHintLine
  hi link CocInfoLine CocHintLine
  hi link CocInfoSign CocHintLine

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
  hi WhichKeyGroup guifg=#E06C75 gui=bold

  """""""""
  " Other "
  """""""""
  hi Pmenu guibg=#262931
  hi jsxAttrib gui=italic guifg=#E5C07B
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

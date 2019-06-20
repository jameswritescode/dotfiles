function! CustomHighlights() abort
  """""""
  " ale "
  """""""
  hi ALEError   guifg=red
  hi ALEWarning guifg=yellow
  hi link ALEErrorSign ALEError
  hi link ALEWarningSign ALEWarning

  """"""""""""
  " coc.nvim "
  """"""""""""
  hi CustomCocDiffAdd guifg=#98C379
  hi CustomCocDiffChange guifg=#E5C07B
  hi CustomCocDiffDelete guifg=#E06C75

  hi link CocErrorFloat ALEError
  hi link CocErrorLine ALEError
  hi link CocErrorSign ALEError

  hi link CocHintLine CustomCocDiffChange
  hi link CocHintSign CocHintLine
  hi link CocInfoLine CocHintLine
  hi link CocInfoSign CocHintLine

  hi link CocWarningFloat ALEWarning
  hi link CocWarningLine ALEWarning
  hi link CocWarningSign ALEWarning

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

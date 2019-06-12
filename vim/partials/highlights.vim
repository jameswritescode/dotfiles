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

  hi link CocErrorLine ALEError
  hi link CocHintLine CustomCocDiffChange
  hi link CocInfoLine CocHintLine
  hi link CocWarningLine ALEWarning

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

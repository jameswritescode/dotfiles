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
  hi Pmenu guibg=#262931
  hi jsxAttrib gui=italic guifg=#e5c07b

  """"""""""""""""""
  " vim.diagnostic "
  """"""""""""""""""
  sign define DiagnosticSignError text=● texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignWarn text=● texthl=DiagnosticSignWarn linehl= numhl=
  sign define DiagnosticSignInfo text=● texthl=DiagnosticSignInfo linehl= numhl=
  sign define DiagnosticSignHint text=● texthl=DiagnosticSignHint linehl= numhl=
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

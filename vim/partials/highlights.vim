function! CustomHighlights() abort
  hi ALEErrorSign ctermfg=red
  hi ALEWarningSign ctermfg=yellow
  hi Comment cterm=italic
endfunction

augroup custom_highlights
  autocmd!
  autocmd colorscheme * call CustomHighlights()
augroup END

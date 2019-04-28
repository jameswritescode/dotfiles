augroup WhichKey
  au!
  au User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
  autocmd! FileType which_key
  autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

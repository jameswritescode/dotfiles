function! <SID>StripTrailingWhitespaces()
  let l:_s=@/
  let l:l = line('.')
  let l:c = col('.')
  %s/\s\+$//e
  let @/=l:_s
  call cursor(l:l, l:c)
endfunction

augroup strip_whitespace
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

function! <SID>ProfileStart() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
endfunction

command! -bang -nargs=0 ProfileStart call <SID>ProfileStart()

function! <SID>ProfileStop() abort
  execute 'profile pause'
  execute 'noautocmd qall!'
endfunction

command! -bang -nargs=0 ProfileStop call <SID>ProfileStop()

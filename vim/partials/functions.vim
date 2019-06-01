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

function! FloatingWin()
  let a:col_offset = &columns / 6
  let a:height = &lines - 3
  let a:width = float2nr(&columns - (&columns * 2 / 10))
  let a:col = float2nr((&columns - a:width) / 2)

  let a:opts = {
        \ 'col': a:col + a:col_offset,
        \ 'height': a:height / 2,
        \ 'relative': 'editor',
        \ 'row': a:height * 0.3,
        \ 'width': a:width * 2 / 3,
        \ }

  let a:buf = nvim_create_buf(v:false, v:true)
  let a:win = nvim_open_win(a:buf, v:true, a:opts)
endfunction

function! <SID>SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

command! -bang -nargs=0 SynStack call <SID>SynStack()

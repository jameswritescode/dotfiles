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
  let l:col_offset = &columns / 6
  let l:height = &lines - 3
  let l:width = float2nr(&columns - (&columns * 2 / 10))
  let l:col = float2nr((&columns - l:width) / 2)

  let l:opts = {
        \ 'col': l:col + l:col_offset,
        \ 'height': l:height / 2,
        \ 'relative': 'editor',
        \ 'row': l:height * 0.3,
        \ 'width': l:width * 2 / 3,
        \ }

  let l:buf = nvim_create_buf(v:false, v:true)
  let l:win = nvim_open_win(l:buf, v:true, l:opts)

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

function! <SID>SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

command! -bang -nargs=0 SynStack call <SID>SynStack()

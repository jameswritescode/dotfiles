function! FZFFloatingWin()
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

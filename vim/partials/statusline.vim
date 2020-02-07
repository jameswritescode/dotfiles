scriptencoding utf-8

set statusline=

function! RedrawColors() abort
  let l:mode = mode()

  if l:mode ==# 'n' " Normal
    let l:bg = '#98c379'
  elseif l:mode ==# 'i' " Insert
    let l:bg = '#61afef'
  elseif l:mode ==# 'R' " Replace
    let l:bg = '#e06c75'
  elseif l:mode ==# 'v' || l:mode ==# 'V' || l:mode ==# '' " Visual
    let l:bg = '#e5c07b'
  elseif l:mode ==# 't' " Terminal
    let l:bg = '#c678dd'
  elseif l:mode ==# 'c' " Command
    let l:bg = '#56b6c2'
  else
    echo 'statusline RedrawColors mode: ' . l:mode
    let l:bg = '#ff0000'
  endif

  execute 'highlight StatusLineAccentBody guibg=' . l:bg
  execute 'highlight StatusLineAccentClose guifg=' . l:bg
  execute 'highlight StatusLineAccentOpen guifg=' . l:bg
  execute 'highlight StatusLineFilename guibg=' . l:bg . ' guifg=#282c34 gui=bold'

  return ''
endfunction

function! SetModified() abort
  if &buftype ==# 'terminal'
    return '-'
  endif

  if exists('*FugitiveHead')
    hi StatusLineModifiedBody gui=bold guibg=#3d4450 guifg=#282c34

    return ' ' . FugitiveHead()
  endif

  if &modified == 1
      hi StatusLineModifiedBody gui=bold guibg=#3d4450 guifg=#282c34
  else
      hi StatusLineModifiedBody gui=bold guibg=#3d4450 guifg=#3d4450
  endif

  return '●'
endfunction

function! SetFiletype(filetype)
  if &buftype ==# 'terminal'
    return 'terminal'
  endif

  return a:filetype ==# '' ? '-' : a:filetype
endfunction

function StatusLineHighlights() abort
  hi StatusLine guibg=#282c34
  hi StatusLineNC guibg=#282c34

  hi StatusLineBody gui=bold guibg=#3d4450 guifg=#282c34
  hi StatusLineEnd guibg=#3d4450 guifg=#3d4450
  hi StatusLineSurround guifg=#3d4450
endfunction

function DrawStatusLine(inactive) abort
  " LHS
  if a:inactive == v:false
    setlocal statusline=%{RedrawColors()}
    setlocal statusline+=%#StatusLineAccentOpen#
    setlocal statusline+=%#StatusLineAccentBody#
    setlocal statusline+=%#StatusLineFilename#\ %t
    setlocal statusline+=%#StatusLineAccentClose#
  else
    setlocal statusline=%#StatusLineBody#\ %t
    setlocal statusline+=%#StatusLineSurround#
  endif

  setlocal statusline+=\ %#StatusLineSurround#
  setlocal statusline+=%#StatusLineBody#%{SetModified()}
  setlocal statusline+=%#StatusLineSurround#

  " Spacer
  setlocal statusline+=%=

  " RHS
  setlocal statusline+=%#StatusLineSurround#
  setlocal statusline+=%#StatusLineBody#L%l
  setlocal statusline+=\/%#StatusLineBody#C%c
  setlocal statusline+=%#StatusLineSurround#

  setlocal statusline+=\ %#StatusLineSurround#
  setlocal statusline+=%#StatusLineBody#%{SetFiletype(&filetype)}
  setlocal statusline+=%#StatusLineEnd#0
endfunction

augroup statusline
  autocmd!
  autocmd WinEnter,BufEnter * call DrawStatusLine(v:false)
  autocmd WinLeave,BufLeave * call DrawStatusLine(v:true)
  autocmd colorscheme * call StatusLineHighlights()
augroup END

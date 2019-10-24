scriptencoding utf-8

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
    return ' terminal'
  endif

  return a:filetype ==# '' ? '-' : a:filetype
endfunction

" LHS
set statusline=%{RedrawColors()}

set statusline+=%#StatusLineAccentOpen#
set statusline+=%#StatusLineAccentBody#
set statusline+=%#StatusLineFilename#\ %t
set statusline+=%#StatusLineAccentClose#

set statusline+=\ %#StatusLineSurround#
set statusline+=%#StatusLineBody#%{SetModified()}
set statusline+=%#StatusLineSurround#

" Spacer
set statusline+=%=

" RHS
set statusline+=%#StatusLineSurround#
set statusline+=%#StatusLineBody#L%l
set statusline+=\/%#StatusLineBody#C%c
set statusline+=%#StatusLineSurround#

set statusline+=\ %#StatusLineSurround#
set statusline+=%#StatusLineBody#%{SetFiletype(&filetype)}
set statusline+=%#StatusLineEnd#0

function StatusLineHighlights() abort
  hi StatusLine guibg=#282c34
  hi StatusLineNC guibg=#282c34

  hi StatusLineBody gui=bold guibg=#3d4450 guifg=#282c34
  hi StatusLineEnd guibg=#3d4450 guifg=#3d4450
  hi StatusLineSurround guifg=#3d4450
endfunction

augroup statusline_highlights
  autocmd!
  autocmd colorscheme * call StatusLineHighlights()
augroup END

scriptencoding utf-8

function TabLineHighlights() abort
  hi TabLineSel gui=bold guifg=#282c34 guibg=#98c379
  hi TabLineSymbolActive guifg=#98c379
  hi TabLineSymbolInactive guifg=#3d4450 guibg=#282c34
  hi TabLine gui=bold guibg=#3d4450 guifg=#282c34
endfunction

function Tabline() abort
  let tabline = ''

  for i in range(tabpagenr('$'))
    let tab = i + 1
    let bufname = bufname(tabpagebuflist(tab)[tabpagewinnr(tab) - 1])
    let currentTab = tab == tabpagenr()
    let symbolHl = currentTab ? '%#TabLineSymbolActive#' : '%#TabLineSymbolInactive#'
    let isFirstTab = tab == 1

    let content = (isFirstTab ? ' ' : '') . tab . '. ' .
          \ (bufname !=# '' ? fnamemodify(bufname, ':t') : '[No Name]')

    let tabline .= !isFirstTab ? symbolHl . '' : ''
    let tabline .= (currentTab ? '%#TabLineSel#' : '%#TabLine#')
    let tabline .= content
    let tabline .= symbolHl . '%#TabLineFill# '
  endfor

  return tabline
endfunction

set tabline=%!Tabline()

augroup tabline
  autocmd!
  autocmd colorscheme * call TabLineHighlights()
augroup END

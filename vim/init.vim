source ~/dotfiles/vim/partials/settings.vim

let g:mapleader="\<Space>"

source ~/dotfiles/vim/partials/mappings.vim

augroup betterment
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd VimResized * wincmd =
augroup END

filetype off

source ~/dotfiles/vim/partials/plugins.vim

filetype plugin indent on

if !exists('g:syntax_on')
  syntax enable
endif

source ~/dotfiles/vim/partials/highlights.vim
source ~/dotfiles/vim/partials/functions.vim

colors onedark

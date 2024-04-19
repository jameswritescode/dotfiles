source ~/dotfiles/.config/nvim/partials/settings.vim

let g:mapleader="\<Space>"

source ~/dotfiles/.config/nvim/partials/mappings.vim

augroup betterment
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd VimResized * wincmd =
augroup END

filetype off

filetype plugin indent on

if !exists('g:syntax_on')
  syntax enable
endif

source ~/dotfiles/.config/nvim/partials/highlights.vim
source ~/dotfiles/.config/nvim/partials/functions.vim

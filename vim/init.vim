source ~/dotfiles/vim/partials/settings.vim

let mapleader="\<Space>"

source ~/dotfiles/vim/partials/mappings.vim

autocmd VimEnter * :redraw!

filetype off

source ~/dotfiles/vim/partials/plugins.vim

filetype plugin indent on

if !exists('g:syntax_on')
  syntax enable
endif

source ~/dotfiles/vim/partials/filetype.vim
source ~/dotfiles/vim/partials/functions.vim

colors seoul256

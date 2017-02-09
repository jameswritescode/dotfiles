source ~/dotfiles/vim/partials/settings.vim

let mapleader="\<Space>"

source ~/dotfiles/vim/partials/mappings.vim

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd VimEnter * :redraw!

filetype off

source ~/dotfiles/vim/partials/plugins.vim

filetype plugin indent on
syntax on

source ~/dotfiles/vim/partials/functions.vim

colors seoul256

source ~/.vim/partials/settings.vim

let mapleader="\<Space>"

source ~/.vim/partials/mappings.vim

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd VimEnter * :redraw!

filetype off

source ~/.vim/partials/plugins.vim

filetype plugin indent on
syntax on

source ~/.vim/partials/functions.vim

colors seoul256

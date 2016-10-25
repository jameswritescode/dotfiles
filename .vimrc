source ~/.vim/partials/settings.vim

let mapleader="\<Space>"

if exists("$TMUX")
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=2\x7"
endif

source ~/.vim/partials/mappings.vim

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd VimEnter * :redraw!

filetype off

source ~/.vim/partials/plugins.vim

filetype plugin indent on
syntax on

source ~/.vim/partials/functions.vim

colors seoul256

set nocompatible
set statusline=[%02.2n]\ %f\ %y\ %m%r%h%=Line\:\ %00004.4l/%00004.4L\ (%003.3p%%)\ \ Col\:\ %0003.3c
set t_Co=256
set background=dark
set visualbell
set laststatus=2
set encoding=utf-8
set foldmethod=marker
set showmatch
set cmdheight=2
set showcmd
set autowrite
set number
set autoindent
set expandtab
set hlsearch
set backspace=2
set guifont=Courier_New:h10:cANSI
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set incsearch
set mouse=a
set splitbelow
set splitright
set shell=/bin/sh

set list
set listchars=""
set listchars=tab:›·
set listchars+=trail:·
set listchars+=nbsp:·
set listchars+=extends:>
set listchars+=precedes:<

set nofoldenable
set foldnestmax=20
set foldlevel=20
set foldmethod=indent
set foldcolumn=1

set textwidth=80
set formatoptions-=t
set colorcolumn=+1

let mapleader="\<Space>"

source ~/.vim/partials/mappings.vim

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd filetype crontab setlocal nobackup nowritebackup

augroup filetype
    au! FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
augroup end

filetype off

source ~/.vim/partials/plugins.vim

filetype plugin indent on
syntax on

if exists("$TMUX")
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=2\x7"
endif

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

colors seoul256

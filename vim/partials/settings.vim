set statusline=[%02.2n]\ %f\ %y\ %m%r%h%=Line\:\ %00004.4l/%00004.4L\ (%003.3p%%)\ \ Col\:\ %0003.3c
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
set backupdir=~/dotfiles/vim/tmp
set directory=~/dotfiles/vim/tmp
set incsearch
set mouse=a
set splitbelow
set splitright
set shell=zsh
set lazyredraw
set exrc
set secure
set noshowmode
set cursorline
set relativenumber
set gdefault
set autoread
set updatetime=300
set inccommand=split
set shortmess+=c
set hidden

set conceallevel=2
set concealcursor=niv

set list
set listchars=tab:›\ ,trail:·,nbsp:·,extends:>,precedes:<

set nofoldenable
set foldnestmax=20
set foldlevel=20
set foldmethod=indent
set foldcolumn=1
set textwidth=79
set formatoptions-=t
set colorcolumn=+1

set wildignore+=*.pyc
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pdf
set wildignore+=.DS_Store

set undofile
set undodir=~/dotfiles/vim/tmp

let g:netrw_localrmdir='rm -r'
let g:python3_host_prog=$HOME.'/dotfiles/vim/virtual/python3/bin/python'
let g:python_host_prog=$HOME.'/dotfiles/vim/virtual/python2/bin/python'

scriptencoding utf-8

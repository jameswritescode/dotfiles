set statusline=[%02.2n]\ %f\ %y\ %m%r%h%=Line\:\ %00004.4l/%00004.4L\ (%003.3p%%)\ \ Col\:\ %0003.3c
set t_Co=256
set background=dark
set visualbell
set laststatus=2
set nocompatible
set encoding=utf-8
set foldmethod=marker
set showmatch
set cmdheight=2
set showcmd
set autowrite
set autoindent
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set backspace=2
set guifont=Courier_New:h10:cANSI
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set incsearch
set virtualedit=all
set mouse=a

syntax on

filetype plugin indent on

colors wombat256

map <C-h> :set invhlsearch<cr>
map <F1> <nop>
map <F1> :set nonumber<return>
map <F2> :set number<return>
map <F3> :set noautoindent<return>
map <F4> :set autoindent<return>
map <a-space> :call ToggleAllFolds()<CR>
map <leader>s ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

noremap <space> :call ToggleFold()<CR>

autocmd BufEnter * call ChangeDir()

" File Types " {{{
augroup filetype
    au! BufRead,BufNewFile *.coffee set ft=coffee
    au! BufRead,BufNewFile fabfile set ft=python
    au! BufRead,BufNewFile *.rb set ts=2 sw=2
    au! BufRead,BufNewFile Rakefile set ts=2 sw=2
    au! BufRead,BufNewFile rakefile set ts=2 sw=2
    au! BufRead,BufNewFile capfile set ft=ruby ts=2 sw=2
    au! BufRead,BufNewFile Capfile set ft=ruby ts=2 sw=2
    au! BufRead,BufNewFile *.go set ft=go
    au! BufRead,BufNewFile *.wsgi set ft=python
    au! BufRead,BufNewFile *.tumblr.html set ft=tumblr
    au! BufRead,BufNewFile *.bf set ft=brainfuck
    au! BufRead,BufNewFile /usr/local/nginx/conf/* set ft=nginx
    au! BufRead,BufNewFile *.json set ft=json
    au! BufRead,BufNewFile hgweb.conf set ft=cfg
    au! BufRead,BufNewFile .tmux.conf set ft=tmux
    au! BufRead,BufNewFile *.as set ft=actionscript
    au! BufRead,BufNewFile /usr/local/nagios/etc/objects/* set ft=nagios
    au! BufRead,BufNewFile *.mxml compiler flex
    au! BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    au! BufRead,BufNewFile *.py set textwidth=79 " keep things PEP-8 friendly
    au! BufRead,BufNewFile *.m set ft=objc
    au! BufRead,BufNewFile *.sass set ts=2 sw=2
    au! BufRead,BufNewFile *.scss set ts=2 sw=2
augroup end
" " }}}

" Vundle " {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" GitHub Plugins
Bundle 'gmarik/vundle'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
" let g:syntastic_enable_signs = 1
" let g:syntastic_auto_jump = 1
" let g:syntastic_auto_loc_list = 1

Bundle 'jameswritescode/snipmate.vim'
let snips_author = 'James Newton <james@Zaphyous.com>'

Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kogent/vim-nagios'
Bundle 'nono/jquery.vim'
Bundle 'gregsexton/gitv'
Bundle 'skammer/vim-css-color'
Bundle 'kana/vim-scratch'
Bundle 'Raimondi/delimitMate'
Bundle 'msanders/cocoa.vim'
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

Bundle 'myusuf3/numbers.vim'

" Other Plugins
Bundle 'git://git.wincent.com/command-t.git'

" " }}}

" {{{ Functions
function! ToggleFold() " {{{
    if foldlevel('.') == 0
         normal! l
    else
         if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
    echo
endfunction " }}}

function! ToggleAllFolds() " {{{
    if exists("g:folded") == 0
        echo "Opened all folds"
        normal! zR
        let g:folded = 0
    else
        echo "Closed all folds"
        normal! zM
        unlet g:folded
    endif
endfunction " }}}

function! ChangeDir() " {{{
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction " }}}
" }}}

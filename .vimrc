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
set number
set autoindent
set smartindent
set smarttab
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
set mouse=a

set list
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

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

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
nmap sc :CoffeeCompile vert watch<cr>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

noremap <space> :call ToggleFold()<CR>

autocmd BufEnter * call ChangeDir()
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" File Types " {{{
augroup filetype
    au! FileType php setlocal sw=4 sts=4 cin
    au! FileType coffee setlocal ft=coffee
    au! BufRead,BufNewFile fabfile set ft=python
    au! BufRead,BufNewFile go setlocal ft=go
    au! BufRead,BufNewFile *.wsgi set ft=python
    au! BufRead,BufNewFile *.tumblr.html set ft=tumblr
    au! BufRead,BufNewFile *.bf set ft=brainfuck
    au! BufRead,BufNewFile /usr/local/nginx/conf/* set ft=nginx
    au! BufRead,BufNewFile *.json set ft=json
    au! BufRead,BufNewFile hgweb.conf set ft=cfg
    au! BufRead,BufNewFile .tmux.conf set ft=tmux
    au! BufRead,BufNewFile *.as set ft=actionscript
    au! BufRead,BufNewFile /usr/local/nagios/etc/objects/* set ft=nagios
    au! BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    au! FileType python setlocal textwidth=79 sw=4 sts=4
    au! BufRead,BufNewFile *.m set ft=objc
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

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
let snips_author = 'James Newton <james@Zaphyous.com>'

Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rails'
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

Bundle 'vim-ruby/vim-ruby'
Bundle 'kogent/vim-nagios'
Bundle 'nono/jquery.vim'
Bundle 'gregsexton/gitv'
Bundle 'kana/vim-scratch'
Bundle 'Raimondi/delimitMate'
Bundle 'msanders/cocoa.vim'
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

Bundle 'myusuf3/numbers.vim'
Bundle 'ervandew/supertab'
Bundle 'spolu/dwm.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'aaronjensen/vim-sass-status'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'spf13/PIV'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'godlygeek/tabular'
Bundle 'godlygeek/csapprox'

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

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
set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

set nofoldenable
set foldnestmax=20
set foldlevel=20
set foldmethod=indent
set foldcolumn=1

set textwidth=80
set colorcolumn=+1

let mapleader=","

syntax on

filetype plugin indent on

map <C-h> :set invhlsearch<cr>
map <F1> <nop>
map <F1> :set nonumber<return>
map <F2> :set number<return>
map <F3> :set noautoindent<return>
map <F4> :set autoindent<return>
map <a-space> :call ToggleAllFolds()<CR>
map <leader>sb <C-^><CR>
map <leader>nt :NERDTreeToggle<CR>
map <leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <leader>p :set paste!<cr>

vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
nmap sc :CoffeeWatch vert<cr>
nmap <leader>q :noh<cr>

noremap <up>    <c-w>+
noremap <down>  <c-w>-
noremap <left>  1<c-w>>
noremap <right> 1<c-w><
noremap <space> :call ToggleFold()<CR>

nnoremap gp `[v`]

" autocmd VimEnter * NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
au VimEnter * highlight clear SignColumn

" File Types " {{{
augroup filetype
    au! BufRead,BufNewFile *.go set ft=go
    au! BufRead,BufNewFile *.md set ft=markdown
    au! BufRead,BufNewFile *.clj set ft=clojure
    au! BufRead,BufNewFile *.php setlocal cin
    au! BufRead,BufNewFile *.coffee setlocal ft=coffee
    au! BufRead,BufNewFile *.handlebars set ft=handlebars
    au! BufRead,BufNewFile Guardfile set ft=ruby
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
    au! BufRead,BufNewFile *.m set ft=objc
    au! BufRead,BufNewFile *.jade set ft=jade
    au! FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
augroup end
" " }}}

" Vundle " {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" GitHub Plugins
Bundle 'gmarik/vundle'
Bundle 'junegunn/seoul256.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'thoughtbot/vim-rspec'
let g:rspec_command="!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-vinegar'
" Bundle 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['__pycache__', '\.pyc$']

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_enable_signs = 1
" let g:syntastic_auto_jump = 1
" let g:syntastic_auto_loc_list = 1

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
let snips_author = 'James Newton <james@Zaphyous.com>'

Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-fireplace'
" Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-rails'
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

Bundle 'guns/vim-clojure-static'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nono/jquery.vim'
Bundle 'nono/vim-handlebars'
Bundle 'gregsexton/gitv'
Bundle 'Raimondi/delimitMate'
Bundle 'msanders/cocoa.vim'
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

Bundle 'myusuf3/numbers.vim'
let g:numbers_exclude = ['nerdtree', 'tagbar']

Bundle 'ervandew/supertab'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'spf13/PIV'
let g:DisableAutoPHPFolding = 1

Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'godlygeek/tabular'
Bundle 'godlygeek/csapprox'
" Bundle 'mhinz/vim-signify'
Bundle 'hlissner/vim-forrestgump'
Bundle 'kien/ctrlp.vim'
Bundle 'Rip-Rip/clang_complete'
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 0
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_exec = '/usr/bin/clang'
let g:clang_library_path = '/usr/lib/libclang.dylib'

Bundle 'eraserhd/vim-ios'
" Bundle 'marijnh/tern_for_vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'airblade/vim-gitgutter'
highlight SignColumn term=underline ctermfg=101 ctermbg=232 guifg=#857b6f guibg=#121212

Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim

Bundle 'othree/yajs.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'terryma/vim-multiple-cursors'

" " }}}

if exists("$TMUX")
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=2\x7"
endif

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

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>StripEmptyLines()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    g/^$/d
    let @/=_s
    call cursor(l, c)
endfunction
" }}}

colors seoul256

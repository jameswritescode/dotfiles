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

inoremap jk <esc>

map <leader>sb <C-^><CR>
map <leader>nt :NERDTreeToggle<CR>
map <leader>tt :call RunCurrentSpecFile()<CR>
map <Leader>ts :call RunNearestSpec()<CR>
map <leader>p :set paste!<cr>
map <leader>j <plug>(easymotion-bd-w)

vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
nmap sc :CoffeeWatch vert<cr>
nmap tb :Tagbar<cr>
nmap <leader>q :noh<cr>

noremap <up>    <c-w>+
noremap <down>  <c-w>-
noremap <left>  1<c-w>>
noremap <right> 1<c-w><

nnoremap gp `[v`]
nnoremap J O<esc>Dj
nnoremap K o<esc>Dk
nnoremap <leader>z <c-z>

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd filetype crontab setlocal nobackup nowritebackup

augroup filetype
    au! BufRead,BufNewFile *.wsgi set ft=python
    au! BufRead,BufNewFile *.jade set ft=jade
    au! FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
augroup end

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" GitHub Plugins
Bundle 'VundleVim/Vundle.vim'
Bundle 'junegunn/seoul256.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'thoughtbot/vim-rspec'
let g:rspec_command="!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
function! FindPythonExec()
  let g:syntastic_python_python_exec=system('which python')
endfunction
call FindPythonExec()
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_python_pylint_args = '-d missing-docstring,attribute-defined-outside-init,bare-except,too-many-instance-attributes,logging-format-interpolation,invalid-name'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:syntastic_enable_signs = 1
" let g:syntastic_auto_jump = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_messages = {}

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
let snips_author = 'James Newton <james@Zaphyous.com>'
Bundle 'honza/vim-snippets'
Bundle 'justinj/vim-react-snippets'

Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Bundle 'tpope/vim-vinegar'
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
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-bundler'
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
let g:ctrl_p_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

Bundle 'Rip-Rip/clang_complete'
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 0
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_exec = '/usr/bin/clang'
let g:clang_library_path = '/usr/lib/libclang.dylib'

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
Bundle 'leafgarland/typescript-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'elixir-lang/vim-elixir'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Bundle 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

Bundle 'kylef/apiblueprint.vim'

call vundle#end()

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

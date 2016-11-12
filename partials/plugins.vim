set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Consider using https://github.com/sheerun/vim-polyglot in the future?

" General

Plugin 'junegunn/seoul256.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'godlygeek/tabular'
Plugin 'godlygeek/csapprox'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'kana/vim-textobj-user'
Plugin 'hlissner/vim-forrestgump'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

Plugin 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup = 1

Plugin 'janko-m/vim-test'
let test#strategy = "dispatch"

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

Plugin 'myusuf3/numbers.vim'
let g:numbers_exclude = ['tagbar']

Plugin 'Shougo/neosnippet'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = $HOME.'.vim/bundle/vim-snippets/snippets'

Plugin 'neomake/neomake'
autocmd! BufWritePost * Neomake
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
let g:neomake_javascript_enabled_makers = ['jscs', 'jshint']
let g:neomake_go_enabled_makers = [] " Disabled in favor of vim-go functionality

" Language specific

Plugin 'kylef/apiblueprint.vim'
Plugin 'tpope/vim-markdown'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'othree/yajs.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'nono/jquery.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'

" Executable required

if executable('coffee')
  Plugin 'kchmck/vim-coffee-script'
endif

if executable('ctags')
  Plugin 'majutsushi/tagbar'
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

if executable('git')
  Plugin 'gregsexton/gitv'
  Plugin 'tpope/vim-git'
  Plugin 'tpope/vim-fugitive'

  Plugin 'airblade/vim-gitgutter'
  highlight SignColumn term=underline ctermfg=101 ctermbg=232 guifg=#857b6f guibg=#121212
endif

if executable('go')
  Plugin 'fatih/vim-go'
  let g:go_fmt_command = 'goimports'
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_build_constraints = 1
endif

if executable('iex')
  Plugin 'elixir-lang/vim-elixir'
endif

if executable('lein')
  Plugin 'tpope/vim-fireplace'
  Plugin 'tpope/vim-classpath'
  Plugin 'guns/vim-clojure-highlight'
endif

if has('lua')
  Plugin 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  " let g:neocomplete#sources#omni#functions = {
  "       \ 'go': 'gocomplete#Complete'
  "       \ }
else
  Plugin 'ervandew/supertab'
endif

if executable('php')
  Plugin 'spf13/PIV'
  let g:DisableAutoPHPFolding = 1
endif

if executable('python') || executable('python3')
  Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

  Plugin 'klen/python-mode'
  let g:pymode_lint = 0
  let g:pymode_rope = 0
  let g:pymode_folding = 0
endif

if executable('rails')
  Plugin 'tpope/vim-rails'
  let g:rails_gem_projections = {
        \ "pundit": {
        \   "app/policies/*_policy.rb": {
        \     "command": "policy",
        \     "affinity": "model",
        \     "alternate": "app/models/{}.rb"
        \   }
        \ },
        \ "draper": {
        \   "app/decorators/*_decorator.rb": {
        \     "command": "decorator",
        \     "affinity": "model",
        \     "alternate": "app/models/{}.rb"
        \   }
        \ }}
endif

if executable('ruby')
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-haml'
  Plugin 'tpope/vim-cucumber'
  Plugin 'sunaku/vim-ruby-minitest'
  Plugin 'junegunn/fzf'

  Plugin 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'

  Plugin 'vim-ruby/vim-ruby'
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1

  Plugin 'nelstrom/vim-textobj-rubyblock'
  runtime macros/matchit.vim
endif

if executable('rustc')
  Plugin 'rust-lang/rust.vim'
endif

if executable('swift')
  Plugin 'keith/swift.vim'
endif

if executable('tmux')
  Plugin 'tpope/vim-tbone'
  Plugin 'christoomey/vim-tmux-navigator'
endif

if executable('tsc')
  Plugin 'Quramy/tsuquyomi'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'HerringtonDarkholme/yats.vim'
endif

call vundle#end()

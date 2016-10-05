set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'

" Consider using https://github.com/sheerun/vim-polyglot in the future?

Bundle 'junegunn/seoul256.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

Bundle 'garbas/vim-snipmate'
let snips_author = 'James Newton <hello@jamesnewton.com>'

Bundle 'honza/vim-snippets'
Bundle 'justinj/vim-react-snippets'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-dispatch'
Bundle 'nono/jquery.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'gregsexton/gitv'
Bundle 'Raimondi/delimitMate'
Bundle 'msanders/cocoa.vim'

Bundle 'myusuf3/numbers.vim'
let g:numbers_exclude = ['tagbar']

Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'godlygeek/tabular'
Bundle 'godlygeek/csapprox'
Bundle 'hlissner/vim-forrestgump'
Bundle 'ctrlpvim/ctrlp.vim'

Bundle 'Rip-Rip/clang_complete'
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 0
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_exec = '/usr/bin/clang'
let g:clang_library_path = '/usr/lib/libclang.dylib'

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'airblade/vim-gitgutter'
highlight SignColumn term=underline ctermfg=101 ctermbg=232 guifg=#857b6f guibg=#121212

Bundle 'kana/vim-textobj-user'
Bundle 'othree/yajs.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
" let g:jsx_ext_required = 0

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

Bundle 'kylef/apiblueprint.vim'

Bundle 'luochen1990/rainbow'
let g:rainbow_active = 1

Bundle 'neomake/neomake'
autocmd! BufWritePost * Neomake

if executable('ag')
  Bundle 'mileszs/ack.vim'
  let g:ackprg = 'ag --vimgrep'

  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable('coffee')
  Bundle 'kchmck/vim-coffee-script'
endif

if executable('ctags')
  Bundle 'majutsushi/tagbar'
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

if executable('go')
  Bundle 'fatih/vim-go'
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
endif

if executable('iex')
  Bundle 'elixir-lang/vim-elixir'
endif

if executable('lein')
  " Bundle 'guns/vim-clojure-static'
  Bundle 'tpope/vim-fireplace'
  Bundle 'tpope/vim-classpath'
endif

if has('lua')
  Bundle 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
else
  Bundle 'ervandew/supertab'
endif

if executable('node')
  let g:neomake_javascript_enabled_makers = ['jscs', 'jshint']
endif

if executable('php')
  Bundle 'spf13/PIV'
  let g:DisableAutoPHPFolding = 1
endif

if executable('python') || executable('python3')
  Bundle 'klen/python-mode'
  let g:pymode_lint = 0
  let g:pymode_rope = 0

  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
endif

if executable('rails')
  Bundle 'tpope/vim-rails'
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
  Bundle 'tpope/vim-bundler'
  Bundle 'tpope/vim-haml'
  Bundle 'tpope/vim-cucumber'
  Bundle 'sunaku/vim-ruby-minitest'

  Bundle 'janko-m/vim-test'
  let test#strategy = "dispatch"

  Bundle 'vim-ruby/vim-ruby'
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1

  Bundle 'nelstrom/vim-textobj-rubyblock'
  runtime macros/matchit.vim

  let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
endif

if executable('rustc')
  Bundle 'rust-lang/rust.vim'
endif

if executable('tsc')
  Bundle 'Quramy/tsuquyomi'
  Bundle 'leafgarland/typescript-vim'
  Bundle 'HerringtonDarkholme/yats.vim'
endif

call vundle#end()

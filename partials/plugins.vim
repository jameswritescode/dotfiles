set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" GitHub Plugins
Bundle 'VundleVim/Vundle.vim'
Bundle 'junegunn/seoul256.vim'
Bundle 'easymotion/vim-easymotion'
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

Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'godlygeek/tabular'
Bundle 'godlygeek/csapprox'
Bundle 'hlissner/vim-forrestgump'
Bundle 'kien/ctrlp.vim'
let g:ctrl_p_cache_dir = $HOME . '/.cache/ctrlp'

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

Bundle 'othree/yajs.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'leafgarland/typescript-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

Bundle 'kylef/apiblueprint.vim'

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

if executable('php')
  Bundle 'spf13/PIV'
  let g:DisableAutoPHPFolding = 1
endif

if executable('coffee')
  Bundle 'kchmck/vim-coffee-script'
endif

if executable('rails')
  Bundle 'tpope/vim-rails'
  let g:rails_gem_projections = {
        \ "pundit": {
        \   "app/policies/*_policy.rb": {
        \     "command": "policy",
        \     "affinity": "model",
        \     "alternate": "app/models/{}.rb"
        \ }}}
endif

if executable('ruby')
  Bundle 'tpope/vim-bundler'
  Bundle 'tpope/vim-haml'
  Bundle 'tpope/vim-cucumber'

  Bundle 'thoughtbot/vim-rspec'
  let g:rspec_command="!bundle exec rspec {spec}"
  let g:rspec_runner = "os_x_iterm"

  Bundle 'vim-ruby/vim-ruby'
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1

  Bundle 'nelstrom/vim-textobj-rubyblock'
  runtime macros/matchit.vim
endif

if executable('ag')
  Bundle 'mileszs/ack.vim'
  let g:ackprg = 'ag --vimgrep'

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable('lein')
  " Bundle 'guns/vim-clojure-static'
  Bundle 'tpope/vim-fireplace'
  Bundle 'tpope/vim-classpath'
endif

call vundle#end()

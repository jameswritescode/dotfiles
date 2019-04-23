call plug#begin('$DOTFILES/vim/plugged')

" General {{{
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Raimondi/delimitMate'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'justinmk/vim-syntax-extra'
Plug 'kana/vim-textobj-user'
Plug 'kylef/apiblueprint.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'moll/vim-node'
Plug 'nono/jquery.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/Io-programming-language-syntax'
Plug 'vim-scripts/applescript.vim'

Plug 'joshdick/onedark.vim'
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1

Plug 'junegunn/seoul256.vim'
let g:seoul256_background = 233

Plug 'hashivim/vim-terraform'
let g:terraform_commentstring = '//%s'
let g:terraform_fmt_on_save = 1

Plug 'janko-m/vim-test'
let test#ruby#rspec#executable = 'RAILS_ENV=test bundle exec rspec'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsEnableSnipMate= 0

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = ','

let g:user_emmet_settings = {
\ 'javascript.jsx' : {
\   'extends' : 'jsx'
\ }}

Plug 'vim-airline/vim-airline'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

Plug 'hlissner/vim-forrestgump'
let g:forrestgumps = {
\ 'elixir': ['elixir'],
\ 'haskell': ['runhaskell'],
\ 'io': ['io'],
\ 'rust': ['rustc'],
\}

Plug 'w0rp/ale'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:ale_linters = {
\ 'elixir': ['mix', 'dogma'],
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop', 'reek'],
\ 'typescript': ['tslint', 'typecheck'],
\}

let g:ale_graphql_gqlint_executable = $PWD . '/node_modules/.bin/gqlint'
let g:ale_javascript_eslint_executable = $PWD . '/node_modules/.bin/eslint'

" CoC Extensions:
" coc-css
" coc-html
" coc-json
" coc-python
" coc-rls
" coc-solargraph
" coc-tsserver
" coc-ultisnips
" coc-yaml
Plug 'neoclide/coc.nvim', {'do': {-> coc#util#install()}}

Plug 'tpope/vim-projectionist'
let g:projectionist_heuristics = {
\ '*.ex|*.exs': {
\   'lib/*.ex': { 'alternate': 'test/{}_test.exs', 'type': 'source' },
\   'test/*_test.exs': { 'alternate': 'lib/{}.ex', 'type': 'test' }
\ },
\ '*.js': {
\   '*.js': { 'alternate': '{}.test.js', 'type': 'source' },
\   '*.test.js': { 'alternate': '{}.js', 'type': 'test' }
\ },
\ '*.go': {
\   '*.go': { 'alternate': '{}_test.go', 'type': 'source' },
\   '*_test.go': { 'alternate': '{}.go', 'type': 'test' }
\ }
\}

Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'react'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'jameswritescode/vim-template'
let g:templates_directory = $DOTFILES . '/vim/templates'
let g:templates_no_builtin_templates = 1
let g:templates_tr_in =  ['.',  '*',  ':',  '(',  ')',  '|',  '%',                '&']
let g:templates_tr_out = ['\.', '.*', '\/', '\(', '\)', '\|', '\/[A-Z]\w\+\.jsx', '\/[a-z]\w\+\.jsx']

Plug 'mhinz/vim-startify'
let g:startify_custom_header = ['   ' . $PWD]

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

Plug 'neovimhaskell/haskell-vim'
let g:haskell_backpack = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_enable_typeroles = 1
" }}}

if executable('ruby') " Ruby {{{
  Plug 'tpope/vim-bundler'
  Plug 'sunaku/vim-ruby-minitest'
  Plug 'nelstrom/vim-textobj-rubyblock'

  Plug 'vim-ruby/vim-ruby'
  let g:ruby_indent_assignment_style = 'variable'
  let g:ruby_indent_block_style = 'do'
endif " }}}

if executable('rails') " Rails {{{
  Plug 'tpope/vim-rake'

  Plug 'tpope/vim-rails'
  let g:rails_gem_projections = {
        \ 'pundit': {
        \   'app/policies/*_policy.rb': {
        \     'command': 'policy',
        \     'affinity': 'model',
        \     'alternate': 'app/models/{}.rb'
        \   }
        \ },
        \ 'draper': {
        \   'app/decorators/*_decorator.rb': {
        \     'command': 'decorator',
        \     'affinity': 'model',
        \     'alternate': 'app/models/{}.rb'
        \   }
        \ },
        \ 'factory_girl': {
        \   'spec/factories/*_factory.rb': {
        \     'command': 'factory',
        \     'affinity': 'model',
        \     'alternate': 'app/models/{}.rb'
        \   }
        \ },
        \ 'statesman': {
        \   'app/state_machines/*.rb': {
        \     'command': 'machine'
        \   }
        \ },
        \ 'graphql': {
        \   'app/graphql/*.rb': {
        \     'command': 'gql'
        \   },
        \   'app/graphql/resolvers/*.rb': {
        \     'command': 'resolver'
        \   },
        \   'app/graphql/input_types/*_type.rb': {
        \     'command': 'input'
        \   },
        \   'app/graphql/types/*_type.rb': {
        \     'command': 'type'
        \   },
        \   'app/graphql/union_types/*_type.rb': {
        \     'command': 'union'
        \   },
        \   'app/graphql/mutations/*.rb': {
        \     'command': 'mutation'
        \   },
        \ }}

  let g:rails_projections = {
        \ 'app/models/interfaces/*_interface.rb': {
        \   'command': 'interface'
        \ },
        \ 'app/services/*.rb': {
        \   'command': 'service'
        \ },
        \ 'javascript/apps/*': {
        \   'command': 'js'
        \ }}
endif " }}}

if executable('go') " Go {{{
  Plug 'fatih/vim-go'
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
endif " }}}

if executable('tmux') " Tmux {{{
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
endif " }}}

if executable('git') " Git {{{
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

  Plug 'airblade/vim-gitgutter'
  highlight SignColumn term=underline ctermfg=101 ctermbg=232 guifg=#857b6f guibg=#121212

  let g:gitgutter_sign_added='┃'
  let g:gitgutter_sign_modified='┃'
  let g:gitgutter_sign_removed='◢'
  let g:gitgutter_sign_removed_first_line='◥'
  let g:gitgutter_sign_modified_removed='◢'
endif " }}}

if executable('tsserver') " TypeScript {{{
  Plug 'HerringtonDarkholme/yats.vim'
endif " }}}

if executable('swift') " Swift {{{
  Plug 'keith/swift.vim'
endif " }}}

if executable('elixir') " Elixir {{{
  Plug 'elixir-editors/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  Plug 'c-brenn/phoenix.vim'

  Plug 'mhinz/vim-mix-format'
  let g:mix_format_on_save = 1
endif " }}}

if executable('rustc') " Rust {{{
  Plug 'racer-rust/vim-racer'
  let g:racer_experimental_completer = 1

  Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave = 1
endif " }}}

if executable('lein') " Clojure {{{
  Plug 'guns/vim-clojure-highlight'
  Plug 'tpope/vim-classpath', {'for': 'clojure'}
  Plug 'tpope/vim-fireplace', {'for': 'clojure'}
endif " }}}

if executable('lua') " Lua {{{
  Plug 'tbastos/vim-lua'
  Plug 'xolox/vim-misc'

  Plug 'xolox/vim-lua-ftplugin'
  let g:lua_complete_omni = 1
  let g:lua_check_syntax = 0
  let g:lua_complete_dynamic = 0
  let g:lua_define_completion_mappings = 0
endif " }}}

call plug#end()

runtime! marcos/matchit.vim

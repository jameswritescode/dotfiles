scriptencoding utf-8

call plug#begin('$HOME/dotfiles/vim/plugged')

" General {{{
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'chr4/nginx.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'justinmk/vim-syntax-extra'
Plug 'jxnblk/vim-mdx-js'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'keith/rspec.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'moll/vim-node'
Plug 'nono/jquery.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'othree/html5.vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'sbdchd/neoformat', {'on': 'Neoformat'}
Plug 'solarnz/thrift.vim'
Plug 'tbastos/vim-lua'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/Io-programming-language-syntax'
Plug 'vim-scripts/applescript.vim'

Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['vim', 'typescript', 'help']

Plug 'liuchengxu/graphviz.vim'
let g:graphviz_shell_option = '-Kcirco'

Plug 'thinca/vim-template'
augroup vimTemplate
  au!
  autocmd User plugin-template-loaded
        \   if search('<+CURSOR+>')
        \ |   execute 'normal! "_da>'
        \ |   execute 'startinsert'
        \ | endif
augroup END

Plug 'andymass/vim-matchup'
let g:matchup_matchparen_deferred = 1

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

Plug 'liuchengxu/vim-which-key', {'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual', 'WhichKeyVisual!']}
let g:which_key_hspace = 40
let g:which_key_use_floating_win = 1

Plug 'joshdick/onedark.vim'
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1

Plug 'hashivim/vim-terraform'
let g:terraform_commentstring = '//%s'
let g:terraform_fmt_on_save = 1

Plug 'janko-m/vim-test', {'on': ['TestNearest', 'TestFile']}
let test#ruby#rspec#executable = 'RAILS_ENV=test bundle exec rspec'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsEnableSnipMate= 0

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = ','

let g:user_emmet_settings = {
\ 'javascript' : {
\   'extends' : 'jsx'
\ }}

Plug 'dense-analysis/ale'
let g:ale_graphql_gqlint_executable = $PWD . '/node_modules/.bin/gqlint'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_sign_error = '●'
let g:ale_sign_warning = g:ale_sign_error

" TODO: Disable sh and install coc-sh once tree-sitter supports node 12:
" https://github.com/tree-sitter/node-tree-sitter/pull/45
let g:ale_linters = {
      \ 'c': [],
      \ 'elixir': [],
      \ 'javascript': [],
      \ 'javascriptreact': [],
      \ 'python': [],
      \ 'ruby': ['reek'],
      \ 'swift': [],
      \ 'typescript': [],
      \ 'typescriptreact': [],
      \ 'zsh': ['shell', 'shellcheck'],
      \ }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-elixir',
      \ 'coc-eslint',
      \ 'coc-flow',
      \ 'coc-git',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-rls',
      \ 'coc-smartf',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-ultisnips',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ ]

let g:coc_filetype_map = {
      \ 'rspec.ruby': 'ruby',
      \ }

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

Plug trim(system('brew --prefix')).'/opt/fzf'
Plug $HOME.'/.fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

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
  Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}

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
        \ 'factory_bot': {
        \   'spec/factories/*.rb': {
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
        \   'app/graphql/input_types/*_input.rb': {
        \     'command': 'input'
        \   },
        \   'app/graphql/types/*.rb': {
        \     'command': 'type'
        \   },
        \   'app/graphql/mutations/*.rb': {
        \     'command': 'mutation'
        \   },
        \ }}

  let g:rails_projections = {
        \ 'app/services/*.rb': {
        \   'command': 'service'
        \ },
        \ 'javascript/apps/*': {
        \   'command': 'js'
        \ }}
endif " }}}

if executable('go') " Go {{{
  Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'for': 'go'}
  let g:go_code_completion_enabled = 0
  let g:go_doc_keywordprg_enabled = 0
endif " }}}

if executable('tmux') " Tmux {{{
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
endif " }}}

if executable('git') " Git {{{
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
endif " }}}

if executable('swift') " Swift {{{
  Plug 'keith/swift.vim'
endif " }}}

if executable('elixir') " Elixir {{{
  Plug 'andyl/vim-textobj-elixir'
  Plug 'c-brenn/phoenix.vim'
  Plug 'elixir-editors/vim-elixir'
endif " }}}

if executable('rustc') " Rust {{{
  Plug 'rust-lang/rust.vim'
endif " }}}

if executable('lein') " Clojure {{{
  Plug 'guns/vim-clojure-highlight'
  Plug 'tpope/vim-classpath', {'for': 'clojure'}
  Plug 'tpope/vim-fireplace', {'for': 'clojure'}
endif " }}}

call plug#end()

scriptencoding utf-8

call plug#begin('$HOME/dotfiles/vim/plugged')

" neovim
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-autopairs'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

Plug 'RRethy/nvim-treesitter-endwise'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'omnisyle/nvim-hidesig'

" General {{{
Plug 'AndrewRadev/switch.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'diepm/vim-rest-console'
Plug 'editorconfig/editorconfig-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'keith/rspec.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mracos/mermaid.vim'
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

Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_ruby_hanging_args = 0

Plug 'lifepillar/pgsql.vim'
let g:sql_type_default = 'pgsql'

Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['vim', 'typescript', 'help']

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

" Plug 'joshdick/onedark.vim'
" let g:onedark_hide_endofbuffer = 1
" let g:onedark_terminal_italics = 1

Plug 'navarasu/onedark.nvim'

Plug 'janko-m/vim-test', {'on': ['TestNearest', 'TestFile']}
let test#ruby#rspec#executable = 'RAILS_ENV=test bundle exec rspec'

Plug 'SirVer/ultisnips'
let g:UltiSnipsEnableSnipMate= 0

Plug 'mattn/emmet-vim'

let g:user_emmet_settings = {
\ 'javascript' : {
\   'extends' : 'jsx'
\ }}

Plug 'dense-analysis/ale'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_sign_error = '●'
let g:ale_sign_warning = g:ale_sign_error

let g:ale_linters = {
      \ 'c': [],
      \ 'elixir': [],
      \ 'eruby': ['erblint'],
      \ 'go': [],
      \ 'javascript': [],
      \ 'javascriptreact': [],
      \ 'python': [],
      \ 'ruby': ['reek'],
      \ 'sh': [],
      \ 'swift': [],
      \ 'typescript': [],
      \ 'typescriptreact': [],
      \ 'zsh': ['shell', 'shellcheck'],
      \ }

" Plug 'tpope/vim-projectionist'
" let g:projectionist_heuristics = {
" \ '*.ex|*.exs': {
" \   'lib/*.ex': { 'alternate': 'test/{}_test.exs', 'type': 'source' },
" \   'test/*_test.exs': { 'alternate': 'lib/{}.ex', 'type': 'test' }
" \ },
" \ '*.js': {
" \   '*.js': { 'alternate': '{}.test.js', 'type': 'source' },
" \   '*.test.js': { 'alternate': '{}.js', 'type': 'test' }
" \ },
" \ '*.go': {
" \   '*.go': { 'alternate': '{}_test.go', 'type': 'source' },
" \   '*_test.go': { 'alternate': '{}.go', 'type': 'test' }
" \ }
" \}

if executable('ruby') " Ruby {{{
  Plug 'sunaku/vim-ruby-minitest'
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
  let g:go_fmt_fail_silently = 1
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
  Plug 'c-brenn/phoenix.vim'
  Plug 'elixir-editors/vim-elixir'
endif " }}}

if executable('rustc') " Rust {{{
  Plug 'rust-lang/rust.vim'
endif " }}}

call plug#end()

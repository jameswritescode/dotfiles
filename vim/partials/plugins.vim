set rtp+=~/dotfiles/vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin('~/dotfiles/vim/bundle')

call dein#add('Shougo/dein.vim')

" Consider using https://github.com/sheerun/vim-polyglot in the future?

" General

call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-vinegar')
call dein#add('tpope/vim-speeddating')
call dein#add('godlygeek/tabular')
call dein#add('godlygeek/csapprox')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('AndrewRadev/switch.vim')
call dein#add('Raimondi/delimitMate')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('kana/vim-textobj-user')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')
call dein#add('skywind3000/asyncrun.vim')

call dein#add('vim-airline/vim-airline')
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts = 1

call dein#add('hlissner/vim-forrestgump')
let g:forrestgumps = {}

call dein#add('janko-m/vim-test')
let test#strategy = 'dispatch'

call dein#add('luochen1990/rainbow')
let g:rainbow_active = 1

call dein#add('myusuf3/numbers.vim')
let g:numbers_exclude = ['tagbar', '']

call dein#add('Shougo/neosnippet')
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/dotfiles/vim/bundle/repos/vim-snippets/snippets'

call dein#add('neomake/neomake')
autocmd! BufWritePost * Neomake
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
let g:neomake_javascript_enabled_makers = ['jscs', 'jshint']
let g:neomake_go_enabled_makers = [] " Disabled in favor of vim-go functionality

call dein#add('tpope/vim-projectionist')
let g:projectionist_heuristics = {}

call dein#add('junegunn/seoul256.vim')
let g:seoul256_background = 233

call dein#add('wincent/terminus')
let g:TerminusNormalCursorShape = 2

" Language specific

call dein#add('cespare/vim-toml')
call dein#add('kylef/apiblueprint.vim')
call dein#add('tpope/vim-markdown')
call dein#add('othree/yajs.vim')
call dein#add('digitaltoad/vim-jade')
call dein#add('nono/jquery.vim')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('mxw/vim-jsx')
call dein#add('pangloss/vim-javascript')
call dein#add('elzr/vim-json')

" Executable required

if executable('coffee')
  call dein#add('kchmck/vim-coffee-script')
endif

if executable('ctags')
  call dein#add('majutsushi/tagbar')
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

if executable('git')
  call dein#add('gregsexton/gitv')
  call dein#add('tpope/vim-git')
  call dein#add('tpope/vim-fugitive')

  call dein#add('airblade/vim-gitgutter')
  highlight SignColumn term=underline ctermfg=101 ctermbg=232 guifg=#857b6f guibg=#121212
endif

if executable('go')
  call dein#add('fatih/vim-go')
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

  let g:projectionist_heuristics['*.go'] = {
        \ '*.go': { 'alternate': '{}_test.go', 'type': 'source' },
        \ '*_test.go': { 'alternate': '{}.go', 'type': 'test' }
        \}

  if has('nvim')
    call dein#add('zchee/deoplete-go', {'build': 'make'})
  endif
endif

if executable('iex')
  call dein#add('elixir-lang/vim-elixir')
endif

if executable('lein')
  call dein#add('tpope/vim-fireplace')
  call dein#add('tpope/vim-classpath')
  call dein#add('guns/vim-clojure-highlight')
endif

if has('lua')
  call dein#add('Shougo/neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
elseif has('nvim')
  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
else
  call dein#add('ervandew/supertab')
endif

if executable('lua')
  call dein#add('tbastos/vim-lua')
  call dein#add('xolox/vim-misc')

  call dein#add('xolox/vim-lua-ftplugin')
  let g:lua_complete_omni = 1
endif

if executable('php')
  call dein#add('spf13/PIV')
  let g:DisableAutoPHPFolding = 1
endif

if executable('python') || executable('python3')
  call dein#add('python-mode/python-mode')
  let g:pymode_lint = 0
  let g:pymode_rope = 0
  let g:pymode_folding = 0

  if has('nvim')
    call dein#add('zchee/deoplete-jedi')
  endif
endif

if executable('rails')
  call dein#add('tpope/vim-rake')

  call dein#add('tpope/vim-rails')
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
        \ },
        \ "factory_girl": {
        \   "test/factories/*_factories.rb": {
        \     "command": "factory",
        \     "affinity": "model",
        \     "alternate": "app/models/{}.rb"
        \   }
        \ }}
endif

if executable('ruby')
  call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-haml')
  call dein#add('tpope/vim-cucumber')
  call dein#add('sunaku/vim-ruby-minitest')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })

  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

  call dein#add('vim-ruby/vim-ruby')
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1

  call dein#add('nelstrom/vim-textobj-rubyblock')
  runtime macros/matchit.vim

  if executable('rubocop')
    call dein#add('mattn/vim-rubyfmt')
    let g:rubyfmt_autoopen = 0
  endif
endif

if executable('rustc')
  call dein#add('racer-rust/vim-racer')
  let g:racer_experimental_completer = 1

  call dein#add('rust-lang/rust.vim')
  let g:rustfmt_autosave = 1

  let g:forrestgumps['rust'] = ['rustc']
endif

if executable('swift')
  call dein#add('keith/swift.vim')
endif

if executable('tmux')
  call dein#add('tpope/vim-tbone')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux')
endif

if executable('tsc')
  call dein#add('Quramy/tsuquyomi')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('HerringtonDarkholme/yats.vim')
endif

call dein#end()
call dein#save_state()

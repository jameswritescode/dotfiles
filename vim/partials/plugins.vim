set runtimepath+=~/dotfiles/vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin('~/dotfiles/vim/bundle')

call dein#load_toml('$DOTFILES/vim/partials/plugins.toml')

call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}

" Language specific

call dein#add('cespare/vim-toml')
call dein#add('kylef/apiblueprint.vim')
call dein#add('tpope/vim-markdown')
call dein#add('othree/yajs.vim')
call dein#add('digitaltoad/vim-jade')
call dein#add('nono/jquery.vim')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('pangloss/vim-javascript')
call dein#add('elzr/vim-json')
call dein#add('mattn/emmet-vim')
call dein#add('tpope/vim-haml')
call dein#add('slime-lang/vim-slime-syntax')

call dein#add('mxw/vim-jsx')
let g:jsx_ext_required = 0

" Executable required

if executable('clang')
  call dein#add('tweekmonster/deoplete-clang2')
endif

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
  call dein#add('tpope/vim-rhubarb')

  call dein#add('shumphrey/fugitive-gitlab.vim')
  let g:fugitive_gitlab_domains = ['https://git.zaphyous.com', 'https://dev.whatpul.se']

  call dein#add('airblade/vim-gitgutter')
  highlight SignColumn term=underline ctermfg=101 ctermbg=232 guifg=#857b6f guibg=#121212
endif

if executable('go')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })

  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

  call dein#add('fatih/vim-go', {'on_ft': 'go'})
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

  call dein#add('zchee/deoplete-go', {'build': 'make', 'on_ft': 'go'})
endif

if executable('elixir')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('c-brenn/phoenix.vim')
endif

if executable('lein')
  call dein#add('tpope/vim-fireplace')
  call dein#add('tpope/vim-classpath')
  call dein#add('guns/vim-clojure-highlight')
endif

if executable('lua')
  call dein#add('tbastos/vim-lua', {'on_ft': 'lua'})
  call dein#add('xolox/vim-misc', {'on_ft': 'lua'})

  call dein#add('xolox/vim-lua-ftplugin', {'on_ft': 'lua'})
  let g:lua_complete_omni = 1
  let g:lua_check_syntax = 0
  let g:lua_complete_dynamic = 0
  let g:lua_define_completion_mappings = 0
  let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
endif

if executable('node')
  call dein#add('moll/vim-node')
  call dein#add('othree/jspc.vim')

  call dein#add('ternjs/tern_for_vim', {'on_ft': 'javascript', 'build': 'npm install'})
  let g:tern_show_signature_in_pum = 1

  let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']
endif

if executable('php')
  call dein#add('spf13/PIV', {'on_ft': 'php'})
  let g:DisableAutoPHPFolding = 1
endif

if executable('python') || executable('python3')
  call dein#add('python-mode/python-mode', {'on_ft': 'python'})
  let g:pymode_lint = 0
  let g:pymode_rope = 0
  let g:pymode_folding = 0

  call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
endif

if executable('rails')
  call dein#add('tpope/vim-rake')

  call dein#add('tpope/vim-rails')
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
        \   'test/factories/*_factories.rb': {
        \     'command': 'factory',
        \     'affinity': 'model',
        \     'alternate': 'app/models/{}.rb'
        \   }
        \ },
        \ 'statesman': {
        \   'app/state_machines/*.rb': {
        \     'command': 'state'
        \   }
        \ }}

  let g:rails_projections = {
        \ 'app/services/*.rb': {
        \     'command': 'service'
        \ }}
endif

if executable('ruby')
  call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-cucumber')
  call dein#add('sunaku/vim-ruby-minitest')

  call dein#add('vim-ruby/vim-ruby')
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1

  call dein#add('nelstrom/vim-textobj-rubyblock')
  runtime macros/matchit.vim
endif

if executable('rustc')
  call dein#add('racer-rust/vim-racer', {'on_ft': 'rust'})
  let g:racer_experimental_completer = 1

  call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
  let g:rustfmt_autosave = 1
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

set runtimepath+=~/dotfiles/vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/vim/bundle')
  call dein#begin('~/dotfiles/vim/bundle')

  call dein#load_toml('$DOTFILES/vim/partials/dein/general.toml')

  call dein#load_toml('$DOTFILES/vim/partials/dein/clojure.toml', {'if': 'executable("lein")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/coffee.toml', {'if': 'executable("coffee")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/ctags.toml', {'if': 'executable("ctags")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/elixir.toml', {'if': 'executable("elixir")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/git.toml', {'if': 'executable("git")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/go.toml', {'if': 'executable("go")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/lua.toml', {'if': 'executable("lua")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/node.toml', {'if': 'executable("node")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/php.toml', {'if': 'executable("php")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/python.toml', {'if': 'executable("python") || executable("python3")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/rails.toml', {'if': 'executable("rails")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/ruby.toml', {'if': 'executable("ruby")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/rust.toml', {'if': 'executable("rustc")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/swift.toml', {'if': 'executable("swift")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/tmux.toml', {'if': 'executable("tmux")'})
  call dein#load_toml('$DOTFILES/vim/partials/dein/typescript.toml', {'if': 'executable("tsc")'})

  call dein#end()
  call dein#save_state()
endif

call dein#call_hook('source')

runtime! marcos/matchit.vim

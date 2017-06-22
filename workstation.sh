puts "Setting up Workstation..."

defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
brew bundle

# git
ln -s $PWD/git/.gitconfig $HOME/.gitconfig

# zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm $HOME/.zshrc && ln -s $PWD/zsh/.zshrc $HOME/.zshrc
touch $HOME/.zsh_custom

pushd $HOME/dotfiles/zsh/custom/plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting
popd

# ctags
ln -s $PWD/.ctags $HOME/.ctags

# hammerspoon
ln -s $PWD/hammerspoon $HOME/.hammerspoon

# ruby
ruby-install --latest ruby
chruby ruby
ruby -v | awk {'print "! [ -f \"$PWD/.ruby-version\" ] && chruby " $2'} >> $HOME/.zsh_custom
gem install gem-ctags
gem ctags
gem install bundler tmuxinator rubocop

if  [[ "$OSTYPE" == "darwin"* ]]; then
  local BUNDLE_JOBS=`expr $(sysctl -n hw.ncpu) - 1`
else
  local BUNDLE_JOBS=`expr $(nproc) - 1`
fi

bundle config --global jobs $BUNDLE_JOBS

# tmux
ln -s $PWD/tmux/.tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node

# rust
curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src
rust_toolchain=`rustup toolchain list | awk {'print $1'}`
echo "export RUST_SRC_PATH=\"\$HOME/.multirust/toolchains/$rust_toolchain/lib/rustlib/src/rust/src\"" >> $HOME/.zsh_custom
cargo install rustfmt
cargo install racer

# go
go get -u github.com/nsf/gocode

# neovim
mkdir -p $HOME/dotfiles/vim/bundle/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim vim/bundle/repos/github.com/Shougo/dein.vim
mkdir -p $HOME/.config
ln -s $PWD/vim $HOME/.config/nvim
gem install neovim
pip3 install virtualenv
virtualenv -p python2 $PWD/vim/virtual/python2
$PWD/vim/virtual/python2/bin/pip install neovim
virtualenv -p python3 $PWD/vim/virtual/python3
$PWD/vim/virtual/python3/bin/pip install neovim

echo "Workstation setup complete."

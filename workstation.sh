puts "Setting up Workstation"

defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
brew bundle

ln -s $PWD/.gitconfig $HOME/.gitconfig

ln -s $PWD/vim/.vimrc $HOME/.vimrc
ln -s $PWD/vim $HOME/.vim
git clone http://github.com/VundleVim/Vundle.vim vim/bundle/Vundle.vim
vim +PluginInstall +qa

chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm $HOME/.zshrc && ln -s $PWD/zsh/.zshrc $HOME/.zshrc
touch $HOME/.zsh_custom

ln -s $PWD/hammerspoon $HOME/.hammerspoon

ruby-install --latest ruby
chruby ruby
ruby -v | awk {'print "chruby " $2'} >> $HOME/.zsh_custom
gem install bundler
gem install tmuxinator

ln -s $PWD/tmux/.tmux.conf $HOME/.tmux.conf

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node

curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src
cargo install rustfmt
cargo install racer

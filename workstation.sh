puts "Setting up Workstation"

defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install google-chrome
brew cask install bitbar
brew cask install bartender
brew cask install docker
brew cask install spotify
brew cask install iterm2-nightly

brew install fasd
brew install go
brew install rust

brew install git
ln -s $PWD/.gitconfig $HOME/.gitconfig

brew install vim --with-lua --with-luajit
ln -s $PWD/vim/.vimrc $HOME/.vimrc
git clone http://github.com/VundleVim/Vundle.vim vim/bundle/Vundle.vim
vim +PluginInstall +qa

brew install zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm $HOME/.zshrc && ln -s $PWD/zsh/.zshrc $HOME/.zshrc
touch $HOME/.zsh_custom

brew install chruby --HEAD
brew install ruby-install --HEAD
ruby-install --latest ruby

brew install tmux
ln -s $PWD/tmux/.tmux.conf $HOME/.tmux.conf

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node

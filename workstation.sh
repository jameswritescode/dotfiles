DOTFILES=$HOME/dotfiles

puts "Setting up Workstation..."

sudo defaults write com.apple.dock autohide -bool true
sudo defaults write NSGlobalDomain KeyRepeat -int 1
sudo defaults write NSGlobalDomain InitialKeyRepeat -int 10

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
mkdir -p "$HOME/.config"
ln -s "$DOTFILES/kitty.conf" "$HOME/.config/kitty.conf"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
brew bundle

# gpg
cp "$DOTFILES/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"

# git
ln -s "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

# zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm "$HOME/.zshrc" && ln -s "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
touch "$HOME/.zsh_custom"
zplug install

# ctags
ln -s "$DOTFILES/.ctags" "$HOME/.ctags"

# hammerspoon
ln -s "$DOTFILES/hammerspoon" "$HOME/.hammerspoon"

# ruby
ruby-install --latest ruby
chruby ruby
ruby -v | awk {'print "! [ -f \"$PWD/.ruby-version\" ] && chruby " $2'} >> "$HOME/.zsh_custom"
gem install gem-ctags
gem ctags
gem install bundler tmuxinator rubocop reek

if  [[ "$OSTYPE" == "darwin"* ]]; then
  BUNDLE_JOBS=$(($(sysctl -n hw.ncpu) - 1))
else
  BUNDLE_JOBS=$(($(nproc) - 1))
fi

bundle config --global jobs $BUNDLE_JOBS

# tmux
ln -s "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node

# rust
curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src
rustup component add rust-docs
rust_toolchain=$(rustup toolchain list | awk {'print $1'})
echo "export RUST_SRC_PATH=\"\$HOME/.multirust/toolchains/$rust_toolchain/lib/rustlib/src/rust/src\"" >> "$HOME/.zsh_custom"
cargo install rustfmt
cargo install racer

# go
go get -u github.com/nsf/gocode

# neovim
mkdir -p "$HOME/dotfiles/vim/bundle/repos/github.com/Shougo/dein.vim"
git clone https://github.com/Shougo/dein.vim vim/bundle/repos/github.com/Shougo/dein.vim
ln -s "$DOTFILES/vim" "$HOME/.config/nvim"
./vim/hosts.sh install

echo "Workstation setup complete."

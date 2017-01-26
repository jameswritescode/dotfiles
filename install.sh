echo 'Installing dotfiles...'

echo ' - Linking zsh files'
ln -s .zshrc $HOME/.zshrc
touch $HOME/.zsh_custom
mkdir -p $HOME/.oh-my-zsh/custom/themes/bureau-james.zsh-theme zsh/custom/themes/bureau-james.zsh-theme

echo ' - Linking tmux config'
ln -s .tmux.conf $HOME/.tmux.conf

echo ' - Linking global git config'
ln -s .gitconfig $HOME/.gitconfig

echo 'Installation successful'

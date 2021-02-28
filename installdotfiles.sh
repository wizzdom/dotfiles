#!/bin/sh
echo "Install dotfiles?"
echo "(Press ENTER to continue...)"
read

cd $HOME/
echo 'Cloning Repo' 
git clone --recursive https://github.com/wizzdom/dotfiles $HOME/.dotfiles
### Symlinks
echo 'Making Symbolic Links'
# ZSH 
ln -sf $HOME/.dotfiles/zsh/.zprofile $HOME/.zprofile
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/zsh/.zshenv $HOME/.zshenv
ln -sf $HOME/.dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh

ln -sf $HOME/.dotfiles/.nvidia-settings-rc $HOME/nvidia-settings-rc
#  Git
ln -sf $HOME/.dotfiles/.gitconfig_global $HOME/.gitconfig
# Vim
ln -sf $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/.vim/ $HOME/.vim
# Awesome WM 
ln -sf $HOME/.dotfiles/.config/awesome/ $HOME/.config/awesome/
# application configs (.config)
ln -sf $HOME/.dotfiles/.config/terminator/config $HOME/.config/terminator/config
ln -sf $HOME/.dotfiles/.config/neofetch/config.conf $HOME/.config/neofetch/config.conf
ln -sf $HOME/.dotfiles/.config/fontconfig $HOME/.config/fontconfig
ln -sf $HOME/.dotfiles/.config/htop $HOME/.config/htop/
# ln -sf $HOME/.dotfiles/.config/remmina/remmina.pref $HOME/.config/remmina/remmina.pref
ln -sf $HOME/.dotfiles/.config/pcmanfm $HOME/.config/pcmanfm
ln -sf $HOME/.dotfiles/.config/pnmixer $HOME/.config/pnmixer

echo 'done.'

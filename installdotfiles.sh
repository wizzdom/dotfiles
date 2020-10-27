#!/bin/sh

cd ~/
echo 'Cloning Repo' 
git clone --recursive https://github.com/wizzdom/dotfiles ~/.dotfiles
### Symlinks
echo 'Making Symbolic Links'
# ZSH links
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -sf ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

ln -sf ~/.dotfiles/.nvidia-settings-rc ~/nvidia-settings-rc
#  Git
ln -sf ~/.dotfiles/.gitconfig_global ~/.gitconfig
# Vim
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.vim/ ~/.vim
# Awesome WM (material-awesome)
ln -sf ~/.dotfiles/.config/awesome/ ~/.config/awesome/
# application configs (.config)
ln -sf ~/.dotfiles/.config/terminator/config ~/.config/terminator/config
ln -sf ~/.dotfiles/.config/neofetch/config.conf ~/.config/neofetch/config.conf
ln -sf ~/.dotfiles/.config/fontconfig ~/.config/fontconfig
ln -sf ~/.dotfiles/.config/htop/htoprc ~/.config/htop/htoprc
ln -sf ~/.dotfiles/.config/remmina/remmina.pref ~/.config/remmina/remmina.pref
ln -sf ~/.dotfiles/.config/pcmanfm ~/.config/pcmanfm
ln -sf ~/.dotfiles/.config/pnmixer/config ~/.config/pnmixer/config

echo 'done.'

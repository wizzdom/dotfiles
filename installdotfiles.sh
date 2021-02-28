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
ln -sf $HOME/.dotfiles/.config/terminator $HOME/.config/
ln -sf $HOME/.dotfiles/.config/neofetch $HOME/.config/
ln -sf $HOME/.dotfiles/.config/fontconfig $HOME/.config/
ln -sf $HOME/.dotfiles/.config/htop $HOME/.config/
# ln -sf $HOME/.dotfiles/.config/remmina/remmina.pref $HOME/.config/remmina/remmina.pref
ln -sf $HOME/.dotfiles/.config/pcmanfm $HOME/.config/
ln -sf $HOME/.dotfiles/.config/pnmixer $HOME/.config/
ln -sf $HOME/.dotfiles/.config/news-flash $HOME/.config/
ln -sf $HOME/.dotfiles/.config/screenlayout $HOME/.config/
ln -sf $HOME/.dotfiles/.config/rofi $HOME/.config/
ln -sf $HOME/.dotfiles/.config/viper4linux $HOME/.config/
ln -sf $HOME/.dotfiles/.config/alacritty $HOME/.config/
ln -sf $HOME/.dotfiles/.config/redshift $HOME/.config/
ln -sf $HOME/.dotfiles/.config/paru  $HOME/.config/
ln -sf $HOME/.dotfiles/.config/sxhkd  $HOME/.config/
ln -sf $HOME/.dotfiles/.config/cantata  $HOME/.config/
ln -sf $HOME/.dotfiles/.config/nvim  $HOME/.config/
ln -sf $HOME/.dotfiles/.config/X11  $HOME/.config/

ln -sf $HOME/.dotfiles/.config/linux-steam-integration.conf $HOME/.config/
ln -sf $HOME/.dotfiles/.config/pavucontrol.ini  $HOME/.config/
ln -sf $HOME/.dotfiles/.config/mimeapps.list  $HOME/.config/
echo 'done.'

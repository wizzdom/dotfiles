# zsh

My ZSH Config - forked from [ChrisTitusTech](https://github.com/ChrisTitusTech/zsh)

## Setup

```
cd ~/
git clone --recursive https://github.com/wizzdom/zsh
ln -s -f ~/zsh/.zshrc ~/.zshrc
ln -s -f ~/zsh/.p10k.zsh ~/.p10k.zsh
touch "~/.cache/zshhistory"
```

### Get Dependencies

- **zsh** - _obviously!_
- **zsh-syntax-highlighting** - syntax highlighting for ZSH in standard repos
- **autojump** - jump to directories with `j` or `jc` for child or `jo` to open in file manager
- **zsh-autosuggestions** - Suggestions based on your history

### Arch linux

```
yay -S --needed zsh zsh-syntax-highlighting autojump zsh-autosuggestions
```

### Ubuntu/Debian

```
sudo apt install zsh zsh-syntax-highlighting autojump zsh-autosuggestions
```

_powerlevel10k prompt is included as a git submodule (it will be downloaded as part of the git clone)_

Finish the conversion by changing your user in `/etc/passwd` to `/bin/zsh` instead of `/bin/bash` or by typing `chsh $USER` and entering `/bin/zsh`

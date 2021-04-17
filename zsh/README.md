# ZSH

My ZSH Config initially forked from [ChrisTitusTech](https://github.com/ChrisTitusTech/zsh), but now is more customised to my workflow.

## Standalone Setup
Use the commands below for manual standalone installation.
```
cd $HOME
mkdir -p $HOME/zsh
curl -L https://raw.githubusercontent.com/wizzdom/dotfiles/master/.zshrc > $HOME/zsh/.zshrc
curl -L https://raw.githubusercontent.com/wizzdom/dotfiles/master/zsh/aliasrc > $HOME/zsh/aliasrc
curl -l https://raw.githubusercontent.com/wizzdom/dotfiles/master/zsh/.zprofile > $HOME/zsh/.zprofile
curl -L https://raw.githubusercontent.com/wizzdom/dotfiles/master/zsh/.zshenv > $HOME/zsh/zshenv
curl -L https://raw.githubusercontent.com/wizzdom/dotfiles/master/zsh/.p10k.zsh > $HOME/zsh/.p10k.zsh
curl -L https://raw.githubusercontent.com/wizzdom/dotfiles/master/zsh/ghcli.zsh > $HOME/zsh/ghcli.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/zsh/powerlevel10k
ln -s -f ~/zsh/.zshrc ~/.zshrc
ln -s -f ~/zsh/.p10k.zsh ~/.p10k.zsh
touch "~/.cache/zshhistory"
```

### Get Dependencies

- **zsh** - _obviously!_
- **zsh-syntax-highlighting** - syntax highlighting for ZSH in standard repos
- **autojump** - jump to directories with `j` or `jc` for child or `jo` to open in file manager
- **zsh-autosuggestions** - Suggestions based on your history

### Arch linux (paru)

```
paru -S --needed zsh zsh-syntax-highlighting autojump zsh-autosuggestions
```

### Ubuntu/Debian

```
sudo apt install zsh zsh-syntax-highlighting autojump zsh-autosuggestions
```

Finish the conversion by changing your user in `/etc/passwd` to `/bin/zsh` instead of `/bin/bash` or by typing `chsh $USER` and entering `/bin/zsh`

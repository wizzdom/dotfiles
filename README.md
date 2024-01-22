# dotfiles :computer:

All of my dotfiles in one place for convenience and easy setup :sunglasses:

## Setup
### Install yadm

```bash
# Arch Linux
sudo pacman -S yadm

# Other
curl -fLo $HOME/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x $HOME/.local/bin/yadm
```

### Clone dotfiles

```bash
# Clone with https
yadm clone https://github.com/wizzdom/dotfiles.git
# or
# Clone with ssh
yadm clone git@github.com:wizzdom/dotfiles.git
```

### Required fonts

These fonts are required for various parts of the dotfiles *(e.g. statusbar icons)* to work properly.

```bash
paru -S --needed adobe-source-code-pro-fonts \
adobe-source-han-sans-cn-fonts \
adobe-source-han-sans-hk-fonts \
adobe-source-han-sans-jp-fonts \
adobe-source-han-sans-kr-fonts \
adobe-source-han-sans-otc-fonts \
adobe-source-han-sans-tw-fonts \
awesome-terminal-fonts \
cantarell-fonts \
consolas-font \
gnu-free-fonts \
gsfonts \
inter-font \
libfontenc \
libxfont2 \
noto-fonts \
noto-fonts-sc \
otf-font-awesome \
powerline-fonts \
python-fonttools \
ttf-font-awesome \
ttf-meslo-nerd-font-powerlevel10k \
ttf-ms-fonts \
ttf-nerd-fonts-symbols \
ttf-nerd-fonts-symbols-common \
ttf-ubuntu-font-family \
xorg-font-util \
xorg-fonts-encodings \
xorg-fonts-type1
```
---

## ZSH

### Get Dependencies

- **zsh** - _obviously!_
- **zsh-syntax-highlighting** - syntax highlighting for ZSH in standard repos
- **autojump** - jump to directories with `j` or `jc` for child or `jo` to open in file manager
- **zsh-autosuggestions** - Suggestions based on your history

### Arch linux (paru)

```bash
paru -S --needed zsh zsh-syntax-highlighting autojump zsh-autosuggestions
```

### Ubuntu/Debian

```bash
sudo apt install zsh zsh-syntax-highlighting autojump zsh-autosuggestions
```

Finish the conversion by changing your user in `/etc/passwd` to `/bin/zsh` instead of `/bin/bash` or by typing `chsh $USER` and entering `/bin/zsh`

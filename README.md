# dotfiles

All of my dotfiles in one place for convenience...

## Setup
### Clone the repo

```bash
cd $HOME
git clone --recursive https://github.com/wizzdom/dotfiles $HOME/.dotfiles
```

### Setup Symlinks

Requires GNU Stow.
```bash
cd $HOME/.dotfiles
# to add all configs:
stow */

# or to add specific configs (e.g. awesome):
stow awesome
```

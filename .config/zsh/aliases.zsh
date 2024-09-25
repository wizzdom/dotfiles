#         _  _                                      _
#   __ _ | |(_)  __ _  ___   ___  ___     ____ ___ | |__
#  / _` || || | / _` |/ __| / _ \/ __|   |_  // __|| '_ \
# | (_| || || || (_| |\__ \|  __/\__ \ _  / / \__ \| | | |
#  \__,_||_||_| \__,_||___/ \___||___/(_)/___||___/|_| |_|
#

# # ex - archive extractor
# # usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.osk)       unzip $1     ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Pacman aliases
alias pacmirrors='sudo systemctl start reflector.service' # refresh and rank mirrors with reflector
alias killtheorphans="sudo pacman -Qtdq | sudo pacman -Rns -" # Remove packages no longer required
alias kto="sudo pacman -Qtdq | sudo pacman -Rns -" # Remove packages no longer required (Short)
alias garbage="sudo paccache -rk 1" # Remove old package cache, keeping last 1

# Use eza instead of ls if available
if hash exa 2>/dev/null; then
   alias l='eza --icons --color=always --group-directories-first'
   alias ls='eza -a --icons --color=always --group-directories-first' # my preferred listing
   alias la='eza -al --icons --color=always --group-directories-first'  # all files and dirs
   alias ll='eza -l --icons --color=always --group-directories-first'  # long format
   alias lt='eza -aT --icons --color=always --group-directories-first' # tree listing
   alias l.='eza -a --icons | grep -E "^\."'
else
   alias l='ls -lFh --color=auto'     #size,show type,human readable
   alias la='ls -lAFh --color=auto'   #long list,show almost all,show type,human readable
   alias lr='ls -tRFh --color=auto'   #sorted by date,recursive,show type,human readable
   alias lt='ls -ltFh --color=auto'   #long list,sorted by date,show type,human readable
   alias ll='ls -l --color=auto'      #long list
   alias ldot='ls -ld .* --color=auto'
   alias lS='ls -1FSsh --color=auto'
   alias lart='ls -1Fcart --color=auto'
   alias lrt='ls -1Fcrt --color=auto'
fi

alias locate="plocate"

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'
alias py='python3'
alias e='einstein'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ping='ping -c 5'
# alias ssh='kitten ssh'
alias sxiv='nsxiv'

# vim aliases

if hash nvim 2>/dev/null; then
   alias vim='nvim'
   alias vi='nvim'
   alias v='nvim'
elif hash vim; then
   alias vi='vim'
   alias v='vim'
else
   alias vim='vi'
   alias v='vi'
fi

# go to dir, edit file and come back
goto-edit-back() {
   current_dir="$(pwd)"
   location=$(dirname "$1")
   file=$(basename "$1")
   cd $location
   $EDITOR $file
   cd $current_dir
}

alias hyprconf='goto-edit-back $XDG_CONFIG_HOME/hypr/hyprland.conf'
alias nvconf='goto-edit-back $XDG_CONFIG_HOME/nvim/init.lua'
alias zshrc='goto-edit-back $XDG_CONFIG_HOME/zsh/.zshrc'
alias conf='goto-edit-back $XDG_CONFIG_HOME'
alias ge='goto-edit-back'
alias vimwiki='goto-edit-back $HOME/Documents/vimwiki/index.md'
alias sauce="source ~/.zshrc"

# vim aliases

if hash btop 2>/dev/null; then
   alias htop='btop'
   alias top='btop'
elif hash htop; then
   alias top='htop'
else
   alias htop='top'
fi

# cd aliases
alias cd..='cd ..'
alias cd../..='cd ../..'

if hash paru 2>/dev/null; then
   alias yay="paru"
fi

# APT-Fast Aliases
if hash apt-fast 2>/dev/null; then
   alias "apt install"="sudo apt-fast install"
   alias "apt update"="sudo apt-fast update"
   alias "apt upgrade"="sudo apt-fast upgrade"
   alias "apt dist-upgrade"="sudo apt-fast dist-upgrade"
   alias "apt remove"="sudo apt-fast remove"
   alias "apt purge"="sudo apt-fast purge"
else
   alias "apt install"="sudo apt install"
   alias "apt update"="sudo apt update"
   alias "apt upgrade"="sudo apt upgrade"
   alias "apt dist-upgrade"="sudo apt dist-upgrade"
   alias "apt remove"="sudo apt remove"
   alias "apt purge"="sudo apt purge"
fi


# youtube-dl
if hash yt-dlp 2>/dev/null; then
   alias yt-aac="yt-dlp --extract-audio --audio-format aac "
   alias yt-flac="yt-dlp --extract-audio --audio-format flac "
   alias yt-m4a="yt-dlp --extract-audio --audio-format m4a "
   alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
   alias yt-opus="yt-dlp --extract-audio --audio-format opus "
   alias yt-vorbis="yt-dlp --extract-audio --audio-format vorbis "
   alias yt-wav="yt-dlp --extract-audio --audio-format wav "
   alias yta-best="yt-dlp --extract-audio --audio-format best "
   alias ytv-best="yt-dlp -f bestvideo+bestaudio "
   alias ytv-1080="yt-dlp -f bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]/best "
elif hash youtube-dl 2>/dev/null; then
   alias yt-aac="youtube-dl --extract-audio --audio-format aac "
   alias yt-flac="youtube-dl --extract-audio --audio-format flac "
   alias yt-m4a="youtube-dl --extract-audio --audio-format m4a "
   alias yt-mp3="youtube-dl --extract-audio --audio-format mp3 "
   alias yt-opus="youtube-dl --extract-audio --audio-format opus "
   alias yt-vorbis="youtube-dl --extract-audio --audio-format vorbis "
   alias yt-wav="youtube-dl --extract-audio --audio-format wav "
   alias yta-best="youtube-dl --extract-audio --audio-format best "
   alias ytv-best="youtube-dl -f bestvideo+bestaudio "
   alias ytv-1080="youtube-dl -f bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]/best "
fi

#------------
# GIT ALIASES
#------------

# Git Push All-in-one
gitpushall() {
    git add .
    git commit -m "$*"
    git push
}
alias gpa=gitpushall
alias gstat='git status'
alias gadd='git add'
alias gcommit='git commit -m'
alias gpush='git push'
alias gdiff='git diff'
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'
alias gd='git diff'
alias gp='git pull'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log --graph --decorate'
alias gco='git checkout'
alias gcob='git checkout -b'

alias gpr="git push origin HEAD:refs/for/main"
alias gpr_master="git push origin HEAD:refs/for/master"
alias gpr_main="git push origin HEAD:refs/for/main"
alias gpr_wip="git push origin HEAD:refs/for/main%wip"
alias gls="git log --show-signature"
alias sminit="git submodule update --init --recursive"


#------------
# YADM ALIASES
#------------

alias ys='yadm status'
alias ya='yadm add'
alias yc='yadm commit -m'
alias yd='yadm diff'
alias yp='yadm pull'
alias ypull='yadm pull'
alias ypush='yadm push'
alias ylog='yadm log --graph --decorate'

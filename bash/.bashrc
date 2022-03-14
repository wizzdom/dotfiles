source /etc/profile
#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
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

export EDITOR=vim

alias pacman-update='sudo pacman-mirrors --geoip'

alias ls='ls --color=auto'
alias ll='ls -l'
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh --color=auto'     #size,show type,human readable
alias la='ls -lAFh --color=auto'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh --color=auto'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh --color=auto'   #long list,sorted by date,show type,human readable
alias ll='ls -l --color=auto'      #long list
alias ldot='ls -ld .* --color=auto'
alias lS='ls -1FSsh --color=auto'
alias lart='ls -1Fcart --color=auto'
alias lrt='ls -1Fcrt --color=auto'

alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

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
alias vim='vim'
alias vi='vim'
alias v='vim'
# alias gds-start='sudo systemctl start openvpn-client@gds'
# alias gds-stop='sudo systemctl stop openvpn-client@gds'

# cd aliases
alias C:="cd /mnt/windows"
alias D:="cd /mnt/storage"
alias E:="cd /mnt/supasupweme"

alias gohome="cd ~/"
alias cd..='cd ..'

# Yay Aliases
alias yaya="yay"
alias aya="yay"

# APT-Fast Aliases
alias "apt install"="sudo apt-fast install"
alias "apt update"="sudo apt-fast update"
alias "apt upgrade"="sudo apt-fast upgrade"
alias "apt dist-upgrade"="sudo apt-fast dist-upgrade"
alias "apt remove"="sudo apt-fast remove"
alias "apt purge"="sudo apt-fast purge"

alias sauce="source ~/.zshrc"

# Browsers aliases
alias vivaldi="/opt/vivaldi/vivaldi"
alias brave="brave-nightly"

#------------
# GIT ALIASES
#------------

# Git Push All-in-one
gitpushall() {
    git add .
    git commit -m "$*"
    git push
}
alias gpa=gitpush

# Git status
alias gstat='git status'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wizzdom/.local/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wizzdom/.local/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/wizzdom/.local/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/wizzdom/.local/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


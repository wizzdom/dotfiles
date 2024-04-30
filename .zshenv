#               _
#     ____ ___ | |__    ___  _ __ __   __
#    |_  // __|| '_ \  / _ \| '_ \\ \ / /
#  _  / / \__ \| | | ||  __/| | | |\ V /
# (_)/___||___/|_| |_| \___||_| |_| \_/
#

# ZSH directories
export ZDOTDIR=$HOME/.config/zsh

# XDG paths
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
# export XDG_DATA_DIRS=XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

# Less Pager options
export LESSHISTFILE=-
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_so=$'\E[1;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'


export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

export QT_QPA_PLATFORMTHEME=qt5ct

# Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS="1;1;1"
export GDK_SCALE=1
export GDK_DPI_SCALE=1

# Default Apps
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export ALTBROWSER="brave"
export VIDEO="mpv"
export PLAYER="ncmpcpp"
export IMAGE="nsxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export MANPAGER='nvim +Man!'
export WM="Hyprland"

# Path
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.dotnet/tools:$HOME/scripts:$HOME/.spicetify

# bin path for go packages
export GOBIN=$HOME/.local/bin

export EINSTEIN_USERNAME='connord4'

# Values for shader caching for use in gaming. (Nvidia)
# export __GL_SHADER_DISK_CACHE=1
# export __GL_SHADER_DISK_CACHE_PATH='/tmp/nvidia-shaders'
# export __GL_THREADED_OPTIMIZATION=1

export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
export FFF_TRASH_CMD="trash-put"
export FFF_TRASH=~/.local/share/Trash/files
export FFF_KEY_MKDIR="f"
export FFF_KEY_MKFILE="i"
export FFF_TRASH=~/.local/share/Trash/files
export FFF_FAV1=~/Documents
export FFF_FAV2=~/Pictures
export FFF_FAV3=~/Pictures/Backgrounds
export FFF_MARK_FORMAT="> %f"
export FFF_FILE_FORMAT=" %f"

export NNN_BMS='v:~/videos;a:~/videos/anime'
export NNN_TRASH=1
export NNN_PLUG='o:fzopen'

# export MANGOHUD=1

# export _microarchitecture=36

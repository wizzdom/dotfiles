#               _
#     ____ ___ | |__   _ __  ___
#    |_  // __|| '_ \ | '__|/ __|
#  _  / / \__ \| | | || |  | (__
# (_)/___||___/|_| |_||_|   \___|
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable colors and change prompt:
export LS_COLORS="$(vivid generate tokyonight-night)"
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# history options
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.cache/zshhistory
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# keybinds for history search
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward


typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Basic auto/tab complete:
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # match lower to upper case
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colorize completions
autoload -U compinit && compinit -u
zmodload zsh/complist
_comp_options+=(globdots)               # Include hidden files.

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
# use terminfo for this so that the keybinds will work across terminal applications & tmux
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


# Load aliases and shortcuts if existent.
[ -f "$ZDOTDIR/aliases.zsh" ] && source "$ZDOTDIR/aliases.zsh"
[ -f "$ZDOTDIR/ghcli.zsh" ] && source "$ZDOTDIR/ghcli.zsh"
autoload -U +X bashcompinit && bashcompinit
[ -f "/usr/bin/nomad" ] && complete -o nospace -C /usr/bin/nomad nomad
[ -f "/usr/bin/consul" ] && complete -C /usr/bin/consul consul
[ -f "/usr/bin/mcli" ] && complete -o nospace -C /usr/bin/mcli mcli

# Load - should be last.
# Only load if exists.
[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
[ -f "/usr/share/autojump/autojump.zsh" ] && source /usr/share/autojump/autojump.zsh 2>/dev/null
# zoxide - intelligent cd command
eval "$(zoxide init --cmd cd zsh)"

[ -f "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme" ] && source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

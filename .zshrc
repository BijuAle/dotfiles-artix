# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History Settings
HISTORY_IGNORE="(ls|[bf]g|exit|reset|clear|cd|cd ..|cd..)"
HISTSIZE=25000
HISTFILE=~/.cache/zsh/.zsh_history
SAVEHIST=100000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Git mode
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Key Bindings
TranslateWheelToCursor=on
DisableWheelToCursorByCtrl=on
bindkey -e
bindkey '^R' history-incremental-search-backward #ctrl+r
bindkey "^[[1;5D" backward-word #ctrl+<-
bindkey "^[[1;5C" forward-word #ctrl+->
bindkey "^H" backward-kill-word #ctrl+bksp
bindkey "^[[P" delete-char #del
bindkey "^[[M" kill-word #ctrl+del

# Aliases
alias v="nvim"
alias lf="lfrun"
alias shut="sudo shutdown -h now"
alias rm="rm -rfI"
alias zz="v ~/.zshrc"
alias xx="v ~/.xinitrc"
alias kb='v ~/.xbindkeysrc'
alias sz="source ~/.zshrc"
alias c="clear"
#alias xclip="xclip -selection c"
alias ls='ls --color=auto'
alias la="ls -A"
alias untar='tar -zxvf'
alias wget='wget -c'
alias ping='ping -c 5'
alias ipe='curl ipinfo.io/ip'
alias grep='grep --colour=auto --devices=skip'
alias py='python'
alias wget-pdf='wget --header="Accept: text/html" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" -r -nd -nH -np -A "*.pdf"'
alias suck='cd ~/.config/suckless/ && la'
alias mci='sudo make clean install'
alias pacu='sudo rm /var/lib/pacman/db.lck'
alias nw='nitrogen ~/Pictures/Wallpapers'
alias dock='xrandr --output LVDS-1 --off --output VGA-1 --mode 1440x900 --rate 74.98'
#alias xbindkeys='xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/'
alias dr='cd /run/media/biju/Seagate\ Backup\ Plus\ Drive/Backup/ && la'
alias unzip='unzip -a'
alias rswap='rm -rf .local/share/nvim/swap/*' 
alias="xflux -l 27.762107 -g 85.358874 &"

#Start DWM on user's current tty
[[ -n "$(tty)" && -z $(pgrep -u $USER "\bXorg$") ]] && exec startx

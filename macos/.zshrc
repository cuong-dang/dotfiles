# Alias
alias cloc='cloc --vcs git .'
alias dcd='docker compose down --remove-orphans'
alias dcu='docker compose up'
alias dvrm='docker volume ls -q | xargs docker volume rm'
alias emacs='emacs -nw'
alias gcc='gcc -Wall -Werror'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch --prune'
alias gk='git checkout'
alias gkm='git checkout main && gpl'
alias gl='git log --all --graph --decorate --oneline'
alias gll='git log --all --graph --decorate'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gsu='git status -u no'
alias less='less -N'
alias ll='ls -alhG'
alias ls='ls -G'
alias python='python3'
alias pt='pytest -vvrx'
alias rsy='rsync -rauvhP ~/iCloud/ /Volumes/My\ Passport/iCloud --delete'
alias tf='terraform'
alias yt='youtube-dl -f bestvideo+bestaudio'

# Path
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_301)
# export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$PATH:/Users/cuongdang/prog/bin:/Users/cuongdang/Library/Application Support/Coursier/bin"
# export PATH="/usr/local/opt/node@16/bin:$PATH"

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# substring completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
autoload -U select-word-style
select-word-style bash
export WORDCHARS=''

# vcs branch
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT='%n@%m %1~ ${vcs_info_msg_0_} %# '

# history across tmux
setopt share_history
setopt inc_append_history

# Terraform autocomplete
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

# GHCup
[ -f "/Users/cuongdang/.ghcup/env" ] && source "/Users/cuongdang/.ghcup/env" # ghcup-env

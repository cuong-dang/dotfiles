# Alias
alias cloc='cloc --vcs git .'
alias ctest='ctest --output-on-failure'
alias dcd='docker compose down --remove-orphans'
alias dcu='docker compose up'
alias dvrm='docker volume ls -q | xargs docker volume rm'
alias e='emacs -nw'
alias gcc='gcc -Wall -Werror'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gk='git checkout'
alias gl='git log --all --graph --decorate --oneline'
alias gll='git log --all --graph --decorate'
alias gm='git merge --no-ff --no-edit'
alias gpl='git pull && git fetch --prune'
alias gps='git push'
alias gs='git status'
alias ll='ls -alhG'
alias ls='ls -G'
alias mi='mitene_download --destination-directory /Volumes/My\ Passport/mitene https://mitene.us/f/buJ88Eb0ags'
alias pt='pytest -vvrx'
alias rsy='rsync -rauvhP ~/iCloud/ /Volumes/My\ Passport/iCloud --delete'
alias tf='terraform'

# Path
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_301)
# export JAVA_HOME=$(/usr/libexec/java_home -v 11)
# export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$PATH:/Users/cuong/Library/Application Support/Coursier/bin"

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Substring completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
autoload -U select-word-style
select-word-style bash
export WORDCHARS=''

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{blue}%1~%f%F{red}${vcs_info_msg_0_}%f$ '

# tmux
setopt share_history
setopt inc_append_history
if ! [[ -n "$TMUX" ]]; then
    tmux
fi
export TERM=xterm-256color

# Terraform autocomplete
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

# GHCup
# [ -f "/Users/cuongdang/.ghcup/env" ] && source "/Users/cuongdang/.ghcup/env" # ghcup-env

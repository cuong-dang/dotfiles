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
alias ll='ls -alhG --color'
alias ls='ls -G --color'
alias python='python3'
alias pt='pytest -vvrx'
alias rsy='rsync -rauvhP ~/iCloud/ /Volumes/My\ Passport/iCloud --delete'
alias tf='terraform'
alias yt='youtube-dl -f bestvideo+bestaudio'

# Path
export PATH="$PATH:/Users/cuongdang/code/bin"

# zsh
source ~/code/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
PROMPT='%n@%m:%F{green}%~%f%F{red}${vcs_info_msg_0_}%f$ '

# autojump
[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
autoload -U compinit && compinit -u

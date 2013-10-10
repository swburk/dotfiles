# PATH
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:$HOME/bin:/sbin:/usr/sbin"

# Vim
export VISUAL="vim"
export EDITOR=$VISUAL

# Manpage viewer
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set filetype=man tabstop=8 nomodified nolist nonumber nomodifiable' -\""

# History
export HISTSIZE=1000
export SAVEHIST=1000
setopt HIST_IGNORE_SPACE
export HISTFILE=$HOME/.history
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# Navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion
autoload -U compinit && compinit
setopt CORRECT

# Bindings
bindkey -e

# Title
function precmd() {
    print -Pn "\e];%~\a"
}

# Prompt
autoload -U colors && colors
setopt PROMPT_SUBST

if [[ -n "$SSH_CONNECTION" ]]; then
    SSH_PROMPT="%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}"
fi

export PS1="%(?.%(!.#.$).%{$fg[red]%}%(!.#.$)%{$reset_color%}) "
export PS1="%{$fg[blue]%}%~%{$reset_color%}] $PS1"
export PS1="[%{$fg[green]%}%n%{$reset_color%}$SSH_PROMPT:$PS1"
export PS1="%1(j.%{$fg[magenta]%}%jj %{$reset_color%}.)$PS1"

# Scripts
. ~/bin/z.sh

# Functions
function chpwd() {
    ls -Ft --color=auto | head -7;
}
function mcd() {
    mkdir -pv "$1" && cd "$1";
}
function http() {
    curl http://httpcode.info/$1;
}
function g() {
    if [[ $# > 0 ]]; then
        git $@
    else
        git status
    fi
}
compdef g=git

# Aliases
alias src='. ~/.zshrc'
alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'
alias l1='ls -1'
alias lb='ranger'
alias lr='tree -C'
alias mkdir='mkdir -pv'
alias cx='chmod a+x'
alias tns='tmux new -s'
alias tas='tmux attach -t'
alias e='$EDITOR'
alias lf='ls -t | head -1'
alias ip='curl icanhazip.com'

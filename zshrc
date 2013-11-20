# PATH
export PATH="/usr/local/bin:$PATH:$HOME/bin"

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
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion
autoload -U compinit && compinit
setopt CORRECT

# Bindings
bindkey -e

# Prompt
autoload -U colors && colors
setopt PROMPT_SUBST

if [[ -n "$SSH_CONNECTION" ]]; then
    SSH_PROMPT="@%{$fg_bold[cyan]%}%m%{$reset_color%}"
fi

export PS1="%(?.%(!.#.$).%{$fg_bold[red]%}%(!.#.$)%{$reset_color%}) "
export PS1="%{$fg_bold[blue]%}%~%{$reset_color%}] $PS1"
export PS1="[%{$fg_bold[green]%}%n%{$reset_color%}$SSH_PROMPT:$PS1"
export PS1="%1(j.%{$fg_bold[magenta]%}%jj %{$reset_color%}.)$PS1"

# Scripts
. ~/bin/z.sh

# Functions
function precmd() {
    print -Pn "\e];%~\a"
}

function chpwd() {
    ls -Ft | head -8;
}

function tag() {
    alias $1="cd $PWD"
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
alias -g .....='cd ../../../..'
alias l='ls -F'
alias ll='ls -Fl'
alias la='ls -FlA'
alias ld='ls -d */'
alias l.='ls -d .*'
alias lb='ranger'
alias lt='tree -C'
alias ff='find . -name'
alias md='mkdir -pv'
alias cx='chmod a+x'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias e='$EDITOR'
alias ip='curl icanhazip.com'

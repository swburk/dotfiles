# Environment variables and options ------------------------------------------

export PATH="$HOME/.bin:/usr/local/bin:$PATH"
export EDITOR="vim"
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export LSCOLORS="ExGxcxdxFxegedabagExEx"
export CLICOLOR=1
export HISTSIZE=100000
export HISTFILESIZE=100000
export PROMPT_COMMAND="set_prompt"
shopt -s histappend
shopt -s cdspell

# Prompt ---------------------------------------------------------------------

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function set_prompt {
    Last_Command=$?
    Black='\[\e[0;30m\]'
    Red='\[\e[0;31m\]'
    Green='\[\e[0;32m\]'
    Yellow='\[\e[0;33m\]'
    Blue='\[\e[0;34m\]'
    Purple='\[\e[0;35m\]'
    Cyan='\[\e[0;36m\]'
    White='\[\e[0;37m\]'
    Reset='\[\e[0m\]'

    # Jobs
    export PS1="$Purple\$([ \j -gt 0 ] && echo '\jj ')$Reset"

    # Username and hostname displayed in an SSH session
    if [ -n "$SSH_CONNECTION" ]; then
        PS1+="$Green\u$Reset@$Blue\h "
    fi

    # Current directory
    PS1+="$Cyan\w $Reset"

    # Current git branch
    PS1+="$(parse_git_branch)"

    # Prompt character is red when command exits with non-zero
    if [ "$Last_Command" -eq 0 ]; then
        PS1+="$ "
    else
        PS1+="$Red$ $Reset"
    fi
}

# Scripts --------------------------------------------------------------------

. $HOME/.bin/z.sh

# Functions ------------------------------------------------------------------

function bm {
    alias $1="cd $PWD"
}

function e {
    if [ $# -eq 0 ]; then
        $EDITOR .
    else
        $EDITOR "$@"
    fi
}

function g {
    if [ $# -ne 0 ]; then
        git $@
    else
        git status
    fi
}

function mkcd {
    mkdir -pv "$1" && cd "$1";
}

function va {
    . "$HOME/.virtualenvs/$1/bin/activate"
}

function va {
    virtualenv "$HOME/.virtualenvs/$1"
}

# Aliases --------------------------------------------------------------------

alias m="mutt"
alias o="offlineimap"
alias h="history"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll="ls -lh"
alias la="ls -lha"
alias t="tmux"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux list-sessions"

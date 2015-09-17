# Environment variables and options ------------------------------------------

export PATH="$HOME/.bin:/usr/local/bin:$PATH"
export EDITOR="vim"
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export LSCOLORS="ExGxcxdxFxegedabagExEx"
export CLICOLOR=1
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
shopt -s cdspell

# Prompt ---------------------------------------------------------------------

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
PS1+="$Green\u$Reset@$Blue\h "

# Current directory
PS1+="$Cyan\w $Reset"

# Prompt character
PS1+="$ "

# Functions ------------------------------------------------------------------

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

# Aliases --------------------------------------------------------------------

alias m="mutt"
alias o="offlineimap"
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
alias shfiles="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
alias hhfiles="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"

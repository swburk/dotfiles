export CLICOLOR=1
export EDITOR="vim"
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export PROMPT_COMMAND="set_prompt"
shopt -s histappend
shopt -s cdspell

function set_prompt {
    LAST_COMMAND=$?
    BLACK='\[\e[0;30m\]'
    RED='\[\e[0;31m\]'
    GREEN='\[\e[0;32m\]'
    YELLOW='\[\e[0;33m\]'
    BLUE='\[\e[0;34m\]'
    PURPLE='\[\e[0;35m\]'
    CYAN='\[\e[0;36m\]'
    WHITE='\[\e[0;37m\]'
    RESET='\[\e[0m\]'

    # Jobs
    export PS1="$PURPLE\$([ \j -gt 0 ] && echo '\jj ')$RESET"

    # Username and hostname displayed in an SSH session
    if [ -n "$SSH_CONNECTION" ]; then
        PS1+="$GREEN\u$RESET@$BLUE\h "
    fi

    # Current directory
    PS1+="$CYAN\w$RESET "

    # Prompt character is red when command exits with non-zero
    if [ "$LAST_COMMAND" -eq 0 ]; then
        PS1+=":) "
    else
        PS1+="$RED:($RESET "
    fi
}

alias ..="cd .."
alias ll="ls -lhF"
alias la="ls -lhFa"

# Environment variables and options ------------------------------------------

export PATH="$HOME/.bin:/usr/local/bin:$PATH"
export VISUAL="vim"
export EDITOR="$VISUAL"
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export LSCOLORS="ExGxcxdxFxegedabagExEx"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$HOME/.zsh_history"
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt correct

# Functions ------------------------------------------------------------------

fpath=(~/.zsh/functions $fpath)
for function in $(ls ~/.zsh/functions); do
    autoload "$function"
done

# Completion -----------------------------------------------------------------

autoload -U compinit && compinit
compdef g=git

# Bindings -------------------------------------------------------------------

bindkey -e

# Edit current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Prompt ---------------------------------------------------------------------

setopt prompt_subst
autoload -Uz vcs_info

#  red:      1,  9
#  green:    2,  10
#  yellow:   3,  11
#  blue:     4,  12
#  magenta:  5,  13
#  cyan:     6,  14
#  white:    7,  15
#  black:    8,  16

# Format for VCS Info
zstyle ':vcs_info:*' actionformats '(%b) '
zstyle ':vcs_info:*' formats '(%b) '
zstyle ':vcs_info:*' enable git

function set_prompt() {
    # Jobs
    export PS1="%1(j.%F{5}%jj%f .)"

    # Username and hostname displayed in an SSH session
    export PS1="$PS1${SSH_CONNECTION+"$PS1%F{2}%n%f@%F{4}%m%f "}"

    # Current directory
    export PS1="$PS1%F{6}%~%f "

    # Current VCS branch
    export PS1="$PS1${vcs_info_msg_0_}"

    # Prompt character is red when command exits with non-zero
    export PS1="$PS1%(?.%(!.#.$).%F{1}%(!.#.$)%f) "
}

# Scripts --------------------------------------------------------------------

. $HOME/.bin/z.sh

# Aliases --------------------------------------------------------------------

alias m="mutt"
alias o="offlineimap"
alias h="history"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l="ls -F"
alias l1="ls -F1"
alias ll="ls -Fl"
alias la="ls -FlA"
alias ld="ls -ld */"
alias l.="ls -ld .*"
alias t="tmux"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux list-sessions"

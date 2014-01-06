# Environment variables and options ------------------------------------------
export PATH="/usr/local/bin:$PATH:$HOME/bin"
export VISUAL="vim"
export EDITOR="$VISUAL"
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set filetype=man tabstop=8 nomodified nolist nonumber nomodifiable' -\""
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="$HOME/.history"
setopt hist_ignore_space
setopt share_history
setopt correct
export VIRTUALENV_BASE="$HOME/.virtualenvs"

# Completion -----------------------------------------------------------------
autoload -U compinit && compinit

# Bindings -------------------------------------------------------------------
bindkey -e

# Prompt ---------------------------------------------------------------------
setopt prompt_subst
autoload -Uz vcs_info

# colors:
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

# Jobs
export PS1="%1(j.%F{13}%jj%f .)"

# Username and hostname displayed in an SSH session
export PS1="$PS1${SSH_CONNECTION+"%F{2}%n%f@%F{6}%m%f "}"

# Current directory
export PS1="$PS1%F{12}%~%f "

# Current VCS branch
export PS1="$PS1${vcs_info_msg_0_}"

# Prompt is red when previous command didn't exit with 0
export PS1="$PS1%(?.%(!.#.❯).%F{1}%(!.#.❯)%f) "

# Scripts and functions ------------------------------------------------------
. ~/bin/z.sh

function precmd() {
    vcs_info
    print -Pn "\e];%~\a"
}

function chpwd() {
    ls -Ft | head -8;
}

function va() {
    . "$VIRTUALENV_BASE/$1/bin/activate"
}

function vn() {
    virtualenv "$VIRTUALENV_BASE/$1"
}

function bm() {
    alias $1="cd $PWD"
}

function mkd() {
    mkdir -pv "$1" && cd "$1";
}

function http() {
    curl http://httpcode.info/$1;
}

function ff() {
    ls "**/*$1*"
}

function e() {
    if [ $# -eq 0 ]; then
        $EDITOR .
    else
        $EDITOR "$@"
    fi
}

function g() {
    if [ $# -ne 0 ]; then
        git $@
    else
        git status
    fi
}
compdef g=git

# Aliases --------------------------------------------------------------------
alias c="cd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l="ls -F"
alias ll="ls -Fl"
alias la="ls -FlA"
alias ld="ls -d */"
alias l.="ls -d .*"
alias lb="ranger"
alias m="mkdir -p"
alias x="chmod a+x"
alias t="tmux"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias h="history"
alias j="jobs"
alias v="virtualenv"

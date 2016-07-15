set PATH "/usr/local/bin" $PATH
set fish_greeting ''
set -x EDITOR nvim

function tn; tmux new -s; end
function ta; tmux attach -t; end
function tl; tmux list-sessions; end

function e --wraps nvim
    if test (count $argv) -gt 0
        eval $EDITOR $argv
    else
        eval $EDITOR .
    end
end

function g --wraps git
    if test (count $argv) -gt 0
        git $argv
    else
        git status
    end
end

function fish_prompt
    set -l last_status $status

    # Show number of jobs
    # Show username and hostname over SSH

    set_color cyan
    printf '%s' (pwd)

    set_color purple
    printf '%s ' (__fish_git_prompt)

    if test $last_status -ne 0
        set_color red
    else
        set_color normal
    end
    printf "> "
    set_color normal
end

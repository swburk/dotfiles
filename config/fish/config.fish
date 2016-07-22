set fish_greeting
set PATH "/usr/local/bin" $PATH
set -x EDITOR nvim

function tn; tmux new -s $argv; end
function ta; tmux attach -t $argv; end
function tl; tmux list-sessions; end

function e --wraps nvim
    eval $EDITOR $argv
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
    set -l job_count (jobs | wc -l | tr -d " ")

    # Jobs
    if test $job_count -gt 0
        set_color red
        printf "$job_count "
        set_color normal
    end

    # Username and hostname displayed in an SSH session
    if set -q SSH_CLIENT
        printf "%s%s%s@%s%s%s " (set_color green) (whoami) (set_color normal) \
                                (set_color blue) (hostname | cut -d . -f 1) (set_color normal)
    end

    # Current directory
    set_color cyan
    set -g fish_prompt_pwd_dir_length 0
    printf (prompt_pwd)
    set_color normal

    # Current VCS branch
    set_color magenta
    printf "%s " (__fish_git_prompt)
    set_color normal

    # Prompt character is red when command exits with non-zero
    if test $last_status -ne 0
        set_color red
    end
    printf "> "
    set_color normal
end

function fish_right_prompt
    date "+%H:%M:%S"
end

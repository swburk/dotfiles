set fish_greeting
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

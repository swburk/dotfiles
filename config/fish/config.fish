set PATH "/usr/local/bin" $PATH
set -x EDITOR nvim

function m; mutt; end
function o; offlineimap; end
function t; tmux; end
function tn; tmux new -s; end
function ta; tmux attach -t; end
function tl; tmux list-sessions; end
function e
    if test (count $argv) -gt 0
        eval $EDITOR $argv
    else
        eval $EDITOR .
    end
end
function g
    if test (count $argv) -gt 0
        git $argv
    else
        git status
    end
end

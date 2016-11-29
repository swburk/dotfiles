set fish_greeting
set -x EDITOR nvim
set -x MANPAGER "nvim -c 'set ft=man' -"

function tn; tmux new -s $argv; end
function ta; tmux attach -t $argv; end
function tl; tmux list-sessions; end
function sla; ssh -l root app.getmediapanel.com; end
function sld; ssh -l root dev.getmediapanel.com; end
function slr; ssh -l root $argv; end

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

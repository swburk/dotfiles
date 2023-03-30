HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

setopt prompt_subst
PROMPT='%(1j.%F{magenta}%jj%f .)${SSH_CONNECTION+"%F{green}%n%f@%F{yellow}%m%f "}%F{cyan}%~%f %(?..%F{red})%#%f '

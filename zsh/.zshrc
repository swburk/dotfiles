HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

PROMPT='%(1j.%F{magenta}%jj%f .)%F{green}%n%f@%F{yellow}%m%f: %F{cyan}%~%f %(?..%F{red})%#%f '

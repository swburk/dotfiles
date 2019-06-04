autoload -Uz compinit
compinit

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'

precmd() { vcs_info }
setopt prompt_subst
PROMPT='%(1j.%F{magenta}%jj%f .)%F{green}%n%f@%F{yellow}%m%f: %F{cyan}%~%f %(?..%F{red})%#%f '
RPROMPT='${vcs_info_msg_0_}'

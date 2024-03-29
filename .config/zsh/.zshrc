HISTSIZE="1000"
SAVEHIST="$HISTSIZE"
HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt INC_APPEND_HISTORY

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats '(%b%u%c) '
autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info

setopt PROMPT_SUBST
PROMPT='%(1j.%F{magenta}%jj%f .)%F{green}%n%f@%F{yellow}%m%f %F{cyan}%~%f ${vcs_info_msg_0_}%(?..%F{red})%#%f '

alias venv=". ./.venv/bin/activate"

export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"

command -v fnm &> /dev/null && eval "$(fnm env)"

if command -v go &> /dev/null; then
	path+=($(go env GOPATH)/bin)
	export PATH
fi

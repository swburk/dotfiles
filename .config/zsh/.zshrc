HISTSIZE="10000"
SAVEHIST="$HISTSIZE"
HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt INC_APPEND_HISTORY

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

bindkey -e

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

case "$(uname -s)" in
	Darwin)
		alias ls="ls -GF"
		;;
	Linux)
		alias ls="ls --color=auto -F"
		;;
esac
alias e="$EDITOR"
alias g="git"
alias venv=". ./.venv/bin/activate"

test -f /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
command -v mise &> /dev/null && eval "$(mise activate zsh)"

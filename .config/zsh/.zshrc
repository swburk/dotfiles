HISTSIZE="10000"
SAVEHIST="$HISTSIZE"
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
setopt INC_APPEND_HISTORY

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

bindkey -e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line
bindkey "^p" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward

autoload -Uz vcs_info
zstyle ":vcs_info:*" check-for-changes true
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" unstagedstr "*"
zstyle ":vcs_info:*" stagedstr "+"
zstyle ":vcs_info:*" formats " %b%u%c "
zstyle ":vcs_info:git:*" actionformats " %b%u%c %a "
autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info
setopt PROMPT_SUBST
PROMPT='%B%S%F{red}%(1j. %j.) %F{yellow} %F{green}${SSH_CONNECTION+" %n@%m"} %F{blue} %~ %F{magenta}${vcs_info_msg_0_}%f%s %(?..%F{red})%#%f%b '
RPROMPT="%F{black}%*%f"

alias e="$EDITOR"
alias g="git"
case "$OSTYPE" in
	darwin*)
		alias ls="ls -GF"
		;;
	linux*)
		alias ls="ls --color=auto -F"
		;;
esac

if [ "$TERM_PROGRAM" = "WezTerm" ] && [ -f "$WEZTERM_CONFIG_DIR/wezterm.sh" ]; then
	. "$WEZTERM_CONFIG_DIR/wezterm.sh"
fi

command -v mise &> /dev/null && eval "$(mise activate zsh)"

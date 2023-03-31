VISUAL="vim"
EDITOR="$VISUAL"

: ${XDG_CONFIG_HOME:="$HOME/.config"} \
	${XDG_CACHE_HOME:="$HOME/.cache"} \
	${XDG_DATA_HOME:="$HOME/.local/share"} \
	${XDG_STATE_HOME:="$HOME/.local/state"}

ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export MANPAGER="nvim +Man!"

: ${XDG_CONFIG_HOME:="$HOME/.config"} \
	${XDG_CACHE_HOME:="$HOME/.cache"} \
	${XDG_DATA_HOME:="$HOME/.local/share"} \
	${XDG_STATE_HOME:="$HOME/.local/state"}

ZDOTDIR="$XDG_CONFIG_HOME/zsh"

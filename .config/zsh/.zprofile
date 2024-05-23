# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set PATH for Python.
export PATH="`python3 -m site --user-base`/bin:$PATH"

export SHELL_SESSIONS_DISABLE=1

# Installation

1. Clone the repository to ~/.dotfiles.

2. `cd ~/.dotfiles`

3. Link everything to your home directory:

	- Linux/MacOS: `stow zsh bash screen vim emacs`

	- Windows: (Run in Command Prompt as Admin)
		- `mklink /J $HOME\vimfiles vim\.vim`
		- `mklink /J $HOME\.emacs.d emacs\.emacs.d`

4. Install minpac: `git submodule update --init`

5. Install Vim plugins: `vim -c ':call minpac#update()'`

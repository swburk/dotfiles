# Installation

1. Clone the repository to ~/.dotfiles.

2. `cd ~/.dotfiles`

3. Install minpac: `git submodule update --init`

4. Install Vim plugins: `vim -c ':call minpac#update()'`

5. Link everything to your home directory: `stow bash screen vim`

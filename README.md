# Installation

1. Clone the repository to ~/.dotfiles.

2. `cd ~/.dotfiles`

3. Link everything to your home directory: `stow bash screen vim`

4. Install minpac: `git submodule update --init`

5. Install Vim plugins: `vim -c ':call minpac#update()'`


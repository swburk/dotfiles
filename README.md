# Installation

```
git clone --recursive git@github.com:swburk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
vim -c ':helptags ALL'
nvim -c ':helptags ALL'
```

### Special Instructions for Windows

In order to correctly link the Vim/Neovim configuration on Windows, run the following command in Command Prompt as Admin:

```
# Vim
mklink /J $HOME\vimfiles .vim

# Neovim
mklink /J $HOME\AppData\Local\nvim .config\nvim
mklink /J $HOME\AppData\Local\nvim-data .local\share\nvim
```

# Vim/Neovim Plugins

Add plugin:
```
# Vim
git submodule add https://github.com/name/foo.git .vim/pack/plugins/start/foo

# Neovim
git submodule add https://github.com/name/foo.git .local/share/nvim/site/pack/plugins/start/foo
```

Remove plugin:
```
# Vim
git submodule deinit .vim/pack/plugins/start/foo
git rm -r .vim/pack/plugins/start/foo
rm -r .git/modules/.vim/pack/plugins/start/foo

# Neovim
git submodule deinit .local/share/nvim/site/pack/plugins/start/foo
git rm -r .local/share/nvim/site/pack/plugins/start/foo
rm -r .git/modules/.local/share/nvim/site/pack/plugins/start/foo
```

Update plugins:
```
git submodule update --remote --merge
```

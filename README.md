# Installation

```
git clone --recursive git@github.com:swburk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
vim -c ':helptags ALL'
```

## Special Instructions for Windows

In order to correctly link the Vim configuration on Windows, run the following command in Command Prompt as Admin:

```
mklink /J $HOME\vimfiles .vim
```

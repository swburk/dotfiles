# Installation

```
git clone --recursive git@github.com:swburk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
vim -c ':helptags ALL'
```

### Special Instructions for Windows

In order to correctly link the Vim configuration on Windows, run the following command in Command Prompt as Admin:

```
mklink /J $HOME\vimfiles .vim
```

# Vim Plugins

Add plugin:
```
git submodule add https://github.com/name/foo.git .vim/pack/plugins/start/foo
```

Remove plugin:
```
git submodule deinit .vim/pack/plugins/start/foo
git rm -r .vim/pack/plugins/start/foo
rm -r .git/modules/.vim/pack/plugins/start/foo
```

Update plugins:
```
git submodule update --remote --merge
```

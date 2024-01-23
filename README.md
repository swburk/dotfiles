# Requirements

* [Git](https://git-scm.com/)
* [Stow](https://www.gnu.org/software/stow/)

## Optional

* [Vim 9.0+](https://www.vim.org/)
* [Neovim 0.9+](https://neovim.io)
* [Zsh](https://www.zsh.org/)
* [WezTerm](https://wezfurlong.org/wezterm/index.html)

## LSP Servers

* [Python LSP Server](https://github.com/python-lsp/python-lsp-server)
* [TypeScript Language Server](https://github.com/typescript-language-server/typescript-language-server)
* [ESLint](https://eslint.org/)
* [gopls](https://pkg.go.dev/golang.org/x/tools/gopls)

# Installation

```
git clone --recursive git@github.com:swburk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

# Vim & Neovim

### Special Instructions for Windows

To correctly link the configuration on Windows, run the following command in Command Prompt as Admin:

Vim:
```
mklink /J $HOME\vimfiles .vim
```

Neovim:
```
mklink /J $HOME\AppData\Local\nvim .config\nvim
mklink /J $HOME\AppData\Local\nvim-data .local\share\nvim
```

### Helptags

Generate the helptags files for installed plugins:
```
:helptags ALL
```

### GitHub Copilot

Login and enable Copilot:
```
:Copilot setup
:Copilot enable
```

### Plugins

Vim and Neovim have a different `packpath`. Substitute the following values for "PACKPATH" in the commands below:

* Vim: `.vim/`
* Neovim: `.local/share/nvim/site/`

Add plugin:
```
git submodule add -f https://github.com/name/foo.git PACKPATH/pack/plugins/start/foo
```

Remove plugin:
```
git submodule deinit PACKPATH/pack/plugins/start/foo
git rm PACKPATH/pack/plugins/start/foo
rm -r .git/modules/PACKPATH/pack/plugins/start/foo
```

Update plugins:
```
git submodule update --remote --merge
```

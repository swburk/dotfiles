# Requirements

Linux & macOS:
* [GNU Stow](https://www.gnu.org/software/stow/) - Symlink dotfiles

Windows:
* [MinGW-w64](https://www.mingw-w64.org/) - Dependency for nvim-treesitter

## Configured Programs

* [Git](https://git-scm.com/)
* [GNU Screen](https://www.gnu.org/software/screen/)
* [Neovim](https://neovim.io)
* [Vim](https://www.vim.org/)
* [WezTerm](https://wezfurlong.org/wezterm/index.html)
* [Zsh](https://www.zsh.org/)

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

To correctly link the configuration on Windows, run the following commands in PowerShell as an administrator:

Vim:
```
New-Item -ItemType SymbolicLink -Path ~\vimfiles -Target .\.vim
```

Neovim:
```
New-Item -ItemType SymbolicLink -Path ~\AppData\Local\nvim -Target .\.config\nvim
New-Item -ItemType SymbolicLink -Path ~\AppData\Local\nvim-data -Target .\.local\share\nvim
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

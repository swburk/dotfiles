# Requirements

* [GNU Stow](https://www.gnu.org/software/stow/)
* [Tree-sitter](https://tree-sitter.github.io/tree-sitter/)

## Configured Programs

* [Espanso](https://espanso.org/)
* [Git](https://git-scm.com/)
* [Neovim](https://neovim.io)
* [WezTerm](https://wezfurlong.org/wezterm/index.html)
* [Zsh](https://www.zsh.org/)

## Linters/LSP Servers

* [ESLint](https://eslint.org/)
* [gopls](https://pkg.go.dev/golang.org/x/tools/gopls)
* [Pyright](https://github.com/microsoft/pyright)
* [Ruff](https://github.com/astral-sh/ruff)
* [TypeScript Language Server](https://github.com/typescript-language-server/typescript-language-server)

# Installation

```
git clone --recursive git@github.com:swburk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

# Neovim

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

Add plugin:
```
git submodule add -f https://github.com/name/foo.git .local/share/nvim/site/pack/plugins/start/foo
```

Remove plugin:
```
git submodule deinit .local/share/nvim/site/pack/plugins/start/foo
git rm .local/share/nvim/site/pack/plugins/start/foo
rm -r .git/modules/.local/share/nvim/site/pack/plugins/start/foo
```

Update plugins:
```
git submodule update --remote --merge
```

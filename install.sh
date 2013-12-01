#!/bin/bash

backup() {
    files=( $(ls) )
    for file in "${files[@]}"; do
        cp -Rf "$file" "$BACKUP_DIR/$file"
    done
}

install() {
    files=( $(ls) )
    for file in "${files[@]}"; do
        if [ "$file" != 'install.sh' ] && [ "$file" != 'README.md' ]; then
            if [ -e "$HOME/.$file" ]; then
                rm -rf $HOME/.$file
            fi
            ln -s $DOTFILE_DIR/$file $HOME/.$file
        fi
    done
}

if [[ -z "$2" ]]; then
    if [[ ! -d $HOME/.dotfiles_backup ]]; then
        mkdir "$HOME/.dotfiles_backup"
    fi
    mkdir "$HOME/.dotfiles_backup/$(date "+%Y%m%d%I%M%S")"
    BACKUP_DIR="$HOME/.dotfiles_backup/$(date "+%Y%m%d%I%M%S")"
else
    if [[ -d "$2" ]]; then
        BACKUP_DIR="$2"
    else
        mkdir "$2"
        BACKUP_DIR="$2"
    fi
fi

if [[ -z "$1" ]]; then
    if [[ ! -d $HOME/.dotfiles ]]; then
        mkdir "$HOME/.dotfiles"
    fi
    DOTFILE_DIR="$HOME/.dotfiles"
else
    if [[ ${1:(-1)} == "/" ]]; then
        DOTFILE_DIR=${1:0:${#1} - 1}
    else
        DOTFILE_DIR="$1"
    fi
fi

if [ -d "$DOTFILE_DIR" ]; then
    pushd "$DOTFILE_DIR"

    echo "Updating"
    git pull origin master
    git submodule init
    git submodule update

    echo "Backing up"
    backup

    echo "Linking"
    install
else
    echo "Downloading"
    git clone --recursive git://github.com/samuelburk/dotfiles.git "$DOTFILE_DIR"

    pushd "$DOTFILE_DIR"

    echo "Backing up"
    backup

    echo "Linking"
    install
fi

echo "Finished"
popd


#!/bin/bash

backup() {
    mkdir -p $BACKUP_DIR
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

BACKUP_DIR="$HOME/.dotfiles_backup/$(date "+%Y%m%d%I%M%S")"
DOTFILE_DIR="$HOME/.dotfiles"

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


#!/bin/bash

backup() {
    mkdir -p "$BACKUP_DIR"
    files=($(ls))
    for file in "${files[@]}"; do
        cp -Rf "$file" "$BACKUP_DIR/$file"
    done
}

install() {
    files=($(ls))
    for file in "${files[@]}"; do
        if [ "$file" != 'bootstrap.sh' ] && [ "$file" != 'README.md' ]; then
            test -L "$HOME/.$file" || ln -s "$DOTFILE_DIR/$file" "$HOME/.$file"
        fi
    done
    chmod 600 "$DOTFILE_DIR/msmtprc"
}

BACKUP_DIR="$HOME/.dotfiles_backup/$(date "+%Y%m%d%I%M%S")"
DOTFILE_DIR="$HOME/.dotfiles"

if [ -d "$DOTFILE_DIR" ]; then
    pushd "$DOTFILE_DIR"

    echo "Updating"
    git pull origin master
    git submodule update --init

    echo "Backing up to $BACKUP_DIR"
    backup

    echo "Linking"
    install
else
    echo "Downloading"
    git clone --recursive git://github.com/samuelburk/dotfiles.git "$DOTFILE_DIR"

    pushd "$DOTFILE_DIR"

    echo "Backing up to $BACKUP_DIR"
    backup

    echo "Linking"
    install
fi

echo "Finished"
popd

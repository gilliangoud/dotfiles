#!/usr/bin/env bash

set -eo pipefail

CURRENT=$(pwd)

info() {
    printf "  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail() {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
    echo ''
    exit
}

link_files() {
    if [ -L "$2" ] ; then
        rm -f "$2"
    fi

    ln -s "$CURRENT/$1" "$2"
    success "linked $1 to $2"
}

# link files, and back-up existing
for file in $(find ../ -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.dtbak}
    fi
    link_files ../$file ~/$file
done

# VSCode
info 'Install VSCode configuration'
link_files ../vscode/keybindings.json ~/.config/Code/User/keybindings.json
link_files ../vscode/settings.json    ~/.config/Code/User/settings.json

info 'Install VSCode plugins'
source "$(dirname "${BASH_SOURCE[0]}")"/../vscode/install_plugin.sh


echo ''
echo 'All installed 😀'

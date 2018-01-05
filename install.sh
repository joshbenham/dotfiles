#!/usr/bin/env bash

export DOTFILES=~/.dotfiles
set -e

_msg() { printf "\r\033[2K\033[0;32m[ dotfiles ] %s\033[0m\n" "$*"; }

_uncallable() { ! command -v "$1" >/dev/null; }

_install() {
    if [[ -f /etc/arch-release ]]; then
        sudo pacman -Sy "$*"
    elif [[ -f /etc/debian_version ]]; then
        sudo apt install -y "$*"
    fi
}

if _uncallable git; then
  _msg "Installing git"
  _install git
fi


_msg
_msg "And done!"
_msg

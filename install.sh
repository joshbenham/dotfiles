#!/usr/bin/env bash

export DOTFILES=~/.dotfiles
set -e

_msg() { printf "\r\033[2K\033[0;32m[ \$\$\$ ] %s\033[0m\n" "$*"; }

_uncallable() { ! command -v "$1" >/dev/null; }

_install() {
    if [[ -f /etc/arch-release ]]; then
        sudo pacman -Sy "$*"
    elif [[ -f /etc/debian_version ]]; then
        sudo apt install -y "$*"
    fi
}


if _uncallable stow; then
  _msg "Installing stow"
  _install stow
fi

_msg "Running stow"
stow arch

_msg
_msg "And done!"
_msg

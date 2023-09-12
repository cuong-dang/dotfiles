#!/bin/sh
# Essentials after a fresh macOS install

pkgs () {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    formulae=( "mit-scheme" "tmux" "tldr" "autojump" )
    for f in ${formulae[@]}; do
        echo "Install $f..."
        brew install $f
    done
    casks=( "emacs" "stats" )
    for c in ${casks[@]}; do
        echo "Install $c..."
        brew install --cask $c
    done
}

zsh_plugins () {
    formulae=( "zsh-syntax-highlighting" "zsh-autosuggestions" "zsh-completions" )
    echo "Install additional zsh plugins..."
    for f in ${formulae[@]}; do
        echo "  Install $f..."
        brew install $f
    done
}

dotfiles () {
    for f in ./\.*; do
        echo "Create symlink for $f..."
        ln -si "$(pwd)/$f" ~
    done
}

ln -s "/Users/$USER/Library/Mobile Documents/com~apple~CloudDocs" ~/iCloud
pkgs
zsh_plugins
dotfiles

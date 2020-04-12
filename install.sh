#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install it if we don't have it
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install Homebrew dependencies with bundle
brew tap homebrew/bundle
brew bundle

# Remove .zshrc from $HOME and symlinks it from the .dotfiles directory
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Remove .gitconfig from $HOME and symlinks it from the .dotfiles directory
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Symlink settings.json
ln -s $HOME/.dotfiles/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

#!/bin/sh

echo "Setting up your Mac..."

# # Check for Homebrew and install it if we don't have it
# if test ! $(which brew); then
#     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# fi

# # Update Homebrew recipes
# brew update

# # Install Homebrew dependencies with bundle
# brew tap homebrew/bundle
# brew bundle

# Remove dotfiles locally and setup symlinks
DIR=$HOME/.dotfiles

DOTFILES=(
    ".zshrc"
    ".gitconfig"
)

for dotfile in "${DOTFILES[@]}";do
	rm -rf "${HOME}/${dotfile}"
	ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done

# Special case symlink for settings.json becuase of the local file path
ln -s $HOME/.dotfiles/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

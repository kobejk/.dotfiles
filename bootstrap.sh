#!/bin/bash

# A post installation script to configure WSL

# Install packages
# zsh - used instead of bash, enables shell customisation
# ripgrep - required for grepping inside of neovim 
# tree - shows a tree representation of file structure
# neofetch - system information
# git - version control
# g++ - C++ compiler, required for nvim treesitter formatting

sudo apt update && sudo apt install zsh ripgrep tree neofetch git g++

# neovim/nvim - a better version of vim
# the following code builds from the source of the stable branch
# I prefer to store it in the Downloads directory which by default doesn't exist on WSL,
# so we create it
mkdir Downloads
cd Downloads
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
sudo make install

# move back to home directory after installing nvim

# setup ohmyzsh, this will not work as it's inside an install script. This needs to be fixed.

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"





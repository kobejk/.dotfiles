# My Dotfiles

This is a repo for my dotfiles that are used on both WSL and MacOS.

GNU Stow will be used to create symlinks between files.

## Installing dotfiles

Install GNU Stow (used for creating symlinks)

```bash
sudo apt update && sudo apt install stow
```

Move into the `.dotfiles` directory and Stow the files to create symlinks.

```bash
cd ~/.dotfiles

# Stow all directories inside of .dotfiles
stow */

# Stow specific configuration
stow nvim
```

NOTE: `nvim.bak` is a backup of my previous neovim configuration. Do not stow this.

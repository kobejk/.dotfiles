# My Dotfiles

This is a repo for my dotfiles that are used on both WSL and MacOS.

GNU Stow will be used to create symlinks between files.

---

## File structure

A programs configuration is stored in a folder under the same name.
For example, the configuration for `nvim` is stored inside of the `nvim` folder.

Once inside the nvim folder, the user should act as if they are inside their home directory.

For example, the configuration for `nvim` is located in `~/.config/nvim`. Therefore, inside
the `~/.dotfiles/nvim` folder, that same structure should be replicated `.dotfiles/nvim/.config/nvim/*`.

```bash
.dotfiles/nvim
└── .config
    └── nvim
        ├── init.lua
        └── lazy-lock.json
```

---

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

---

## Testing out my nvim configuration

I know that a few people have asked if they could test out the neovim configuration.
It's not the cleanest to look at (or understand if you're looking at it for the fist time)
since it's a modified version of the [kickstart nvim](https://github.com/nvim-lua/kickstart.nvim)
configuration file.

Most functionality is the same, with one or two different plugins and remaps.

### Requirements

- Neovim 0.9.0
- Linux/MacOS/WSL (I don't run this configuration in a native Windows environment)
- g++ (or similar c++ compiler)
- python3.10-venv
- python3-pip
- ripgrep
- fd find

### Backing up existing configuration

If you have an existing configuration, you're going to want to back it up.

```bash
# required
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Installing Neovim

As of writing this, the latest version of Neovim is not available in most package management repositories.
To install the version required for this configuration, you're going to have to build it from source.

#### WSL/Ubuntu

1. Install some dependencies

```bash
sudo apt install ninja-build gettext cmake unzip curl
```

2. Install nvim

```bash
# clone nvim repo
git clone https://github.com/neovim/neovim ~/

# start setup
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

# make sure you're using the stable version (omit this if you want the dev build)
git checkout stable

# install
sudo make install
```

#### MacOS

Neovim will be installed using the Homebrew package manager. This repository contains the required
version of 0.9.0.

Install [homebrew](https://brew.sh/) package manager

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Neovim

```bash
brew install neovim
```

---

### Installing the config

To install my configuration, make sure you have a C++ compiler installed to avoid treesitter errors.

```bash
sudo apt install g++
```

Either run the stow command as specified in the dotfiles installation, or simply copy the `init.lua`
contents into your `init.lua` as below.

```bash
mkdir -p ~/.config/nvim
cd ~/.config/nvim
touch init.lua
```

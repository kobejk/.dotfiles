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

NOTE: `nvim.bak` is a backup of my previous neovim configuration. Do not stow this.

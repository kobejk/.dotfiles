-- set leader key to space
vim.g.mapleader = " "

-- navigate back to file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- move lines when highlighted using J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- appened current line to the line above you and keep your cursor in the same spot
vim.keymap.set("n", "J", "mzJ`z")

--- ctrl + d and ctrl + u now have cursor centered in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--- search terms remain in the middle of screen when moving to next and previous instances
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- makes ctrl + c and esc the same
vim.keymap.set("i", "<C-c>", "<Esc>")

--- Q does nothing now
vim.keymap.set("n", "Q", "<nop>")

-- set leader key
-- must happen before plugins are required/loaded otherwise wrong leader will be set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move lines up and down when highlighted using J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- appened current line to the line above you while keeping the cursor in the same position
vim.keymap.set("n", "J", "mzJ`z")

-- ctrl + d and ctrl + u keep the cursor centered in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- makes ctrl + c and esc the same
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Q does nothing now
vim.keymap.set("n", "Q", "<nop>")

-- split windows
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit [V]ertically" }) -- vertically
vim.keymap.set("n", "<leader>sh", "<C-w>sv", { desc = "[S]plit [H]orizontally" }) -- horizontally

-- move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- keymaps for better default experience
-- See `:help vim.keymap.set()`
-- taken from https://github.com/nvim-lua/kickstart.nvim
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

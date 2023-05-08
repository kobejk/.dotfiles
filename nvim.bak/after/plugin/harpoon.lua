-- configure harpoon

-- mark adds file to harpoon
local mark = require("harpoon.mark")

-- ui shows a small ui with all marked/harpooned files
local ui = require("harpoon.ui")

-- add file to harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)

-- open harpoon menu
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- switch quickly between each marked/harpooned files
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

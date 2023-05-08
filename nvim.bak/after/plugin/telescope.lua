-- configure telescope shortcuts

local builtin = require('telescope.builtin')
-- open telescope menu
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- open telescope menu, but only search for git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- grep for a word over all files in the directory and subdirectories that nvim was started in
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

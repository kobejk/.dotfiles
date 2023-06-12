-- set colour scheme to gruvbox
-- source: https://github.com/ellisonleao/gruvbox.nvim#basic-usage

vim.o.background = "dark" -- or "light" for light mode

-- extra config
require("gruvbox").setup({
	-- disable italics
	italic = {
		strings = false,
		comments = false,
		operators = false,
		folds = false,
	},
})

vim.cmd("colorscheme gruvbox")

-- [[ configure indent guides ]]
vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

-- change indent colour, may need to disable colour when using different
-- themes, colour found here: https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua
vim.cmd([[highlight IndentBlanklineIndent guifg=#928374 gui=nocombine]])

require("indent_blankline").setup({
	show_end_of_line = true,
	char_highlight_list = {
		"IndentBlanklineIndent",
	},
})

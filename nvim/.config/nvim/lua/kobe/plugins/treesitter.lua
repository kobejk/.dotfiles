-- [[ configure treesitter ]]
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"json",
		"typescript",
		"javascript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"bash",
		"vim",
		"astro",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

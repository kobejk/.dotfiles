-- install lazy.nvim if not already installed

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins to be installed
local plugins = {

	-- gruvbox colour scheme
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },

	-- surround text with characters
	{ "tpope/vim-surround" },

	-- use gc to comment visual regions/lines
	{ "numToStr/Comment.nvim" },

	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	-- telescope, fuzzy finding for files
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },

	-- fuzzy finding algorithm
	-- source: https://github.com/nvim-lua/kickstart.nvim
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	-- harpoon, sticky files
	{ "ThePrimeagen/harpoon" },

	-- treesitter, syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},

	-- undo history
	{ "mbbill/undotree" },

	-- lsp and auto complete
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},

	-- add git signs to left hand gutter
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- linting and formatting
	{ "jose-elias-alvarez/null-ls.nvim" },
	-- configure linters and formatters installed with mason
	{ "jay-babu/mason-null-ls.nvim" },
}

-- extra configuration, see https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration
local opts = {}

require("lazy").setup(plugins, opts)

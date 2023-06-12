-- configure neovim options

-- force thick cursor always
vim.opt.guicursor = ""

-- number the lines
vim.opt.nu = true
vim.opt.relativenumber = true

-- split windows in a certain direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- unhighlight search results after exiting search
vim.opt.hlsearch = false

-- progressively highlight search results while searching
vim.opt.incsearch = true

-- keep at least 8 lines at the bottom of the screen at all times
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

-- use 4 space indenting instead of the default 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable mouse mode
vim.o.mouse = "a"

-- check which OS we are on, and sync keyboard between vim and OS
-- credit devaslife dotfiles (https://github.com/craftzdog/dotfiles-public)
local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")
local is_wsl = has("wsl")

if is_mac == 1 then
	vim.opt.clipboard:append({ "unnamedplus" })
end

if is_win == 1 then
	vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end

if is_wsl == 1 then
	vim.cmd([[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
]])
end

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Use better colours... NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

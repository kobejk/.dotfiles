-- set basic nvim settings here

--- fat cursor
vim.opt.guicursor = ""

--- relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--- 4 space indenting instead of 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- be smart about indenting???
vim.opt.smartindent = true

-- don't wrap lines
vim.opt.wrap = false

--- don't keep search terms highlighted after exiting search
vim.opt.hlsearch = false

--- progressively highlight the word as you as searching
vim.opt.incsearch = true

--- betters colours for some themes
vim.opt.termguicolors = true

--- keep atleast 8 lines at the end of the file when moving upwards
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- no idea what this does, apparently its faster
vim.opt.updatetime = 50

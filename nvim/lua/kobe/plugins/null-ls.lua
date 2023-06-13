-- [[ configure null_ls and mason_null_ls ]]

-- make sure these linters are formatters are installed
require("mason-null-ls").setup({
	ensure_installed = {
		"prettier", -- javascript/typescript
		"stylua", -- lua
		"eslint_d", -- javascript / typescript
		"ruff", -- python
		"mypy", -- python
		"black", -- python
	},
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- needed for formatting on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- define the linters and formatters to be configured
null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		diagnostics.eslint_d,
		diagnostics.ruff,
		diagnostics.mypy,
		formatting.black,
	},

	-- format code on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

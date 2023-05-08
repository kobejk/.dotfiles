-- configure LSP servers

-- setup mason
require("mason").setup()

-- setup mason-lsp-config
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", }, -- make sure atleast lua lsp is installed
}

-- setup keybindings for each LSP buffer
local on_attach = function(_, _)
    vim.keymap.set("n", "gd",  vim.lsp.buf.definition, {}) -- go to definition
    vim.keymap.set("n", "gi",  vim.lsp.buf.definition, {}) -- go to inmplementation
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, {}) -- find references of the function through telescope
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- give documentation
end

-- add autocomplete capabilities here
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- setup required lua LSP
require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}


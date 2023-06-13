-- [[ configure lsp-zero ]]

local lsp = require("lsp-zero").preset({})

-- make sure these servers are installed
lsp.ensure_installed({
	"tsserver",
	"astro",
	"tailwindcss",
	"lua_ls",
	"pyright",
	"ltex",
	"html",
	"jsonls",
	"cssls",
	"marksman",
})

-- keymaps for selecting snippets
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable tabs for snippets
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

-- disable sign icons and replace with letters
lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

-- default keymaps for LSP functionality
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	-- setup code actions keymap
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
end)

lsp.setup()

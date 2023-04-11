-- mason
require("mason").setup() -- package manager
require("mason-lspconfig").setup({ -- brigde for lsp
	ensure_installed = {
		"lua_ls",
		"clangd",
		"jdtls",
		"phpactor",
		"tsserver",
		"vimls",
		"html",
		"cssls",
		"marksman",
		"texlab",
		"bashls",
	}, -- automatic installation of language servers
})
require("mason-null-ls").setup({ -- bridge for formatters and linters -- hooks non LSP processes to the neovim LSP client
	ensure_installed = { "prettier", "stylua", "clang-format" }, -- automatic installation of formatters and linters
	automatic_installation = true,
	automatic_setup = false, -- see null-ls.lua for configuration
})

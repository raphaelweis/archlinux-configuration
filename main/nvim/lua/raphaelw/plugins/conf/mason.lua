-- mason
local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
	return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then
	return
end

local mason_null_ls_setup, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_setup then
	return
end

mason.setup() -- package manager
mason_lspconfig.setup({ -- brigde for lsp
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
mason_null_ls.setup({ -- bridge for formatters and linters -- hooks non LSP processes to the neovim LSP client
	ensure_installed = { "prettier", "stylua", "clang-format", "php-cs-fixer" }, -- automatic installation of formatters and linters
	automatic_installation = true,
	automatic_setup = false, -- see null-ls.lua for configuration
})

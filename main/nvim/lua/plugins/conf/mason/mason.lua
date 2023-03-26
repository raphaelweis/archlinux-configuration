-- mason
require("mason").setup() -- package manager
require("mason-lspconfig").setup({ -- brigde for lsp
	ensure_installed = { "lua_ls", "clangd", "jdtls", "vimls", "html", "cssls", "tsserver", "marksman" }, -- automatic installation of language servers
})
require("mason-null-ls").setup({ -- bridge for formatters and linters
	ensure_installed = { "prettier", "stylua", "clang-format" }, -- automatic installation of formatters and linters
	automatic_installation = false,
	automatic_setup = true,
})
require("mason-null-ls").setup_handlers() -- has to be set to true if "automatic_setup" is set to true (avoids manual configuration of formatters with null-ls)

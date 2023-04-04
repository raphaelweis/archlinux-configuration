-- mason
require("mason").setup() -- package manager
require("mason-lspconfig").setup({ -- brigde for lsp
	ensure_installed = {
		"lua_ls",
		"clangd",
		"jdtls",
		"intelephense",
		"phpactor",
		"tsserver",
		"vimls",
		"html",
		"cssls",
		"marksman",
	}, -- automatic installation of language servers
})
require("mason-null-ls").setup({ -- bridge for formatters and linters
	ensure_installed = { "prettier", "stylua", "clang-format", "pint", "phpstan" }, -- automatic installation of formatters and linters
	automatic_installation = true,
	automatic_setup = true,
})

local null_ls = require("null-ls")

require("mason-null-ls").setup_handlers({
	function(source_name, methods)
		-- all sources with no handler get passed here

		-- To keep the original functionality of `automatic_setup = true`,
		-- please add the below.
		require("mason-null-ls.automatic_setup")(source_name, methods)
	end,
	stylua = function(source_name, methods)
		null_ls.register(null_ls.builtins.formatting.stylua)
	end,
}) -- has to be set to true if "automatic_setup" is set to true (avoids manual configuration of formatters with null-ls)

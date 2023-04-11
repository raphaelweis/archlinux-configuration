-- nvim-cmp
local cmp = require("cmp")
cmp.setup({ -- load cmp completion
	snippet = { -- choose snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- luasnip as main snippet engine
		end,
	},
	mapping = cmpKeymaps(cmp), -- see function definition in the "keymaps" sections
	sources = cmp.config.sources({ -- sources for propositions
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	}),
})

-- load vs-code snippets from plugins (example : from friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

local capabilities = require("cmp_nvim_lsp").default_capabilities() -- from documentation
local on_attach = function(client, bufnr) -- to make sure that the following keybinds are not active when the language server is not installed
	LSPKeymaps({ noremap = true, silent = true, buffer = bufnr }) -- passing of the options table as an argument
end
cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done()) -- to make autopairs.nvim insert () after accepting a proposition

require("lspconfig")["lua_ls"].setup({ -- Lua language server config
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- To make the lua language server recognize "vim" as a global variable
			},
		},
	},
})
require("lspconfig")["clangd"].setup({ -- C language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["jdtls"].setup({ -- Java language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["vimls"].setup({ -- Vim language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["nil_ls"].setup({ -- Nix language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["marksman"].setup({ -- Markdown language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["html"].setup({ -- HTML language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["cssls"].setup({ -- CSS language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["tsserver"].setup({ -- Javascript language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["phpactor"].setup({ -- PHP language server
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["texlab"].setup({ -- LaTeX language server
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig")["bashls"].setup({ -- Bash language server
	capabilities = capabilities,
	on_attach = on_attach,
})

-- nvim-cmp
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
	return
end

local luasnip_loaders_setup, luasnip_loaders = pcall(require, "luasnip/loaders/from_vscode")
if not luasnip_loaders_setup then
	print("Warning: could not load luasnip_loader. see nvim-cmp.lua")
	return
end

local cmp_nvim_slp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_slp_setup then
	print("Warning: could not load cmp_nvim_lsp. see nvim-cmp.lua")
	return
end

local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then
	print("Warning: could not load cmp_nvim_lsp. see nvim-cmp.lua")
	return
end

cmp.setup({ -- load cmp completion
	snippet = { -- choose snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- luasnip as main snippet engine
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<TAB>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion (for consistency)
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({ -- sources for propositions
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	}),
})

-- load vs-code snippets from plugins (example : from friendly-snippets)
luasnip_loaders.lazy_load()

local capabilities = cmp_nvim_lsp.default_capabilities() -- from documentation
local on_attach = function(client, bufnr) -- to make sure that the following keybinds are not active when the language server is not installed
	LSPKeymaps({ noremap = true, silent = true, buffer = bufnr }) -- passing of the options table as an argument
end
cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done()) -- to make autopairs.nvim insert () after accepting a proposition

lspconfig["lua_ls"].setup({ -- Lua language server config
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
lspconfig["clangd"].setup({ -- C language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["jdtls"].setup({ -- Java language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["vimls"].setup({ -- Vim language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["nil_ls"].setup({ -- Nix language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["marksman"].setup({ -- Markdown language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["html"].setup({ -- HTML language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["cssls"].setup({ -- CSS language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["tsserver"].setup({ -- Javascript language server config
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["phpactor"].setup({ -- PHP language server
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["texlab"].setup({ -- LaTeX language server
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["bashls"].setup({ -- Bash language server
	capabilities = capabilities,
	on_attach = on_attach,
})

-- keymaps

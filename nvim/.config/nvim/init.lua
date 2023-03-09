----------------------------
-- Keymaps --
----------------------------
--bonjour
-- leader key definition
vim.g.mapleader = " " -- define space as leader key

-- general keymaps
vim.keymap.set("i", "jk", "<ESC>") -- use jk to exit insert mode
vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>") -- remove highlighting after search

-- window and tab management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current split window

vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>") -- move the cursor to the adjacent top window
vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>") -- move the cursor to the adjacent bottom window
vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>") -- move the cursor to the adjacent left window
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>") -- move the cursor to the adjacent right window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab

-- plugin specific keymaps
vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeFocusToggle<CR>") -- toggle + focus file tree

vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>") -- toggle terminal inside neovim (available in normal and terminal mode)

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")

local cmpKeymaps = function(cmp) -- keymaps for viewing and accepting autocompletion propositions
	return cmp.mapping.preset.insert({
		["<TAB>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion (for consistency)
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	})
end

local LSPKeymaps = function(opts) -- keymaps for lsp functionalities, such as code actions, diagnostics, documentation, etc
	vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
end

-----------------------------
-- Options --
-----------------------------

-- appearance
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers wrapping cursor line (10 lines)
vim.opt.termguicolors = true -- enable 24-bit RGB color for the UI
vim.opt.background = "dark" -- choose preferred option for the colorscheme (light/dark)
vim.opt.signcolumn = "auto" -- draws a column on the left to display things like breakpoints (auto = only when necessary)
vim.opt.showmode = false -- prevent neovim from displaying current mode since the status line already does it

-- text editing
vim.opt.tabstop = 2 -- tabs = 2 spaces
vim.opt.shiftwidth = 2 -- indentation = 2 spaces
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true -- copy indent from current line when going to a new line
vim.opt.wrap = false -- lines that are too long will not get cut to show on the line under them
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]]) -- prevent neovim from automatically commenting new lines

-----------------------------
-- Color Scheme --
-----------------------------

-- configuration function for the gruvbox plugin
local colorschemeConfig = function() -- configuration for gruvbox.nvim plugin (main colorscheme)
	require("gruvbox").setup({
		italic = false, -- disable displaying comments and strings in italic
		transparent_mode = true, -- enable or disable colored background that is specific to neovim (also affects things like terminal mode)
	})
	vim.cmd("colorscheme gruvbox") -- set colorscheme
end

-----------------------------
-- Plugins declaration --
-----------------------------

-- installation for the lazy.nvim plugin manager (pulled straight from the documentation)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins table
local plugins = {
	{
		"ellisonleao/gruvbox.nvim", -- colorscheme plugin (currently main colorscheme)
		lazy = false,
		priority = 1000, -- to ensure that the colorscheme gets loaded first
		config = colorschemeConfig, -- plugin configuration call
	},
	{ "folke/which-key.nvim" }, -- pop-up menu that shows possible keybinds after pressing a key
	{ "windwp/nvim-autopairs" }, -- automatically insert closing brackets, parenthesis, quotes, etc
	{ "numToStr/Comment.nvim" }, -- automatically comment lines or blocks of code
	{ "akinsho/toggleterm.nvim" }, -- pop-up terminal inside neovim
	{ "goolord/alpha-nvim", dependencies = "nvim-tree/nvim-web-devicons" }, -- neovim welcome screen
	{
		"nvim-lualine/lualine.nvim", -- status line
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim", -- file explorer
		branch = "v2.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter", -- better syntax highlighting (among other things)
		build = ":TSUpdate",
		dependencies = "windwp/nvim-ts-autotag",
	},
	{
		"nvim-telescope/telescope.nvim", -- fuzzy finder for neovim
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-telescope/telescope-fzf-native.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim", -- fzf algorithm to make telescope fuzzy finder faster
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"hrsh7th/nvim-cmp", -- autocompletion
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
	},
	{
		"williamboman/mason.nvim", -- gui for managing language servers, formatters and linters
		dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "jay-babu/mason-null-ls.nvim" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim", -- formatters and linters installation and configuration
		dependencies = "jay-babu/mason-null-ls.nvim",
	},
	{
		"glepnir/lspsaga.nvim", -- additional lsp functionnality
		event = "BufRead",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" }, -- /!\ markdown and markdown_inline parsers need to be installed !
	},
}

-- options table
local opts = {}

-- installation
require("lazy").setup(plugins, opts)

-----------------------------
-- Plugins configuration --
-----------------------------

-- which-key
require("which-key").setup()

-- nvim-autopairs
require("nvim-autopairs").setup()

-- Comment
require("Comment").setup()

-- toggleterm
require("toggleterm").setup({
	direction = "float",
})

-- alpha-nvim
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
alpha.setup(dashboard.config)

-- lualine
require("lualine").setup() -- load lualine

-- nvim-neo-tree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]) -- from documentation

-- nvim-treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"java",
		"vim",
		"html",
		"css",
		"javascript",
		"json",
		"markdown",
		"markdown_inline",
		"help",
	}, -- ensure these treesitter parsers are installed
	highlight = { enable = true }, -- enable better syntax highlighting
	autotag = { enable = true }, -- automatic closing for html tags
})

-- telescope
require("telescope").setup() -- load telescope
require("telescope").load_extension("fzf") -- load fzf extension

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

-- null-ls
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({ -- formatters and linters
	on_attach = function(current_client, bufnr) -- enable auto-formatting of the document when saving (from documentation)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client) --  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

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

-- lspsaga
require("lspsaga").setup()

-----------------------------
-- Extra
-----------------------------

-- get rid of the following warning concerning null-ls,
-- see : https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

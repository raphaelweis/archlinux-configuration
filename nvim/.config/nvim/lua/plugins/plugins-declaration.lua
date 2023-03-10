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

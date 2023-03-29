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
		"ellisonleao/gruvbox.nvim", -- colorscheme plugin 1
		lazy = false,
		priority = 1000, -- to ensure that the colorscheme gets loaded first
		config = GruvboxConfig, -- plugin configuration call
	},
	{
		"folke/tokyonight.nvim", -- colorscheme plugin 2
		lazy = false,
		priority = 1000, -- to ensure that the colorscheme gets loaded first
		config = TokyonightConfig, -- plugin configuration call
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
		dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
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
	{ "rafamadriz/friendly-snippets" },
	{
		"williamboman/mason.nvim", -- gui for managing language servers, formatters and linters
		dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "jay-babu/mason-null-ls.nvim" },
	},
	{ "mfussenegger/nvim-dap" }, -- nvim DAP - debug adapter protocol
	{
		"jose-elias-alvarez/null-ls.nvim", -- formatters and linters installation and configuration
		dependencies = "jay-babu/mason-null-ls.nvim",
	},
	{
		"glepnir/lspsaga.nvim", -- additional lsp functionnality
		event = "BufRead",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" }, -- /!\ markdown and markdown_inline parsers need to be installed !
	},
	{ "Tastyep/structlog.nvim" }, -- more structured login messages
	{ "rcarriga/nvim-notify" }, -- notifications
	{ "folke/neodev.nvim" }, -- completion and documentation for lua neovim config and API's
	{ "lewis6991/gitsigns.nvim" }, -- git decoration on sidebar
	{ "ahmedkhalf/project.nvim" }, -- project management plugin
	{ "akinsho/bufferline.nvim" }, -- bufferline with tabs
	{ "lukas-reineke/indent-blankline.nvim" }, -- indent guides (like in vs code)
	{ "eraserhd/parinfer-rust", build = "cargo build --release" }, -- to work with lisp expressions
	{ "iamcco/markdown-preview.nvim", build = "cd app && npm install" }, -- to preview markdown documents

	-- vimscript plugins
	{ "elkowar/yuck.vim" },
}

-- options table
local opts = {}

-- installation
require("lazy").setup(plugins, opts)

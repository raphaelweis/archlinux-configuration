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
		"akinsho/bufferline.nvim", -- bufferline with tabs
	},
	{
		"akinsho/toggleterm.nvim", -- pop-up terminal inside neovim
	},
	{
		"andrewferrier/wrapping.nvim", -- for better wrapping in natural text documents
	},
	{
		"catppuccin/nvim", -- colorscheme plugin
		lazy = false,
	},
	{
		"elkowar/yuck.vim", -- syntax highlighting for custom lisp like language - see EWW Widgets on github
	},
	{
		"ellisonleao/gruvbox.nvim", -- colorscheme plugin
	},
	{
		"folke/neodev.nvim", -- completion and documentation for lua neovim config and API's
	},
	{
		"folke/tokyonight.nvim", -- colorscheme plugin
		lazy = false,
		priority = 1000,
	},
	{
		"folke/which-key.nvim", -- pop-up menu that shows possible keybinds after pressing a key
	},
	{
		"glepnir/lspsaga.nvim", -- additional lsp functionnality
		event = "BufRead",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" }, -- /!\ markdown and markdown_inline parsers need to be installed !
	},
	{
		"goolord/alpha-nvim", -- neovim welcome screen
		dependencies = "nvim-tree/nvim-web-devicons",
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
		"iamcco/markdown-preview.nvim", -- to preview markdown documents
		build = "cd app && npm install",
	},
	{
		"jose-elias-alvarez/null-ls.nvim", -- formatters and linters installation and configuration
		dependencies = "jay-babu/mason-null-ls.nvim",
	},
	{
		"lervag/vimtex", -- for LaTeX documents
	},
	{
		"lewis6991/gitsigns.nvim", -- git decoration on sidebar
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- indent guides (like in vs code)
	},
	{
		"lunarvim/Onedarker.nvim", -- colorscheme plugin
		lazy = false,
		priority = 1000,
		dependencies = nil,
	},
	{
		"mfussenegger/nvim-dap", -- nvim DAP - debug adapter protocol
	},
	{
		"numToStr/Comment.nvim", -- automatically comment lines or blocks of code
		dependencies = nil,
	},
	{
		"nvim-lualine/lualine.nvim", -- status line
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim", -- file explorer
		branch = "v2.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	},
	{
		"nvim-telescope/telescope.nvim", -- fuzzy finder for neovim
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter", -- better syntax highlighting (among other things)
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
	},
	{
		"Pocco81/true-zen.nvim", -- toggle between modes for zen coding
	},
	{
		"rafamadriz/friendly-snippets", -- snippets collections for all filetypes
	},
	{
		"rcarriga/nvim-notify", -- notifications
	},
	{
		"rose-pine/neovim",
		priority = 1000,
	},
	{
		"sam4llis/nvim-tundra", -- colorscheme plugin
		lazy = false,
		priority = 1000,
		dependencies = nil,
	},
	{
		"Shatur/neovim-session-manager", -- manage sessions in vscode fashion
	},
	{
		"Tastyep/structlog.nvim", -- more structured login messages
	},
	{
		"tpope/vim-fugitive", -- the Lebron James equivalent of vim plugins
	},
	{
		"windwp/nvim-autopairs", -- automatically insert closing brackets, parenthesis, quotes, etc
		dependencies = nil,
	},
	{
		"williamboman/mason.nvim", -- gui for managing language servers, formatters and linters
		dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "jay-babu/mason-null-ls.nvim" },
	},
	{
		"ziontee113/icon-picker.nvim", -- icon and special character picker
	},

	-- deprecated plugins list (the configuration for those still exists, but they are not in use)
	-- "ahmedkhalf/project.nvim" | project management plugin
}

-- options table
local opts = {}

-- installation
require("lazy").setup(plugins, opts)

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
		priority = 50,
		config = function()
			require("plugins.conf.bufferline")
		end,
	},
	{
		"akinsho/toggleterm.nvim", -- pop-up terminal inside neovim
		priority = 50,
		config = function()
			require("plugins.conf.toggleterm")
		end,
	},
	{
		"andrewferrier/wrapping.nvim", -- for better wrapping in natural text documents
		priority = 50,
		config = function()
			require("plugins.conf.wrapping")
		end,
	},
	{
		"catppuccin/nvim", -- colorscheme plugin
		lazy = false,
		priority = 1000,
		config = function()
			require("colorscheme.catppuccin")
		end,
	},
	{
		"elkowar/yuck.vim", -- syntax highlighting for custom lisp like language - see EWW Widgets on github
		priority = 50,
		config = function()
			require("plugins.conf.yuck")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim", -- colorscheme plugin
		priority = 1000, -- to ensure that the colorscheme gets loaded first
		config = function()
			require("colorscheme.gruvbox") -- plugin configuration call
		end,
	},
	{
		"folke/neodev.nvim", -- completion and documentation for lua neovim config and API's
		priority = 50,
		config = function()
			require("plugins.conf.neodev")
		end,
	},
	{
		"folke/tokyonight.nvim", -- colorscheme plugin
		lazy = false,
		priority = 1000,
		config = function()
			require("colorscheme.tokyonight")
		end
	},
	{
		"folke/which-key.nvim", -- pop-up menu that shows possible keybinds after pressing a key
		priority = 50,
		config = function()
			require("plugins.conf.which-key")
		end,
	},
	{
		"glepnir/lspsaga.nvim", -- additional lsp functionnality
		event = "BufRead",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" }, -- /!\ markdown and markdown_inline parsers need to be installed !
		config = function()
    		require("plugins.conf.lspsaga")
		end,
	},
	{
		"goolord/alpha-nvim", -- neovim welcome screen
		priority = 50,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.conf.alpha-nvim")
		end,
	},
	{
		"hrsh7th/nvim-cmp", -- autocompletion
		priority = 50,
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("plugins.conf.nvim-cmp")
		end,
	},
	{
		"iamcco/markdown-preview.nvim", -- to preview markdown documents
		priority = 50,
		build = "cd app && npm install",
		config = function()
			require("plugins.conf.markdown-preview")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim", -- formatters and linters installation and configuration
		priority = 50,
		dependencies = "jay-babu/mason-null-ls.nvim",
		config = function()
			require("plugins.conf.null-ls")
		end,
	},
	{
		"lervag/vimtex", -- for LaTeX documents
		priority = 50,
		config = function()
			require("plugins.conf.vimtex")
		end,
	},
	{
		"lewis6991/gitsigns.nvim", -- git decoration on sidebar
		priority = 50,
		config = function()
			require("plugins.conf.gitsigns")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- indent guides (like in vs code)
		priority = 50,
		config = function()
			require("plugins.conf.indent-blankline")
		end,
	},
	{
		"lunarvim/Onedarker.nvim", -- colorscheme plugin
		lazy = false,
		priority = 1000,
		dependencies = nil,
		config = function()
			require("colorscheme.onedarker")
		end,
	},
	{
		"mfussenegger/nvim-dap", -- nvim DAP - debug adapter protocol
		priority = 50,
		config = function()
			require("plugins.conf.nvim-dap")
		end,
	},
	{
		"numToStr/Comment.nvim", -- automatically comment lines or blocks of code
		priority = 50,
		dependencies = nil,
		config = function()
			require("plugins.conf.comment")
		end,
	},
	{
		"nvim-lualine/lualine.nvim", -- status line
		priority = 50,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.conf.lualine")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim", -- file explorer
		priority = 50,
		branch = "v2.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		config = function()
			require("plugins.conf.nvim-neo-tree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim", -- fuzzy finder for neovim
		priority = 50,
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("plugins.conf.telescope")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter", -- better syntax highlighting (among other things)
		priority = 50,
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("plugins.conf.nvim-treesitter")
		end,
	},
	{
		"Pocco81/true-zen.nvim", -- toggle between modes for zen coding
		priority = 50,
		config = function()
			require("plugins.conf.true-zen")
		end,
	},
	{
		"rafamadriz/friendly-snippets", -- snippets collections for all filetypes
		priority = 50,
		config = function()
			require("plugins.conf.friendly-snippets")
		end,
	},
	{
		"rcarriga/nvim-notify", -- notifications
		priority = 50,
		config = function()
			require("plugins.conf.nvim-notify")
		end,
	},
	{
		"sam4llis/nvim-tundra", -- colorscheme plugin
		lazy = false,
		priority = 1000,
		dependencies = nil,
		config = function()
			require("colorscheme.tundra")
		end,
	},
	{
		"Shatur/neovim-session-manager", -- manage sessions in vscode fashion
		priority = 50,
		config = function()
			require("plugins.conf.neovim-session-manager")
		end,
	},
	{
		"Tastyep/structlog.nvim", -- more structured login messages
		priority = 50,
		config = function()
			require("plugins.conf.structlog")
		end,
	},
	{
		"tpope/vim-fugitive", -- the Lebron James equivalent of vim plugins
		priority = 50,
		config = function()
			require("plugins.conf.vim-fugitive")
		end,
	},
	{
		"windwp/nvim-autopairs", -- automatically insert closing brackets, parenthesis, quotes, etc
		priority = 50,
		dependencies = nil,
		config = function()
			require("plugins.conf.nvim-autopairs")
		end,
	},
	{
		"williamboman/mason.nvim", -- gui for managing language servers, formatters and linters
		priority = 50,
		dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "jay-babu/mason-null-ls.nvim" },
		config = function()
			require("plugins.conf.mason")
		end,
	},
	{
		"ziontee113/icon-picker.nvim", -- icon and special character picker
		priority = 50,
		config = function()
			require("plugins.conf.icon-picker")
		end,
	},

	-- deprecated plugins list (the configuration for those still exists, but they are not in use)
	-- "ahmedkhalf/project.nvim" | project management plugin
}

-- options table
local opts = {}

-- installation
require("lazy").setup(plugins, opts)

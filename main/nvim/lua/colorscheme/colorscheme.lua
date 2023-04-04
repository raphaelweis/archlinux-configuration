-- configuration function for the gruvbox plugin
GruvboxConfig = function() -- configuration for gruvbox.nvim plugin
	require("gruvbox").setup({
		transparent_mode = true, -- enable or disable colored background that is specific to neovim (also affects things like terminal mode)
	})
	-- vim.cmd([[colorscheme gruvbox]])
end

TokyonightConfig = function()
	require("tokyonight").setup(require("colorscheme.conf.tokyonight"))
	vim.cmd([[colorscheme tokyonight]])
end

TundraConfig = function()
	require("nvim-tundra").setup({
		plugins = {
			telescope = true,
		},
	})
	-- vim.cmd([[colorscheme tundra]])
end

CatppuccinConfig = function()
	require("catppuccin").setup({})
	-- vim.cmd([[colorscheme catppuccin]])
end

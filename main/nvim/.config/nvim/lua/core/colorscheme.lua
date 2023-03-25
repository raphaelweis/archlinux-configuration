-- configuration function for the gruvbox plugin
GruvboxConfig = function() -- configuration for gruvbox.nvim plugin
	require("gruvbox").setup({
		italic = false, -- disable displaying comments and strings in italic
		transparent_mode = true, -- enable or disable colored background that is specific to neovim (also affects things like terminal mode)
	})
end

TokyonightConfig = function()
	require("tokyonight").setup({
		style = "storm",
		transparent = false,
	})
	vim.cmd([[colorscheme tokyonight]])
end

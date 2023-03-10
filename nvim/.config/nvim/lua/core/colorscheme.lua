-- configuration function for the gruvbox plugin
colorschemeConfig = function() -- configuration for gruvbox.nvim plugin (main colorscheme)
	require("gruvbox").setup({
		italic = false, -- disable displaying comments and strings in italic
		transparent_mode = true, -- enable or disable colored background that is specific to neovim (also affects things like terminal mode)
	})
	vim.cmd("colorscheme gruvbox") -- set colorscheme
end

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

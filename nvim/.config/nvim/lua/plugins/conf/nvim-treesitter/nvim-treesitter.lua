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
		"hocon",
	}, -- ensure these treesitter parsers are installed
	highlight = { enable = true }, -- enable better syntax highlighting
	indent = { enable = true }, -- enable indentation for the '=' operator (experimental)
	autotag = { enable = true }, -- automatic closing for html tags
})

local hocon_group = vim.api.nvim_create_augroup("hocon", { clear = true }) -- recognize *.conf files for hocon parser
vim.api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ group = hocon_group, pattern = "*/resources/*.conf", command = "set ft=hocon" }
)

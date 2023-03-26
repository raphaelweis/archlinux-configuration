require("bufferline").setup({
	options = {
		hover = {
			enabled = true,
			delay = 10,
			reveal = { "close" },
		},
		diagnostics = "nvim_lsp",
		indicator = {
			style = "icon",
		},
	},
})

-- Enable Vimtex
vim.g.tex_flavor = "latex"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_method = "general"
vim.g.vimtex_compiler_latexmk = {
	options = {
		"-pdf",
		"-interaction=nonstopmode",
		"-synctex=1",
		"-file-line-error",
		"-shell-escape",
	},
}

-- Configure keybindings
vim.api.nvim_set_keymap("n", "<leader>ll", ":VimtexCompile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>lv", ":VimtexView<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>lt", ":VimtexToggle<CR>", { noremap = true })

-- Set options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "vimtex#fold#expr()"
vim.opt.foldtext = "vimtex#fold#text()"
vim.opt.conceallevel = 2
vim.opt.concealcursor = "niv"
vim.opt.completeopt = "menuone,noinsert,noselect"

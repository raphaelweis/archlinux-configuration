-- lspsaga
local lspsaga_setup, lspsaga = pcall(require, "lspsaga")
if not lspsaga_setup then
	return
end

lspsaga.setup({
	symbol_in_winbar = {
		show_file = false,
	},
})

-- keymaps
LSPKeymaps = function(opts) -- keymaps for lsp functionalities, such as code actions, diagnostics, documentation, etc
	vim.keymap.set({ "n", "v" }, "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	vim.keymap.set({ "n", "v" }, "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	vim.keymap.set({ "n", "v" }, "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	vim.keymap.set({ "n", "v" }, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	vim.keymap.set({ "n", "v" }, "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	vim.keymap.set({ "n", "v" }, "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	vim.keymap.set({ "n", "v" }, "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	vim.keymap.set({ "n", "v" }, "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	vim.keymap.set({ "n", "v" }, "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	vim.keymap.set({ "n", "v" }, "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	vim.keymap.set({ "n", "v" }, "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
end

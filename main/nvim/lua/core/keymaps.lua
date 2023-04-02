-- leader key definition
vim.g.mapleader = " " -- define space as leader key

-- general keymaps
vim.keymap.set("i", "jk", "<ESC>") -- use jk to exit insert mode
vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>") -- remove highlighting after search

-- window and tab management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current split window

vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>") -- move the cursor to the adjacent top window
vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>") -- move the cursor to the adjacent bottom window
vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>") -- move the cursor to the adjacent left window
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>") -- move the cursor to the adjacent right window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") --  go to previous tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab

-- spell checking
vim.keymap.set("n", "<leader>wfr", "<cmd>set spell spelllang=fr<CR>") -- change spell checking language to french
vim.keymap.set("n", "<leader>wen", "<cmd>set spell spelllang=en<CR>") -- change spell checking language to english
vim.keymap.set("n", "<leader>ww", "<cmd>set spell!<CR>") -- toggle spell checking

-- plugin specific keymaps
vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeFocusToggle<CR>") -- toggle + focus file tree

vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>") -- toggle terminal inside neovim (available in normal and terminal mode)

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- fuzzy finder
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope find_files hidden=true<CR>") -- fuzzy finder with hidden files

vim.keymap.set("n", "<leader>za", "<cmd>TZAtaraxis<CR>") -- toggle ataraxis zen mode

cmpKeymaps = function(cmp) -- keymaps for viewing and accepting autocompletion propositions
	return cmp.mapping.preset.insert({
		["<TAB>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion (for consistency)
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	})
end

LSPKeymaps = function(opts) -- keymaps for lsp functionalities, such as code actions, diagnostics, documentation, etc
	vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
end

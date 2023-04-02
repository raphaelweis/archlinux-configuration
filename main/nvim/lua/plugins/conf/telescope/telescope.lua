-- -- telescope
-- require("telescope").setup({
-- 	defaults = {
-- 		prompt_prefix = "   ",
-- 	},
-- 	-- pickers = {
-- 	-- 	find_files = {
-- 	-- 		theme = "dropdown",
-- 	-- 	},
-- 	-- },
-- }) -- load telescope
--
-- require("telescope").load_extension("fzf") -- load fzf extension
-- require("telescope").load_extension("projects") -- load projects extension

local actions = require("telescope.actions")

vim.cmd([[
  highlight link TelescopePromptTitle PMenuSel
  highlight link TelescopePreviewTitle PMenuSel
  highlight link TelescopePromptNormal NormalFloat
  highlight link TelescopePromptBorder FloatBorder
  highlight link TelescopeNormal CursorLine
  highlight link TelescopeBorder CursorLineBg
]])

require("telescope").setup({
	defaults = {
		path_display = { truncate = 1 },
		prompt_prefix = "   ",
		selection_caret = "  ",
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-Down>"] = actions.cycle_history_next,
				["<C-Up>"] = actions.cycle_history_prev,
			},
		},
		file_ignore_patterns = { ".git/" },
	},
	pickers = {
		buffers = {
			previewer = false,
			layout_config = {
				width = 80,
			},
		},
		oldfiles = {
			prompt_title = "History",
		},
		lsp_references = {
			previewer = false,
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("projects") -- load projects extension

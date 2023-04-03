-- telescope
require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		path_display = { truncate = 3 },
		layout_config = {
			prompt_position = "top",
		},
	},
})

require("telescope").load_extension("fzf") -- load fzf extension
require("telescope").load_extension("projects") -- load projects extension

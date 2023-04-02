-- telescope
require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
	},
	-- pickers = {
	-- 	find_files = {
	-- 		theme = "dropdown",
	-- 	},
	-- },
}) -- load telescope

require("telescope").load_extension("fzf") -- load fzf extension
require("telescope").load_extension("projects") -- load projects extension

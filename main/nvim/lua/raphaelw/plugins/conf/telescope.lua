-- telescope
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

telescope.setup({
	defaults = {
		-- winblend = 100,
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		path_display = { truncate = 3 },
		layout_config = {
			prompt_position = "top",
		},
		borderchars = {
			"─", -- top
			"│", -- right
			"─", -- bottom
			"│", -- left
			"┌", -- top-left
			"┐", -- top-right
			"┘", -- bottom-right
			"└", -- bottom-left
		},
	},
})

telescope.load_extension("fzf") -- load fzf extension
telescope.load_extension("ui-select") -- load ui-select extension

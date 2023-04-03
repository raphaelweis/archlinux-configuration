require("session_manager").setup({
	autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
})

local config_group = vim.api.nvim_create_augroup("MyConfigGroup", {}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ "BufWritePost" }, { -- save session everytime a buffer is written to
	group = config_group,
	callback = function()
		if vim.bo.filetype ~= "git" and not vim.bo.filetype ~= "gitcommit" then
			require("session_manager").autosave_session()
		end
	end,
})

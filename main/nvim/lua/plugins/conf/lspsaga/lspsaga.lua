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

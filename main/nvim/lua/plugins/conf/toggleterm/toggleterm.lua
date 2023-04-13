-- toggleterm
local toggleterm_setup, toggleterm = pcall(require, "toggleterm")
if not toggleterm_setup then
	return
end

toggleterm.setup({
	direction = "float",
})

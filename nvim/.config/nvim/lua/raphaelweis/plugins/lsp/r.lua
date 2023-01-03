-- import cmp-nvim-r plugin safely
local cmp_nvim_r_status, cmp_nvim_r = pcall(require, "cmp-nvim-r")
if not cmp_nvim_r_status then
	return
end

cmp_nvim_r.setup({
	sources = {
		{ name = "cmp_nvim_r" },
	},
})

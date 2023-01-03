-- import cmp-nvim-r plugin safely
local cmp_nvim_r_status, cmp_nvim_r = pcall(require, "cmp-nvim-r")
if not cmp_nvim_r_status then
	return
end

cmp_nvim_r.setup({
	filetypes = { "r", "rmd", "quarto" },
	doc_width = 58,
})

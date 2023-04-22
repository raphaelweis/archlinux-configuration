local function setColorScheme()
  vim.cmd([[colorscheme rose-pine]])
end

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = setColorScheme,
})

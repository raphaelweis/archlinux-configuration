-- auto cmd
vim.api.nvim_exec(
	[[
  augroup waybar_reload
    autocmd!
    autocmd BufWritePost $HOME/.config/waybar/* silent !killall -SIGUSR2 waybar
  augroup END
]],
	true
)

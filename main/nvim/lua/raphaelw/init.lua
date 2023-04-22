-- core functionality
require("raphaelw.keymaps")
require("raphaelw.options")

-- plugins declaration
require("raphaelw.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd([[ colorscheme rose-pine ]])
  end,
})

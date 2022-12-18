  -- import harpoon plugin safely
local harpoon_mark, mark = pcall(require, "harpoon.mark")
if not harpoon_mark then
  return
end

local harpoon_ui, ui = pcall(require, "harpoon.ui")
if not harpoon_ui then
    return
end

local keymap = vim.keymap

keymap.set("n", "<leader>a", mark.add_file)
keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- recommanded settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    view = {
        width = 50,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})

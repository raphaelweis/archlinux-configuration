-- The plugins installation file
require("raphaelweis.plugins-setup")

-- The core folder with the basic neovim configuration
require("raphaelweis.core.options")
require("raphaelweis.core.keymaps")
require("raphaelweis.core.colorscheme")

-- The config files for the plugins that require it
require("raphaelweis.plugins.comment")
require("raphaelweis.plugins.nvim-tree")
require("raphaelweis.plugins.lualine")
require("raphaelweis.plugins.telescope")
require("raphaelweis.plugins.harpoon")
require("raphaelweis.plugins.undotree")
require("raphaelweis.plugins.nvim-cmp")
require("raphaelweis.plugins.lsp.mason") --lsp
require("raphaelweis.plugins.lsp.lspsaga") --lsp
require("raphaelweis.plugins.lsp.lspconfig") --lsp
require("raphaelweis.plugins.lsp.null-ls") --lsp
require("raphaelweis.plugins.autopairs")
require("raphaelweis.plugins.treesitter")
require("raphaelweis.plugins.gitsigns")
require("raphaelweis.plugins.which-key")

-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "arduino_language_server",
        "asm_lsp",
        "bashls",
        "clangd",
        "csharp_ls",
        "omnisharp_mono",
        "omnisharp",
        "cmake",
        "cssls",
        "gradle_ls",
        "groovyls",
        "html",
        "jsonls",
        "jdtls",
        "tsserver",
        "ltex",
        "sumneko_lua",
        "marksman",
        "intelephense",
        "jedi_language_server",
        "pyright",
        "r_language_server",
        "rust_analyzer",
    }
})

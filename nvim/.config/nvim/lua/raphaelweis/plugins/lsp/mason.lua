local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lsp_config_status, mason_lsp_config = pcall(require, "mason")
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lsp_config.setup()

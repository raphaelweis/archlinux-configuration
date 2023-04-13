-- null-ls
local null_ls_setup, null_ls = pcall(require, "null-ls")
if not null_ls_setup then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting

null_ls.setup({ -- formatters and linters
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.clang_format,
		formatting.phpcsfixer,
	},
	on_attach = function(current_client, bufnr) -- enable auto-formatting of the document when saving (from documentation)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client) --  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

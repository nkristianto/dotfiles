-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		formatting.stylua, -- lua formatter
		formatting.gofumpt,
		formatting.goimports,
		formatting.golines,
		diagnostics.staticcheck.with({
			diagnostics_format = "[#{c}] #{m} (#{s})",
			fallback_severity = vim.diagnostic.severity.HINT,
			diagnostic_config = {
				-- see :help vim.diagnostic.config()
				underline = true,
				virtual_text = false,
				signs = true,
				update_in_insert = false,
				severity_sort = true,
			},
		}),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

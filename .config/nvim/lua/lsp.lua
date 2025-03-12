local lspconfig = require('lspconfig')
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.ruff.setup({})
lspconfig.ts_ls.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp', {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local opts = { buffer = args.buf }
		if client.supports_method('textDocument/codeAction') then
			vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, opts)
		end
		if client.supports_method('textDocument/declaration') then
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		end
		if client.supports_method('textDocument/definition') then
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		end
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('lsp_format', {}),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({
						bufnr = args.buf,
						id = client.id,
						filter = function(client) return client.name ~= 'ts_ls' end,
					})
				end,
			})
		end
		if client.supports_method('textDocument/implementation') then
			vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, opts)
		end
		if client.supports_method('textDocument/references') then
			vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
		end
		if client.supports_method('textDocument/rename') then
			vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
		end
		if client.supports_method('textDocument/signatureHelp') then
			vim.keymap.set('i', '<C-S>', vim.lsp.buf.signature_help, opts)
		end
	end,
})

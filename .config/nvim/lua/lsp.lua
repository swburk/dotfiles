local lspconfig = require('lspconfig')
lspconfig.eslint.setup({})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.ruff_lsp.setup({})
lspconfig.tsserver.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local opts = { buffer = ev.buf }
		if client.supports_method('textDocument/hover') then
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		end
		if client.supports_method('textDocument/signatureHelp') then
			vim.keymap.set({ 'n', 'i' }, '<c-k>', vim.lsp.buf.signature_help, opts)
		end
		if client.supports_method('textDocument/declaration') then
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		end
		if client.supports_method('textDocument/definition') then
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		end
		if client.supports_method('textDocument/typeDefinition') then
			vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
		end
		if client.supports_method('textDocument/implementation') then
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		end
		if client.supports_method('textDocument/references') then
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		end
		if client.supports_method('textDocument/rename') then
			vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)
		end
		if client.supports_method('textDocument/codeAction') then
			vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
		end
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})

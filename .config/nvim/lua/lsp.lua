vim.lsp.config('*', {
	root_markers = { '.git' },
})

vim.lsp.enable({
	'gopls',
	'lua-language-server',
	'pyright',
	'ruff',
	'typescript-language-server',
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		local opts = { buffer = ev.buf }
		if client:supports_method('textDocument/declaration') then
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		end
		if client:supports_method('textDocument/definition') then
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		end
		if not client:supports_method('textDocument/willSaveWaitUntil')
				and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', {
					clear = false
				}),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({
						bufnr = ev.buf,
						id = client.id,
						filter = function(client)
							return client.name ~= 'typescript-language-server'
						end,
					})
				end,
			})
		end
	end,
})

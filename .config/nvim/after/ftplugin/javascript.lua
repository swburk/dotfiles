vim.opt_local.tabstop = 2
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = { 80 }
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt_local.foldenable = false

if vim.fn.executable('typescript-language-server') == 1 then
	vim.lsp.start({
		name = 'TypeScript Language Server',
		cmd = { 'typescript-language-server', '--stdio' },
		root_dir = vim.fs.dirname(vim.fs.find({'package.json', '.git'}, { upward = true })[1])
	})
end

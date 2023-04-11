vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = { 80 }

if vim.fn.executable('pyright-langserver') == 1 then
	vim.lsp.start({
		name = 'Pyright',
		cmd = { 'pyright-langserver', '--stdio' },
		root_dir = vim.fs.dirname(vim.fs.find({'requirements.txt', '.git'}, { upward = true })[1]),
		settings = {
			python = {}
		}
	})
end

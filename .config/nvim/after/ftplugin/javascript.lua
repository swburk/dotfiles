vim.opt_local.tabstop = 2
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = { '80' }
vim.opt_local.formatoptions:remove('t')

vim.cmd('packadd! nvim-lint')
vim.api.nvim_create_autocmd('BufWritePost', {
	group = vim.api.nvim_create_augroup('eslint', {}),
	callback = function()
		require('lint').try_lint('eslint')
	end,
})

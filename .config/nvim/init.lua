require('lsp')
require('treesitter')

vim.cmd('packadd auto-dark-mode.nvim')
local auto_dark_mode = require('auto-dark-mode')
auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.opt.background = 'dark'
	end,
	set_light_mode = function()
		vim.opt.background = 'light'
	end,
})

vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.shiftround = true
vim.opt.number = true
vim.cmd.colorscheme('catppuccin')

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true
})

vim.keymap.set('n', '<Plug>(SplitLine)',
	[[<cmd>keeppatterns substitute/\v^(\s*)(.{-})\s*%#\s*(.*)/\1\2\r\1\3/|]]
	.. [[call repeat#set("\<Plug>(SplitLine)")<cr>]], { noremap = true })
vim.keymap.set('n', 'S', '<Plug>(SplitLine)')
vim.keymap.set('n', '<tab>', '<c-^>', { noremap = true })
vim.keymap.set('n', 'gV', '`[v`]', { noremap = true })
vim.keymap.set('n', 'gs', ':%substitute///g<left><left>', { noremap = true })
vim.keymap.set('x', 'gs', ':substitute///g<left><left>', { noremap = true })
vim.keymap.set('n', 'gl', '<cmd>buffers<cr>:buffer<space>', { noremap = true })
vim.keymap.set('n', 'gm', '<cmd>global//number<cr>:', { noremap = true })
vim.keymap.set('c', '%%', '<c-r>=fnameescape(expand("%:h"))."/"<cr>', { noremap = true })
vim.keymap.set('i', '<c-space>', '<c-x><c-o>', { noremap = true })
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { noremap = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', '<space>', vim.diagnostic.open_float, {})
vim.api.nvim_create_user_command('Dllist', vim.diagnostic.setloclist, {})
vim.api.nvim_create_user_command('Dclist', vim.diagnostic.setqflist, {})

vim.api.nvim_create_autocmd('FileType',
	{ callback = function() vim.opt_local.formatoptions = 'cqj' end })

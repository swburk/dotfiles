require('lsp')
require('treesitter')

vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.shiftround = true
vim.g.netrw_banner = 0
vim.opt.number = true
vim.opt.foldlevelstart = 99
vim.opt.statusline = '%<%f %h%w%m%r%{FugitiveStatusline()}%=%l:%v/%L %y'
vim.cmd.colorscheme('catppuccin')

vim.keymap.set('x', 'ig', function()
	vim.cmd([[
		normal! G
		call search('^.', 'bcW')
		normal! $ogg0
		call search('^.', 'cW')
	]])
end)
vim.keymap.set('o', 'ig', '<Cmd>normal Vig<CR>', { silent = true })
vim.keymap.set('x', 'ag', 'G$ogg0')
vim.keymap.set('o', 'ag', '<Cmd>normal Vag<CR>', { silent = true })

vim.keymap.set('n', '<Plug>(SplitLine)',
	[[<Cmd>keeppatterns substitute/\v^(\s*)(.{-})\s*%#\s*(.*)/\1\2\r\1\3/]]
	.. [[<Bar>call repeat#set("\<Plug>(SplitLine)")<CR>]]
)
vim.keymap.set('n', 'S', '<Plug>(SplitLine)')
vim.keymap.set('n', '<Tab>', '<C-^>')
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y')
vim.keymap.set('n', 'gY', '"+y$')
vim.keymap.set('x', 'gY', '"+Y')
vim.keymap.set('n', 'gV', '`[v`]')
vim.keymap.set('n', 'gs', ':%substitute///g<Left><Left>')
vim.keymap.set('x', 'gs', ':substitute///g<Left><Left>')
vim.keymap.set('n', 'gl', '<Cmd>buffers<CR>:buffer<Space>')
vim.keymap.set('c', '%%',
	'getcmdtype() == ":" ? fnameescape(expand("%:h"))."/" : "%%"',
	{ expr = true }
)
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')
vim.keymap.set('i', '<C-Space>', '<C-X><C-O>')

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('my.init', {}),
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 300 })
	end
})

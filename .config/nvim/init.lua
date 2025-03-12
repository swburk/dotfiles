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
vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide']()
vim.opt.wildignore = vim.g.netrw_list_hide
vim.opt.number = true
vim.opt.foldlevelstart = 99
vim.opt.statusline = '%<%f %h%w%m%r%{FugitiveStatusline()}%=%l:%v/%L %y'
vim.cmd.colorscheme('catppuccin')

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
})

vim.keymap.set('x', 'il', 'g_o^')
vim.keymap.set('o', 'il', '<Cmd>normal vil<CR>', { silent = true })
vim.keymap.set('x', 'al', '$o0')
vim.keymap.set('o', 'al', '<Cmd>normal val<CR>', { silent = true })
vim.keymap.set('x', 'ig', function()
	vim.cmd[[
		normal! G
		call search('^.', 'bcW')
		normal! $ogg0
		call search('^.', 'cW')
	]]
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
vim.keymap.set('n', 'gV', '`[v`]')
vim.keymap.set('n', 'gs', ':%substitute///g<Left><Left>')
vim.keymap.set('x', 'gs', ':substitute///g<Left><Left>')
vim.keymap.set('n', 'gl', '<Cmd>buffers<CR>:b')
vim.keymap.set('c', '%%',
	'getcmdtype() == ":" ? fnameescape(expand("%:h"))."/" : "%%"',
	{ expr = true }
)
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')

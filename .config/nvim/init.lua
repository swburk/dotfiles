vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.shiftround = true
vim.opt.number = true
vim.cmd.colorscheme('catppuccin')

vim.keymap.set('n', '<Plug>(SplitLine)',
	[[<cmd>keeppatterns s/\v^(\s*)(.{-})\s*%#\s*(.*)/\1\2\r\1\3/|]]
	.. [[call repeat#set("\<Plug>(SplitLine)")<cr>]], { noremap = true })
vim.keymap.set('n', 'S', '<Plug>(SplitLine)')
vim.keymap.set('n', '<tab>', '<c-^>', { noremap = true })
vim.keymap.set('n', 'gV', '`[v`]', { noremap = true })
vim.keymap.set('n', 'gs', ':%s///g<left><left>', { noremap = true })
vim.keymap.set('x', 'gs', ':s///g<left><left>', { noremap = true })
vim.keymap.set('n', 'gl', '<cmd>ls<cr>:b<space>', { noremap = true })
vim.keymap.set('c', '%%', '<c-r>=fnameescape(expand("%:h"))."/"<cr>', { noremap = true })

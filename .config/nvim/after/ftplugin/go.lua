vim.opt_local.textwidth = 72
vim.opt_local.formatoptions:remove('t')
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt_local.tabstop = 2
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = { 80 }
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint('eslint')
  end,
})

vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide'](vim.fn.expand('%'))
vim.opt.wildignore = vim.g.netrw_list_hide

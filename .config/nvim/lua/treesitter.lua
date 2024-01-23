require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'go',
		'javascript',
		'lua',
		'markdown',
		'markdown_inline',
		'python',
		'vim',
		'vimdoc'
	},
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<cr>',
			node_incremental = '<tab>',
			scope_incremental = '<cr>',
			node_decremental = '<s-tab>'
		}
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner'
			}
		},
		move = {
			enable = true,
			goto_next_start = {
				[']m'] = '@function.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer'
			}
		}
	}
}

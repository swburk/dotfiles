require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'c',
		'css',
		'go',
		'html',
		'javascript',
		'lua',
		'markdown',
		'markdown_inline',
		'python',
		'typescript',
		'vim',
		'vimdoc'
	},
	highlight = { enable = true },
	indent = { enable = true },
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
				["ae"] = "@assignment.outer",
				["ie"] = "@assignment.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["af"] = "@call.outer",
				["if"] = "@call.inner",
				["am"] = "@function.outer",
				["im"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']t'] = '@class.outer',
				[']/'] = '@comment.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']T'] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[t'] = '@class.outer',
				['[/'] = '@comment.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[T'] = '@class.outer',
			},
		}
	}
}

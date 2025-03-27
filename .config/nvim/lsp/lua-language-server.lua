return {
	cmd = { 'lua-language-server' },
	root_markers = { '.luarc.json' },
	filetypes = { 'lua' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				},
			},
		}
	}
}

return {
	cmd = { 'pyright-langserver', '--stdio' },
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'pyrightconfig.json'
	},
	filetypes = { 'python' },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = 'openFilesOnly',
			},
		}
	},
}

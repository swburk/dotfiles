return {
	cmd = { 'ruff', 'server' },
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'ruff.toml',
		'.ruff.toml',
	},
	filetypes = { 'python' },
}

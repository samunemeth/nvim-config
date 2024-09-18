--- For script that need to load before plugins ---

-- UltiSnips
vim.g.UltiSnipsExpandOrJumpTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
vim.g.UltiSnipsSnippetDirectories = {
	vim.fn.expand("$HOME/.config/nvim/UltiSnips"),
}

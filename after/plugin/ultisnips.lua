--- UltiSnips plugin configuration ---

vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
vim.g.UltiSnipsSnippetDirectories = {
	vim.fn.expand("$HOME/.config/nvim/UltiSnips"),
}


--- Auto commands ---

vim.api.nvim_create_autocmd( { "BufRead", "BufNewFile"}, {
	pattern = { "main.tex" },
	command = "VimtexCompile",
})

vim.api.nvim_create_autocmd( { "TermOpen" }, {
	pattern = { "*" },
	command = "setlocal nospell | startinsert!",
})

--- Auto commands ---


vim.api.nvim_create_autocmd( { "TermOpen" }, {
	pattern = { "*" },
	command = "setlocal nospell | startinsert!",
})

--- Configuration for Vimtex ---

-- Settings
vim.opt.conceallevel = 1
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.tex_conceal = "abdmg"
vim.g.vimtex_indent_lists = {}
vim.g.vimtex_mappings_enabled = false
vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull" }
vim.cmd.highlight({ "Conceal", "guifg=white" })

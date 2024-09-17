--- Vimtex configuration ---
---
vim.opt.conceallevel = 1

vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.tex_conceal = "abdmg"
vim.g.vimtex_indent_lists = {}
vim.g.vimtex_mappings_enabled = false -- Disable keybindings to not flood the custom keybindings
vim.g.vimtex_quickfix_ignore_filters = {
	"Underfull",
	"Overfull",
}

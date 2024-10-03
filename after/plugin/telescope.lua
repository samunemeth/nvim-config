--- Telescope plugin settings ---

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup{
	defaults = {
		file_ignore_patterns = {
			"main.pdf",
			"main.aux",
			"main.fdb_latexmk",
			"main.fls",
			"main.log",
			"main.pdf",
			"main.synctex.gz",
		}
	},
	pickers = {
		find_files = {
			hidden = false
		}
	}
} 

-- Keybindings
vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})

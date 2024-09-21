--- Telescope plugin settings ---

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
	pickers = {
		find_files = {
			hidden = true
		}
	}
} 

-- Keybindings
vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})

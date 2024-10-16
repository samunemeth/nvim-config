--- Configuration for Peek ---

local peek = require("peek")

-- Settings
peek.setup({
	app = { 'chromium', '--new-window' }
})

-- Commands
vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
vim.api.nvim_create_user_command("PeekClose", peek.close, {})

-- Keymaps
vim.keymap.set("n", "<leader>p", peek.open)

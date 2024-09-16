--- Nvimtree plugin settings ---

require("nvim-tree").setup()
vim.opt.termguicolors = true

-- Keybinding
vim.keymap.set('n', 't', '<cmd>NvimTreeOpen<cr>')


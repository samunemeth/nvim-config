--- Mappings ---

vim.g.mapleader = " "

-- Open a terminal window to the side or to the bottom
vim.keymap.set("n", "<leader>cv", "<C-w>v<C-w>w<cmd>ter<cr>")
vim.keymap.set("n", "<leader>ch", "<C-w>s<C-w>w<cmd>ter<cr>")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Replace word under cursor
vim.keymap.set("n", "<leader>h", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Navigate windows with Tab
vim.keymap.set("n", "<tab>", "<C-w>w")

-- Move the editor up and down in insert mode
vim.keymap.set("i", "<C-e>", "<C-o><C-e>")
vim.keymap.set("i", "<C-y>", "<C-o><C-y>")

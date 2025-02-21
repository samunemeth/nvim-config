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

-- Move the editor up and down in insert mode
vim.keymap.set("i", "<C-e>", "<C-o><C-e>")
vim.keymap.set("i", "<C-y>", "<C-o><C-y>")

-- Deleting into the void register
vim.keymap.set("n", "<leader>dd", "\"_dd")
vim.keymap.set("n", "<leader>dw", "\"_dw")
vim.keymap.set("n", "<leader>diw", "\"_diw")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Sync commands
vim.keymap.set("n", "<leader>s", function()
    print("File sync started...")
    local function sync_finished(chan_id, data, name)
        print("File sync completed!")
    end
    vim.fn.jobstart("rclone sync /home/samu/Notes SamuNotes: --create-empty-src-dirs --size-only", { on_exit = sync_finished })
end)

-- Hard mode remaps
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>')

-- Correct spelling mistakes
vim.keymap.set({"n", "v"}, "<C-l>", "[s1z=``")
vim.keymap.set({"i"}, "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u")


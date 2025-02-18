--- Plugins ---

local Plug = vim.fn["plug#"]

--- Need to load before plugins ---
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- Plugins ---

-- All packages are listed here
-- Any package without a comment after it is a requirement of the next package.

vim.call("plug#begin")

Plug("lervag/vimtex") -- For compiling latex
Plug("SirVer/ultisnips") -- For creating snippets
Plug("nvim-tree/nvim-tree.lua") -- For file tree
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" }) -- For syntax highlighting
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.8" }) -- For fuzzy finding
Plug("itchyny/lightline.vim") -- For the fancy status bar
Plug("mbbill/undotree") -- For the undo tree
Plug("tpope/vim-fugitive") -- For git
Plug("karb94/neoscroll.nvim") -- For smooth scrolling
-- Plug("toppair/peek.nvim", { ["do"] = "deno task --quiet build:fast" }) -- For markdown preview.
Plug("jbyuki/nabla.nvim") -- For equation preview in the editor.
Plug("williamboman/mason.nvim") -- For installing and managing LSP servers.
Plug("neovim/nvim-lspconfig") -- Pre-made configurations for LSP servers.
Plug("frabjous/knap") -- Live latex compile

vim.call("plug#end")

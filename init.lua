--- Variable localization ---
local vim = vim
local Plug = vim.fn['plug#']

--- Need to load before plugins ---
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- Plugins ---

-- All packages are listed here
-- Any package without a comment after it is a requirement of the next package.

vim.call('plug#begin')

Plug('lervag/vimtex') -- For compiling latex
Plug('SirVer/ultisnips') -- For creating snippets
Plug('nvim-tree/nvim-tree.lua') -- For file tree
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) -- For syntax highlighting
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' }) -- For fuzzy finding

vim.call('plug#end')


--- Load modules ---
require("remaps")
require("commands")
require("autocommands")


--- Line numbering configuration ---
vim.opt.number = true
vim.opt.relativenumber = true


--- Spell configuration ---
vim.opt.spell = true
vim.opt.spelllang = 'hu,en'
vim.opt.spellcapcheck = ''


--- Clipboard configuration ---
vim.opt.clipboard = 'unnamedplus'


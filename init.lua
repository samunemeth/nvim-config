--- Variable localization ---
local vim = vim


--- Load plugins ---
require("plugins")


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


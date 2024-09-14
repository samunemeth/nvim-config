--- Variable localization ---
local vim = vim
local Plug = vim.fn['plug#']

--- Need to load before plugins ---
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- Plugins ---
vim.call('plug#begin')

Plug('lervag/vimtex') -- For compiling latex
Plug('SirVer/ultisnips') -- For creating snippets
Plug('nvim-tree/nvim-tree.lua') -- For file tree

vim.call('plug#end')


--- UltiSnips configuration ---
vim.g.UltiSnipsExpandTrigger = '<Tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
vim.g.UltiSnipsSnippetDirectories = {
	vim.fn.expand('$HOME/.config/nvim/UltiSnips'),
}


--- Vimtex configuration ---
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'
vim.g.vimtex_indent_lists = {}
vim.g.vimtex_quickfix_ignore_filters = {
	'Underfull',
	'Overfull',
}


--- nvim-tree configuration ---
require("nvim-tree").setup()
vim.opt.termguicolors = true


--- Line numbering configuration ---
vim.opt.number = true
vim.opt.relativenumber = true


--- Spell configuration ---
vim.opt.spell = true
vim.opt.spelllang = 'hu,en'
vim.opt.spellcapcheck = ''


--- Clipboard configuration ---
vim.opt.clipboard = 'unnamedplus'


--- User commands and mappings ---
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})

vim.api.nvim_create_user_command('InitLuaEdit', 'e ~/.config/nvim/init.lua', {})
vim.api.nvim_create_user_command('InitLuaReload', 'luafile ~/.config/nvim/init.lua', {})

vim.api.nvim_create_user_command('Tree', 'NvimTreeOpen', {})

vim.keymap.set('n', 't', '<cmd>NvimTreeOpen<cr>')


--- Event configuration ---
vim.api.nvim_create_autocmd( { 'BufRead', 'BufNewFile'}, {
	pattern = { 'main.tex' },
	command = 'VimtexCompile',
})

vim.api.nvim_create_autocmd( { 'TermOpen' }, {
	pattern = { '*' },
	command = 'setlocal nospell',
})

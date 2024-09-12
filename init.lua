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
--vim.g.UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips'] -- I have no idea how to adapt this to lua


--- Vimtex configuration ---
vim.g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull'}
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'
vim.g.vimtex_indent_lists = {}


--- nvim-tree configuration ---
require("nvim-tree").setup()


--- Global configuration ---
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.so = 999

vim.opt.spell = true
vim.opt.spelllang = 'hu,en'
vim.opt.spellcapcheck = ''

vim.opt.termguicolors = true

vim.opt.clipboard = 'unnamedplus'


--- User commands and mappings ---
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})

vim.api.nvim_create_user_command('InitLuaEdit', 'e ~/.config/nvim/init.lua', {})
vim.api.nvim_create_user_command('InitLuaReload', 'luafile ~/.config/nvim/init.lua', {})

vim.api.nvim_create_user_command('Tree', 'NvimTreeOpen', {})

vim.keymap.set('n', 't', '<cmd>NvimTreeOpen<cr>')
vim.keymap.set('n', '<S-Enter>', 'o<Esc>')

--- File specific configuration ---
vim.api.nvim_create_autocmd( { 'BufRead', 'BufNewFile'}, {
  pattern = { 'main.tex' },
  command = 'VimtexCompile',
})


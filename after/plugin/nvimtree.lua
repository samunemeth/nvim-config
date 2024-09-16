--- Nvimtree plugin settings ---

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 't', '<C-w>w', opts('Change window'))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
})

vim.opt.termguicolors = true

-- Keybinding
vim.keymap.set('n', 't', '<cmd>NvimTreeOpen<cr>')


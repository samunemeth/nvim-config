--- Commands ---

-- Typo fixes
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

-- Opens and reloads vim configuration files
vim.api.nvim_create_user_command("InitLuaEdit", vim.fn.expand("e $MYVIMRC"), {})
vim.api.nvim_create_user_command("InitLuaReload", vim.fn.expand("so $MYVIMRC"), {})


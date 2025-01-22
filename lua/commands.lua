--- Commands ---

-- Typo fixes
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

vim.api.nvim_create_user_command('Systemd',
  function(opts)
    vim.fn.jobstart("sudo systemctl " .. opts.fargs[1])
  end,
  { nargs = 1 }
)

vim.api.nvim_create_user_command('Compile',
  function(opts)
    print("Compiling to PDF...")
    local function compile_finished(chan_id, data, name)
      print("Compiled to PDF.")
    end
    vim.fn.jobstart("pandoc -s -V papersize:a4 -o " .. vim.fn.expand("%:p:r") .. ".pdf ".. vim.fn.expand("%:p"), { on_exit = compile_finished })
  end,
  {}
)

vim.api.nvim_create_user_command('Zathura',
  function(opts)
    local to_open = vim.fn.expand("%:p:r") .. ".pdf"
    if vim.fn.filereadable(to_open) then
      print("Opening zathura...")
      vim.fn.jobstart("zathura " .. to_open)
    else
      print("PDF not found!")
    end
  end,
  {}
)

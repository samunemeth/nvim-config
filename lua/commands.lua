--- Commands ---

-- Typo fixes
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

-- For easy management of systemd processes
vim.api.nvim_create_user_command('Systemd',
  function(opts)
    vim.fn.jobstart("sudo systemctl " .. opts.fargs[1])
  end,
  { nargs = 1 }
)

-- For compiling markdown files to PDF and opening them in Zathura.
vim.api.nvim_create_user_command('CompileMarkdown',
  function(opts)
    if vim.bo.filetype == "markdown" then
      print("Compiling to PDF...")
      local function compile_finished(chan_id, data, name)
        print("Compiled to PDF.")
      end
      local in_path = vim.fn.expand("%:p")
      local out_path = vim.fn.expand("%:p:r") .. ".pdf"
      local pandoc_options = "-s -V papersize:a4 -V geometry:margin=1.5in"
      vim.fn.jobstart("pandoc " .. pandoc_options .. " -o " .. out_path .. " " .. in_path, { on_exit = compile_finished })
    else
      print("Not a markdown file!")
    end
  end,
  {}
)

vim.api.nvim_create_user_command('OpenZathura',
  function(opts)
    local to_open = vim.fn.expand("%:p:r") .. ".pdf"
    if vim.fn.filereadable(to_open) == 1 then
      print("Opened Zathura.")
      vim.fn.jobstart("zathura " .. to_open)
    else
      print("PDF version not found!")
    end
  end,
  {}
)

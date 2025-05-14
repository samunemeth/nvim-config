
function DisplayShellProgress(command, title, message_start, message_end, autoquit)

  -- Get the current focused window before creating a new one
  local current_win = vim.api.nvim_get_current_win()

  -- Create a new buffer for displaying the output
  -- False means it's not listed, true means it’s scratch
  local bufnr = vim.api.nvim_create_buf(false, true) 

  local function remove_empty_lines()
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    for i = line_count, 2, -1 do
      local line = vim.api.nvim_buf_get_lines(bufnr, i-1, i, false)[1]
      if line == "" then
        -- Remove the empty line
        vim.api.nvim_buf_set_lines(bufnr, i-1, i, false, {})
      end
    end
  end
  
  -- Set the buffer in a split at the bottom of the screen
  vim.api.nvim_command("botright new")
  vim.api.nvim_win_set_buf(0, bufnr)
  vim.api.nvim_win_set_height(0, 3)
  local winid = vim.api.nvim_get_current_win()

  vim.api.nvim_buf_set_option(bufnr, 'number', false)  -- Disable line numbering
  vim.api.nvim_buf_set_option(bufnr, 'relativenumber', false)  -- Disable relative line numbering
  vim.api.nvim_buf_set_option(bufnr, 'spell', false)  -- Disable relative line numbering
  vim.api.nvim_win_set_option(winid, 'colorcolumn', '')  -- Disable the vertical ruler
  vim.api.nvim_buf_set_name(bufnr, title)  -- Rename the buffer to "file upload"

  vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, {message_start})

  -- Start the shell job
  vim.fn.jobstart(command, {
    out_name = "joboutput", pty = 1,
    on_stdout = function(_, data, _)
      -- Update the buffer with the output line by line
      if data then
        for _, line in ipairs(data) do
          line = line:gsub("\r", "")
          line = line:gsub("\n", "")
          line = line:gsub("\27%[[%d;]*[mK]", "")
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, {line})
        end
        remove_empty_lines()
        local line_count = vim.api.nvim_buf_line_count(bufnr)
        vim.api.nvim_win_set_height(winid, math.min(line_count + 1, 15))
        vim.api.nvim_win_set_cursor(winid, {line_count, 0})
      end
    end,
    on_exit = function()
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, {message_end})
      local line_count = vim.api.nvim_buf_line_count(bufnr)
      vim.api.nvim_win_set_height(winid, math.min(line_count + 1, 15))
      vim.api.nvim_win_set_cursor(winid, {line_count, 0})
      if autoquit then
        vim.defer_fn(function()
          -- Close the window containing the buffer after a timeout.
          vim.api.nvim_win_close(winid, true)
          vim.api.nvim_buf_delete(bufnr, {force = true})  -- Delete the buffer
        end, 3000)
      end
    end
  })

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':bd!<CR>', { noremap = true, silent = true })

  -- Move the focus back to the starting window.
  vim.api.nvim_set_current_win(current_win)
end

-- Write files to drive (sync up)

vim.api.nvim_create_user_command('NotesWrite',
  function(opts)
    DisplayShellProgress(
        "rclone sync ~/Notes Notes:/ -v --exclude-from ~/Notes/.rsyncignore",
        "File Write",
        "Starting file write...",
        "File write finished!",
        true
    )
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command('NotesWriteDry',
  function(opts)
    DisplayShellProgress(
        "rclone sync ~/Notes Notes:/ -v --exclude-from ~/Notes/.rsyncignore --dry-run",
        "File Write Dry",
        "Starting dry file write...",
        "File dry write finished!",
        false
    )
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command('NotesRead',
  function(opts)
    DisplayShellProgress(
        "rclone sync Notes:/ ~/Notes -v --exclude-from ~/Notes/.rsyncignore",
        "File Read",
        "Starting file read...",
        "File read finished!",
        true
    )
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command('NotesReadDry',
  function(opts)
    DisplayShellProgress(
        "rclone sync Notes:/ ~/Notes -v --exclude-from ~/Notes/.rsyncignore --dry-run",
        "File Read Dry",
        "Starting dry file read...",
        "File dry read finished!",
        false
    )
  end,
  { nargs = 0 }
)

-- vim.api.nvim_create_user_command('NotesSync',
--   function(opts)
--     DisplayShellProgress(
--         "rclone bisync ~/Notes Notes:/ -v --exclude-from ~/Notes/.rsyncignore",
--         "File Sync",
--         "Starting file sync...",
--         "File sync finished!",
--         false
--     )
--   end,
--   { nargs = 0 }
-- )
--
--
-- vim.api.nvim_create_user_command('NotesResync',
--   function(opts)
--     DisplayShellProgress(
--         "rclone bisync ~/Notes Notes:/ -v --exclude-from ~/Notes/.rsyncignore --resync --resync-mode newer",
--         "File Resync",
--         "Starting file resync...",
--         "File resync finished!",
--         false
--     )
--   end,
--   { nargs = 0 }
-- )

-- Remaps


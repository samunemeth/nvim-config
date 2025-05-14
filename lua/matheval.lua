-- Evaluates and input string into an output string.
function eval_math(math_in, callback)
  local calc = load("return " .. (math_in or ""))()
  if (calc) then
    callback(tostring(calc))
  end
end

-- Enter expression and put it into buffer.
vim.keymap.set("n", "<leader>a", function()
  vim.ui.input({ prompt = "Calculator: " }, function(input)
    eval_math(input, function(result)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(
        "i" .. result .. "<esc>", true, false, true), "i", true)
    end)
  end)
end)

-- Get selected expression and put it into buffer.
vim.keymap.set("v", "<leader>a", function()

  -- Get selection position.
  local _, srow, scol = unpack(vim.fn.getpos('v'))
  local _, erow, ecol = unpack(vim.fn.getpos('.'))

  -- Only in regular visual mode.
  local input = {}
  if vim.fn.mode() == 'v' then
    if srow < erow or (srow == erow and scol <= ecol) then
      input = vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
    else
      input = vim.api.nvim_buf_get_text(0, erow - 1, ecol - 1, srow - 1, scol, {})
    end
  end

  -- Calculate and replace selection.
  eval_math(input[1], function(result)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(
      "di" .. result .. "<esc>", true, false, true), "i", true)
  end)
end)

-- Enter expression and display result.
vim.keymap.set("n", "<leader>s", function()
  vim.ui.input({ prompt = "Calculator: " }, function(input)
    eval_math(input, function(result)
      print("Result: " .. result)
    end)
  end)
end)

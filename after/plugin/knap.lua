--- Configuration for Knap --- 
local knap = require("knap")

-- F5 processes the document once, and refreshes the view
vim.keymap.set({ 'n', 'v', 'i' },'<F5>', function() knap.process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
vim.keymap.set({ 'n', 'v', 'i' },'<F6>', function() knap.close_viewer() end)

-- F7 toggles the auto-processing on and off
vim.keymap.set({ 'n', 'v', 'i' },'<F7>', function() knap.toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
vim.keymap.set({ 'n', 'v', 'i' },'<F8>', function() knap.forward_jump() end)

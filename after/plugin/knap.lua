--- Configuration for Knap --- 
local knap = require("knap")

-- Knap settings
local gknapsettings = {
    textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
    textopdfviewerrefresh = "none",
    textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
    textopdf = "pdflatex -jobname \"$(basename -s .pdf %outputfile%)\" -halt-on-error",
    textopdfbufferasstdin = true,
}
vim.g.knap_settings = gknapsettings

-- Start compilation when a LaTeX file is opened
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile"}, {
	pattern = { "main.tex" },
    callback = function() knap.toggle_autopreviewing() end,
})

-- Remaps to useful commands
vim.keymap.set({ 'n', 'v', 'i' }, '<F5>', function() knap.process_once() end)
vim.keymap.set({ 'n', 'v', 'i' }, '<F6>', function() knap.close_viewer() end)
vim.keymap.set({ 'n', 'v', 'i' }, '<F7>', function() knap.toggle_autopreviewing() end)
vim.keymap.set({ 'n', 'v', 'i' }, '<F8>', function() knap.forward_jump() end)

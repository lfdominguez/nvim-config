local fzf = require("fzf-lua")

fzf.setup({
})

fzf.register_ui_select()

vim.cmd ("nnoremap <leader>/ <cmd>lua require('fzf-lua').grep({no_esc=true})<CR>")
vim.cmd ("nnoremap <leader>zf <cmd>lua require('fzf-lua').files()<CR>")
vim.cmd ("nnoremap <leader>zr <cmd>lua require('fzf-lua').registers()<CR>")
vim.cmd ("nnoremap <leader>zb <cmd>lua require('fzf-lua').buffers()<CR>")
vim.cmd ("nnoremap <leader>zh <cmd>lua require('fzf-lua').help_tags()<CR>")
vim.cmd ("nnoremap <leader>zz <cmd>lua require('fzf-lua').builtin()<CR>")

vim.g["nvim_tree_disable_netrw"] = false

vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', {noremap=true, silent=true })

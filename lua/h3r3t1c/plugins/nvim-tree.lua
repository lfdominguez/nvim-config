vim.g.nvim_tree_respect_buf_cwd = 1

vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', {noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>tf', '<Cmd>NvimTreeFindFile<CR>', {noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', {noremap=true, silent=true })

require'nvim-tree'.setup {
  update_cwd = true,
  disable_netrw = false,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  system_open = {
    cmd = "xdg-open"
  }
}

vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', {noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>tf', '<Cmd>NvimTreeFindFile<CR>', {noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', {noremap=true, silent=true })

require'nvim-tree'.setup {
  disable_netrw = false,
  lsp_diagnostics = false,
  update_focused_file = {
    enable = true
  },
  system_open = {
    cmd = "xdg-open"
  }
}

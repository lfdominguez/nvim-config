vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache__" }
vim.g.nvim_tree_hide_dotfiles = false
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_refresh_wait = 500

vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    "notify",
    "packer",
    "qf",
  },
  buftype = {
    "terminal",
  },
}

vim.g.nvim_tree_special_files = { ["README.md"] = 1, Makefile = 1, MAKEFILE = 1 }
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 0 }

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
}

vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', {noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>tf', '<Cmd>NvimTreeFindFile<CR>', {noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', {noremap=true, silent=true })

require'nvim-tree'.setup {
  disable_netrw = false,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = false,
  open_on_tab = true,
  hijack_cursor = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    view = {
      width = 25,
      side = "left",
      auto_resize = true,
      mappings = {
      custom_only = false,
    
      list = {
        { key = { "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
        { key = { "<CR>", "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
        { key = "<C-v>", cb = tree_cb("vsplit") },
        { key = "<C-x>", cb = tree_cb("split") },
        { key = "<C-t>", cb = tree_cb("tabnew") },
        { key = "<BS>", cb = tree_cb("close_node") },
        { key = "<S-CR>", cb = tree_cb("close_node") },
        { key = "<Tab>", cb = tree_cb("preview") },
        { key = "I", cb = tree_cb("toggle_ignored") },
        { key = "H", cb = tree_cb("toggle_dotfiles") },
        { key = "R", cb = tree_cb("refresh") },
        { key = "a", cb = tree_cb("create") },
        { key = "d", cb = tree_cb("remove") },
        { key = "r", cb = tree_cb("rename") },
        { key = "<C-r>", cb = tree_cb("full_rename") },
        { key = "x", cb = tree_cb("cut") },
        { key = "c", cb = tree_cb("copy") },
        { key = "p", cb = tree_cb("paste") },
        { key = "[c", cb = tree_cb("prev_git_item") },
        { key = "]c", cb = tree_cb("next_git_item") },
        { key = "-", cb = tree_cb("dir_up") },
        { key = "q", cb = tree_cb("close") },
        { key = "g?", cb = tree_cb("toggle_help") },
      },
    },
  },
}

vim.defer_fn(require("nvim-tree").refresh, 25)

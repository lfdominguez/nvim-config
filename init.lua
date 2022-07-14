-- Entrypoint for my Neovim configuration!

-- Some defaults
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Store startup time in seconds
vim.g.start_time = vim.fn.reltime()

-- Disable some unused built-in Neovim plugins
vim.g.loaded_gzip = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false

-- vim.lsp.set_log_level("debug")

vim.g["mapleader"] = " "
vim.g["maplocalleader"] = " "
vim.opt.termguicolors = true

vim.defer_fn(function()
  require('h3r3t1c.init')
end, 0)



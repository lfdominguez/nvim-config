local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local utils = lspconfig.util

lspconfig.terraformls.setup{}
lspconfig.cmake.setup{}
-- lspconfig.clangd.setup{}

-- lspconfig.yamlls.setup{}

--[[require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = true,
    zindex = 50,
    toggle_key = '<M-x>',
    handler_opts = {
      border = "rounded"
    }
  })]]

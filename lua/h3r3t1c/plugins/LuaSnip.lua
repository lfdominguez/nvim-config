require "h3r3t1c/snippets"
local ls = require "luasnip"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI" 
}

--vim.cmd [[
--  snoremap <silent> <Tab> <cmd>lua require'luasnip'.jump(1)<Cr>"
--  snoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>"
--]]

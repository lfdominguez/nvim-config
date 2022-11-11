local set_hl = vim.api.nvim_set_hl

set_hl(0, "LspParameter", { fg = "#ef9062" })
set_hl(0, "LspType", { fg = "#619e9d" })

require("nvim-semantic-tokens").setup {
    preset = "default",
    highlighters = { require 'nvim-semantic-tokens.table-highlighter'}
}

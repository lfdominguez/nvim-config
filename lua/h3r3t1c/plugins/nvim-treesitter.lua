local ts = require("nvim-treesitter.configs")

ts.setup({
    ensure_installed = {"rust", "java", "yaml", "toml", "json", "bash"},
    indent = { enable = true },
    highlight = {disable = {"markdown"}, enable = true},
    context_commentstring = { enable = true, enable_autocmd = false }
})

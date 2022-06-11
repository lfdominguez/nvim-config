local ts = require("nvim-treesitter.configs")

ts.setup({
    ensure_installed = {"cpp", "nix", "rust", "java", "yaml", "toml", "json", "bash", "hcl", "javascript", "lua", "python"},
    indent = { enable = true },
    playground = { enable = true },
    context_commentstring = { enable = true },
    autotag = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
        "vue",
        "markdown",
      },
    },
    highlight = { enable = true},
    context_commentstring = { enable = true, enable_autocmd = false },
    autopairs = {
      enable = true
    },
})

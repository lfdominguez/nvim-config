local ts = require("nvim-treesitter.configs")
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.jinja2 = {
  install_info = {
    url = "https://github.com/dbt-labs/tree-sitter-jinja2.git", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "j2", -- if filetype does not match the parser name
}

parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"}
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
}

ts.setup({
    ensure_installed = {"cpp", "nix", "rust", "java", "yaml", "toml", "json", "bash", "hcl", "javascript", "lua", "python", "vim", "regex", "markdown", "markdown_inline"},
    --indent = { enable = true },
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

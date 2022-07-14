local null_ls = require('null-ls')

local my_sources = { 
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.diagnostics.gccdiag,
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.trail_space,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.nginx_beautifier,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.trim_newlines,
}

null_ls.setup({ sources = my_sources })



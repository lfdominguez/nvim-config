local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local utils = lspconfig.util

-- lspconfig.terraformls.setup{}
lspconfig.cmake.setup {}
lspconfig.yamlls.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local caps = client.server_capabilities

        local signature_setup = {
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        }

        require('h3r3t1c.utils').lsp_key_binding(bufnr)

        if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
            local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
            vim.api.nvim_create_autocmd("TextChanged", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.semantic_tokens_full()
                end,
            })

            vim.lsp.buf.semantic_tokens_full()
        end
    end,
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = require'lspcontainers'.command('pyright', {
        image = "odoo-pyright:16",
        container_runtime = "podman",
        workdir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
        cmd = function (runtime, volume, image)
            return {
                runtime,
                "container",
                "run",
                "--interactive",
                "--rm",
                "--volume",
                require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()) + ":/app",
                image,
                "pyright"
            }
        end
    }),
    root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
}

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

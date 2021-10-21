local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

configs.zk = {
  default_config = {
    cmd = {'zk', 'lsp'},
    filetypes = {'markdown'},
    root_dir = lspconfig.util.root_pattern('.zk'),
    settings = {}
  };
}

configs.zk.index = function()
  vim.lsp.buf.execute_command({
    command = "zk.index",
    arguments = { vim.api.nvim_buf_get_name(0) },
  })
end

configs.zk.new = function(...)
  vim.lsp.buf_request(0, 'workspace/executeCommand',
    {
        command = "zk.new",
        arguments = {
            vim.api.nvim_buf_get_name(0),
            ...
        },
    },
    function(_, _, result)
      if not (result and result.path) then return end
      vim.cmd("edit " .. result.path)
    end
  )
end

lspconfig.terraformls.setup{}
lspconfig.zk.setup({ on_attach = function(client, bufnr)
  -- Key mappings
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=false }

  buf_set_keymap("i", "<S-tab>", "<cmd>lua vim.lsp.buf.completion()<CR>", opts)
  -- Follow a Markdown link with <CR>.
  buf_set_keymap("n", "<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- Preview a note with K when the cursor is on a link.
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- Create a new note using the current visual selection for the note title. This will replace the selection with a link to the note.
  buf_set_keymap("v", "<CR>", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
  -- Reindex the notebook. Usually the language server does this automatically, so it's not often needed.
  buf_set_keymap("n", "<leader>zi", ":lua require'lspconfig'.zk.index()<CR>", opts)
  -- Create a new note after prompting for a title.
  buf_set_keymap("n", "<leader>zn", ":lua require'lspconfig'.zk.new({title = vim.fn.input('Title: ')})<CR>", opts)
  -- Create a new daily note in my `log/` notebook directory.
  buf_set_keymap("n", "<leader>zl", ":lua require'lspconfig'.zk.new({dir = 'log'})<CR>", opts)
  -- Find the backlinks for the note linked under the cursor.
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end })

lspconfig.yamlls.setup{}


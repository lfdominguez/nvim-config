local tele = require("telescope")
local telepv = require("telescope.previewers")

tele.setup({
            grep_previewer = telepv.vim_buffer_vimgrep.new,
            extensions = {
              zettel = {
                zk_path = "~/Notes",
                link_style = "wiki",
                remove_ext = true
              }
            }
           })

tele.load_extension("fzy_native")
tele.load_extension("projects")

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})

vim.api.nvim_set_keymap("n", "<leader>lref", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>la", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", {})

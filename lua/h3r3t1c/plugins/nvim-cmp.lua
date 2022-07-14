local cmp = require("cmp")
local luasnip = require("luasnip")

local kind_icons = {
  Text = "   ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = " ﴲ ",
  Variable = "  ",
  Class = "  ",
  Interface = " ﰮ ",
  Module = "  ",
  Property = " ﰠ ",
  Unit = "  ",
  Value = "  ",
  Enum = " 練",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = " ﲀ ",
  Struct = " ﳤ ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
}

local function get_kind_icon(kind_type)
  return kind_icons[kind_type]
end

local function replace_termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_backspace()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noinsert",
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sorting = {
    comparators = {
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.length,
        require("clangd_extensions.cmp_scores"),
    }
  },
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      before = function(entry, vim_item)
        if entry.source.name == "nvim_lsp" then
          vim_item.menu = entry.source.source.client.name
        else
          vim_item.menu = entry.source.name
        end
        return vim_item
      end,
    }),
    --format = function(entry, item)
    --  item.kind = string.format("%s %s", get_kind_icon(item.kind), item.kind)
    --  item.menu = ({
    --    nvim_lsp = "[LSP]",
    --    luasnip = "[Snp]",
    --    buffer = "[Buf]",
    --    nvim_lua = "[Lua]",
    --    path = "[Path]",
        -- copilot = "[Cop]",
    --  })[entry.source.name]
    --  item.dup = ({
    --    buffer = 1,
    --    path = 1,
    --    nvim_lsp = 0,
    --  })[entry.source.name] or 0
    --  return item
    --end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    -- ["<ESC>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-expand-or-jump"), "")
      elseif check_backspace() then
        vim.fn.feedkeys(replace_termcodes("<Tab>"), "n")
      else
        -- local copilot_keys = vim.fn["copilot#Accept"]()
        -- if copilot_keys ~= "" then
          -- vim.api.nvim_feedkeys(copilot_keys, "i", true)
        -- else
          fallback()
        -- end
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-jump-prev"), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp_signature_help", priority = 100 },
    { name = "nvim_lsp", priority = 80 },
    -- { name = "copilot" },
    { name = "luasnip", priority = 90},
    { name = "path", priority = 20 },
    { name = "buffer", priority = 40 },
  },
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['lua'].setup {
  -- capabilities = capabilities
-- }

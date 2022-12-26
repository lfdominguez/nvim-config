
local packer = require("packer")

packer.init({
  git = {
    clone_timeout = 300,
    subcommands = {
      install = "clone --depth 1 --progress",
    },
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end
  },
  profile = {
    enable = true,
  },
})

local function packer_startup(use)
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    use ({
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('crates').setup()

        end,
    })

    use({
        "lspcontainers/lspcontainers.nvim",
        requires = {
            "neovim/nvim-lspconfig"
        }
    })

    use({
        "m-demare/hlargs.nvim",
        config = function()
            require("h3r3t1c.plugins.hlargs").setup()
        end,
    })

    use({
        "theHamsta/nvim-semantic-tokens",
        config = "require('h3r3t1c.plugins/semantic-tokens')"
    })

    use({
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require("noice").setup({
                lsp = {
                    hover = {
                        enabled = true,
                    },
                    signature = {
                        enabled = false,
                    },
                    message = {
                        enabled = true,
                    },
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = true,
                },
            })
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })

    use {
        'ojroques/nvim-lspfuzzy',
        requires = {
            {'junegunn/fzf'},
            {'junegunn/fzf.vim'},  -- to enable preview (optional)
        },
        config = function()
            require('lspfuzzy').setup {}
        end,
    }

    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
        config = "require('nvim-lightbulb').setup({autocmd = {enabled = true}})"
    }

    use({
        "wbthomason/packer.nvim",
        opt = true,
    })

    -- use({
        -- "jose-elias-alvarez/null-ls.nvim",
        -- config = "require('h3r3t1c.plugins/null-ls')",
    -- })

  use({
    "lewis6991/impatient.nvim"
  })

  use({
    "chr4/nginx.vim"
  })

  use({
    "ixru/nvim-markdown"
  })

  use({
    'EdenEast/nightfox.nvim',
    config = "vim.cmd[[colorscheme nordfox]]"
  })
    
  use({
    "ibhagwan/fzf-lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = "require('h3r3t1c.plugins/fzf-lua')"
  })

  use({
    "windwp/nvim-autopairs",
    config = "require('h3r3t1c.plugins/nvim-autopairs')"
  })
    
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-under-comparator",
      -- "hrsh7th/cmp-copilot"
    },
    config = "require('h3r3t1c.plugins/nvim-cmp')"
  })
  
  use({
    "neovim/nvim-lspconfig",
    requires = {"ray-x/lsp_signature.nvim"},
    config = "require('h3r3t1c.plugins/nvim-lspconfig')"
  })

  use({
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress"},
    config = "require('h3r3t1c.plugins/lualine')"
  })

  use({
    "p00f/clangd_extensions.nvim",
    config = "require('h3r3t1c.plugins/clangd_extensions')"
  })

  use {
    "brymer-meneses/grammar-guard.nvim",
    requires = {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer"
    }
  }
    
  use({
    "akinsho/bufferline.nvim",
    config = "require('h3r3t1c.plugins/bufferline')",
    event = "BufWinEnter",
  })

  use({
    "RRethy/vim-illuminate",
    setup = function()
      vim.g.Illuminate_ftblacklist = {
        "help",
        "dashboard",
        "packer",
        "norg",
        "DoomInfo",
        "NvimTree",
        "Outline",
        "toggleterm",
      }
    end,
    event = "BufRead",
  })
    
  use({
    "tweekmonster/startuptime.vim",
    cmd = "StartupTime"
  })
    
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require('h3r3t1c.plugins/nvim-treesitter')"
  })

  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  })

  use({
    "nvim-treesitter/nvim-tree-docs",
    after = "nvim-treesitter",
  })

  use({
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
  })
    
  use({
    "folke/lsp-colors.nvim",
    config = "require('h3r3t1c.plugins/lsp-colors')"
  })
    
  use({
    "norcalli/nvim-colorizer.lua",
    config = "require'colorizer'.setup()"
  })
    
  use({"lukas-reineke/indent-blankline.nvim"})
    
  use({
    "b3nj5m1n/kommentary",
    keys = "gc",
    config = "require('h3r3t1c.plugins/kommentary')"
  })
    
  use({
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    after = {'nvim-treesitter', "lsp-status.nvim"},
    config = "require('h3r3t1c.plugins/rust-tools')"
  })
    
  use({
    "mfussenegger/nvim-jdtls",
    after = {'nvim-treesitter', "lsp-status.nvim"},
    ft = {"java"},
    config = "require('h3r3t1c.plugins/nvim-jdtls')"
  })
    
  use({"nvim-lua/lsp-status.nvim"})

  use({'tpope/vim-fugitive'})
  use({'tpope/vim-repeat'})

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('h3r3t1c.plugins/trouble')"
  })
    
  use({"ryvnf/readline.vim"})
  use({"tpope/vim-eunuch"})
    
  use({
    "junegunn/vim-easy-align",
    keys = {"ga"},
    config = "require('h3r3t1c.plugins/vim-easy-align')"
  })
    
  use({
    "machakann/vim-sandwich",
    config = "require('h3r3t1c.plugins/vim-sandwich')"
  })
    
  use({
    "AndrewRadev/splitjoin.vim",
    keys = { "gS", "gJ" },
    config = "require('h3r3t1c.plugins/splitjoin')"
  })
    
  use({
   "tpope/vim-dispatch",
    cmd = { "Dispatch", "Make", "Focus", "Start" }
  })
    
  use({
    "L3MON4D3/LuaSnip",
    requires = {"rafamadriz/friendly-snippets"},
    config = "require('h3r3t1c.plugins/LuaSnip')"
  })
    
  use({
    "junegunn/fzf.vim",
    config = "require('h3r3t1c.plugins/fzf')"
  })
 
  -- use({
    -- "github/copilot.vim",
    -- config = function ()
      -- vim.g.copilot_no_tab_map = true
      -- vim.g.copilot_assume_mapped = true
      -- vim.g.copilot_tab_fallback = ""
    -- end
  -- })

  use({
    'hoschi/yode-nvim',
    requires = {"nvim-lua/plenary.nvim"},
    config = "require('h3r3t1c.plugins/yode')"
  })

  use({
    "lewis6991/spellsitter.nvim",
    config = "require('spellsitter').setup()"
  })

  use({
    "ahmedkhalf/project.nvim",
    config = "require('h3r3t1c.plugins/project')"
  })

  use({
    "phaazon/hop.nvim",
    config = "require('h3r3t1c.plugins/nvim-hop')"
  })
     
end

packer.startup(packer_startup)

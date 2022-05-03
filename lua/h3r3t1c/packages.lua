
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
    "wbthomason/packer.nvim",
    opt = true,
  })

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
    "nathom/filetype.nvim",
  })
    
  use({
    "eddyekofo94/gruvbox-flat.nvim",
    config = "vim.g.gruvbox_flat_style = 'dark'; vim.cmd[[colorscheme gruvbox-flat]]"
  })
    
  use({
    "nvim-telescope/telescope.nvim",
    requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim"},
    config = "require('h3r3t1c.plugins/telescope')"
  })
    
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-copilot"
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
    
--  use({
--    "kyazdani42/nvim-tree.lua",
--    requires = {"kyazdani42/nvim-web-devicons"},
--    config = "require('h3r3t1c.plugins/nvim-tree')",
--    keys = "<leader>t",
--  })
  
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    keys = "\\",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "1.*",
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal' },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
    config = "require('h3r3t1c.plugins/neotree')",
  })

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
 
  use({
    "github/copilot.vim",
    config = function ()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end
  })

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

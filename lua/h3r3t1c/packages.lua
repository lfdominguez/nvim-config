local packer = require("packer")
local function _1_(use)
    use({
        "wbthomason/packer.nvim"
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
         requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim", "https://gitlab.com/thlamb/telescope-zettel.nvim"},
         config = "require('h3r3t1c.plugins/telescope')"
        })
    
    use({
         "hrsh7th/nvim-compe",
         config = "require('h3r3t1c.plugins/nvim-compe')"
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
         "kyazdani42/nvim-tree.lua",
         requires = {"kyazdani42/nvim-web-devicons"},
         config = "require('h3r3t1c.plugins/nvim-tree')", 
         keys = "<leader>t"
        })
    
    use({
         "tweekmonster/startuptime.vim",
         cmd = "StartupTime"
        })
    
    use({
         "glepnir/lspsaga.nvim",
         config = "require('h3r3t1c.plugins/lspsaga')"
    })
    
    use({
        "nvim-treesitter/nvim-treesitter",
        config = "require('h3r3t1c.plugins/nvim-treesitter')"
    })    
    
    use{
        "romgrk/nvim-treesitter-context",
        config = "require'treesitter-context.config'.setup{enable = true}"
    }
    
    use{
        "JoosepAlviste/nvim-ts-context-commentstring"
    }
    
    use({
        "onsails/lspkind-nvim",
        config = "require('h3r3t1c.plugins/lspkind')"
    })
    
    use({
         "folke/lsp-colors.nvim",
         config = "require('h3r3t1c.plugins/lsp-colors')"
    })
    
    use({
         "norcalli/nvim-colorizer.lua",
         config = "require'colorizer'.setup()"
    })
    
    use({
         "lukas-reineke/indent-blankline.nvim"
    })
    
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
    
    use({
         "nvim-lua/lsp-status.nvim"
    })

    use({
      'tpope/vim-fugitive'
    })
    
    use({
      'tpope/vim-repeat'
    })

    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = "require('h3r3t1c.plugins/trouble')"
    })
    
    use({
         "lewis6991/gitsigns.nvim",
         requires = {"nvim-lua/plenary.nvim"},
         config = "require('h3r3t1c.plugins/gitsigns')"
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
    
    
end

packer.startup(_1_)

local packer = require("packer")
local function _1_(use)
    use({
        "wbthomason/packer.nvim"
    })
    
    use({
         "marko-cerovac/material.nvim", 
         config = "require('h3r3t1c.plugins/material')"
        })
    
    use({
         "nvim-telescope/telescope.nvim",
         requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim"},
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
    
--    use({
--         "simrat39/rust-tools.nvim",
--         config = "require('h3r3t1c.plugins/rust-tools')"
--        })
    
    use({
         "hoob3rt/lualine.nvim",
         requires = {"kyazdani42/nvim-web-devicons"},
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
         "tpope/vim-commentary"
    })
end

packer.startup(_1_)

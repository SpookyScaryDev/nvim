return require('packer').startup(function()
    use "wbthomason/packer.nvim"
    use "sainnhe/gruvbox-material"
    use 'sainnhe/everforest'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'goolord/alpha-nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-project.nvim',
    }
    use 'JoseConseco/telescope_sessions_picker.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'feline-nvim/feline.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup{} end
    }
    use 'nvim-treesitter/nvim-treesitter'

    -- use {
    --   'VonHeikemen/lsp-zero.nvim',
    --   branch = 'v3.x',
    --   requires = {
    --     --- Uncomment the two plugins below if you want to manage the language servers from neovim
    --     {'williamboman/mason.nvim'},
    --     {'williamboman/mason-lspconfig.nvim'},
    -- 
    --     {'neovim/nvim-lspconfig'},
    --     {'hrsh7th/nvim-cmp'},
    --     {'hrsh7th/cmp-nvim-lsp'},
    --     {'L3MON4D3/LuaSnip'},
    --   }
    -- }

    use 'sar/cmp.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use 'norcalli/nvim-colorizer.lua'
    use 'numToStr/Comment.nvim'
end)

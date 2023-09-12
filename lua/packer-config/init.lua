return require('packer').startup(function()
    use "wbthomason/packer.nvim"
    use "ellisonleao/gruvbox.nvim"
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
    use {'lewis6991/gitsigns.nvim', config=function() require('gitsigns').setup() end }
    use 'feline-nvim/feline.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'xolox/vim-session',
        requires = { {'xolox/vim-misc'} },
        config = function() vim.g.session_directory = 'C:\\Users\\Thomas\\AppData\\Local\\nvim-data\\session' vim.g.session_autosave = 'no' end
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup{} end
    }
    use 'nvim-treesitter/nvim-treesitter'
    --use 'williamboman/nvim-lsp-installer'
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use 'onsails/lspkind.nvim'
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

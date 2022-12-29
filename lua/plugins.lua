-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
    }

    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    -- Scrollbar
    use { "petertriho/nvim-scrollbar",
        config = function() require("scrollbar").setup()
        end
    }


    -- Git related plugins
    use { 'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            }
            require("scrollbar.handlers.gitsigns").setup()
        end
    }

    use 'navarasu/onedark.nvim' -- Theme inspired by Atom
    -- Fancier statusline
    use { 'nvim-lualine/lualine.nvim',
        config = function() require('lualine').setup {
                options = {
                    icons_enabled = false,
                    theme = 'onedark',
                    component_separators = '|',
                    section_separators = '',
                },
            }
        end
    }
    -- Add indentation guides even on blank lines
    use { 'lukas-reineke/indent-blankline.nvim' }
    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'mhinz/vim-startify' }
    use {
        "max397574/better-escape.nvim",
        config = function() require("better_escape").setup {
                mapping = { "jk", "jj" },
                timout = 50,
            }
        end,
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end
    }
    use { "nvim-tree/nvim-web-devicons" }
    use { "onsails/lspkind.nvim" }
    use { "akinsho/toggleterm.nvim",
        config = function() require('toggleterm').setup({
                size = 10,
                open_mapping = [[<c-\>]],
                direction = "float",
                close_on_exit = true,
                shell = vim.o.shell
            })
        end
    }

    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- Tabs
    use({
        'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup {}
        end
    })

    if is_bootstrap then
        require('packer').sync()
    end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

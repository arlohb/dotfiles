return {
    -- The file tree
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
        cmd = { "NvimTreeToggle" },
        config = function()
            require("nvim-tree").setup {
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                },
            }
        end,
    },

    -- The tooltips when pressing a partial chord
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end,
    },

    -- The theme(s)
    {
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_better_performance = 1
            vim.cmd("colorscheme sonokai")
        end,
    },

    -- The line at the bottom
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    theme = "auto",
                },
            }
        end,
    },

    -- A fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
        cmd = "Telescope",
        config = function()
            require("telescope").setup {
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    },
                },
            }
        end,
    },

    -- A file browser for telescope
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },

    -- A project manager with telescope
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension("project")
        end,
    },

    -- Populates telescopes symbol picker
    {
        "nvim-telescope/telescope-symbols.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
    },

    -- A floating terminal
    "voldikss/vim-floaterm",

    -- Show thin lines at indents
    "lukas-reineke/indent-blankline.nvim",

    -- Comment and uncomment lines easily
    "tpope/vim-commentary",

    -- Autopair brackets and others
    {
        "windwp/nvim-autopairs",
        config = function()
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")
            local npairs = require("nvim-autopairs")

            require("nvim-autopairs").setup {}

            npairs.add_rule(Rule("<", ">")
            :with_move(cond.move_right)
            )
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup {
                hightlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },

    -- LSP based symbols outline
    "liuchengxu/vista.vim",

    -- Git diffs in file
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- Connects native LSP to nvim-cmp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        lazy = false,
        priority = 1000,
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            -- { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            -- { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },

    -- Start screen
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("dashboard").setup {
                theme = "doom",
                config = {
                    -- header = {},
                    center = {
                        {
                            icon = " ",
                            desc = "Find File",
                            key = "b",
                            action = "lua print(2)",
                        },
                        {
                            icon = " ",
                            desc = "Projects",
                            key = "SPC f p",
                        },
                    },
                    -- footer = {},
                },
            }
        end
    },

    -- Yuck (eww) syntax support
    "elkowar/yuck.vim",
}

-- Download packer plugin manager if it's not installed
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- The file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("nvim-tree").setup{}
        end
    }

    -- The tooltips when pressing a partial chord
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    -- The theme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "mocha"
            require("catppuccin").setup()
            vim.cmd[[colorscheme catppuccin]]
        end
    }

    -- The line at the bottom
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    theme = "catppuccin"
                }
            }
        end
    }

    -- A fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- A floating terminal
    use "voldikss/vim-floaterm"

    -- Show thin lines at indents
    use "lukas-reineke/indent-blankline.nvim"

    -- Comment and uncomment lines easily
    use "tpope/vim-commentary"

    -- Autopair brackets and others
    use {
        "windwp/nvim-autopairs",
        config = function()
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")
            local npairs = require("nvim-autopairs")

            require("nvim-autopairs").setup{}

            npairs.add_rule(Rule("<", ">")
                :with_move(cond.move_right)
            )
        end
    }


    -- If packer was just installed, sync it
    if packer_bootstrap then
        require('packer').sync()
    end
end)


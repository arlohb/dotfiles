-- https://mattermost.com/blog/how-to-install-and-set-up-neovim-for-code-editing/

-- My hostnames,
-- used to switch between some config values
local pc = "arlo-arch"
local laptop = "arlo-laptop2"

local f = io.open("/etc/hostname", "r")
local hostname
if f == nil then
    hostname = "arlo-arch"
else
    hostname = f:read("*l")
    f:close()
end


local opt = vim.opt
local g = vim.g


-- Make the leader key <space>
g.mapleader = ' '

-- Gui
opt.guifont = { "FiraCode Nerd Font", "h10" }
if hostname == pc then
    g.neovide_scale_factor = 0.7
end
if hostname == laptop then
    g.neovide_scale_factor = 0.55
end
g.neovide_hide_mouse_when_typing = true
g.neovide_remember_window_size = false
g.neovide_cursor_antialiasing = true

-- Context
opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column

-- Filetypes
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- Theme
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable

-- Search
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- Whitespace
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for

-- Splits
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- Make whichkey show up faster
opt.timeoutlen = 200


require("lazy_config")

require("plugins")
require("rust")
require("keys")

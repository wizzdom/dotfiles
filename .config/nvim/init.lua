--[[

 _   _ ______ ______      _______ __  __
| \ | |  ____/ __ \ \    / /_   _|  \/  |
|  \| | |__ | |  | \ \  / /  | | | \  / |
| . ` |  __|| |  | |\ \/ /   | | | |\/| |
| |\  | |___| |__| | \  /   _| |_| |  | |
|_| \_|______\____/   \/   |_____|_|  |_|

By WIZZDOM
Based off Kickstart.nvim

--]]

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

require("options")

require("keymaps")

require("autocmds")

require("lazy-bootstrap")
require("lazy").setup(require("plugins"))

-- vim: ts=2 sts=2 sw=2 et

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local utils = require("utils")
local augroup = utils.augroup
local autocmd = utils.autocmd

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

autocmd("BufWritePre", {
	desc = "Strip trailing whitespace on save",
	group = augroup("strip-trailing-whitespace", { clear = true }),
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

autocmd("BufWritePre", {
	desc = "Format buffer on save using nomad fmt",
	group = augroup("nomad-format", { clear = true }),
	pattern = { "*.nomad", "*.nomad.hcl", "**/nomad/**/*.hcl" },
	callback = function()
		vim.cmd([[%!nomad fmt -]])
	end,
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- Hyprlang LSP
autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.hl", "hypr*.conf", "**/hypr/*.conf" },
	callback = function(event)
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})

-- enable conceal for markdown files
autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md", "*.markdown" },
	callback = function()
		vim.opt.conceallevel = 2
	end,
})

-- vim: ts=2 sts=2 sw=2 et

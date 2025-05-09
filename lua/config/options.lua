-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g

opt.wildignore:append({ "*.meta" })
g.netrw_list_hide = ".*\\.meta$"
g.netrw_hide = 1

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
})

vim.wo.signcolumn = "yes"

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.mouse = "a"
opt.showmode = true

opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300

opt.list = true
opt.listchars = { tab = "| ", trail = "·", nbsp = "␣" }

opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 10

opt.hlsearch = true
opt.showtabline = 0

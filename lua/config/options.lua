-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- vim.opt.nu = true
vim.opt.relativenumber = true -- default: false
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

-- nim.opt.shiftwidth = 4   (default is 2)
-- print(vim.inspect(vim.opt.shiftwidth))

-- maj 2026-01-03
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- setup vim's grep to use ripgrep and format ripgrep's output to feed the ':grep pattern .' usage
vim.opt.grepprg = "rg --vimgrep --no-heading"
vim.opt.grepformat = "%f:%l:%c:%m"

-- The unnamedplus option tells Neovim to use the + register
-- (the system clipboard register) as the default register for all
-- y (yank), p (paste), and d (delete/cut) operations.
-- vim.opt.clipboard = "unnamedplus"        did not set nvim to use the system clipboard

-- turn off nvim mouse support, allow pass thru to terminal
-- this enabled highlight with mouse, Ctrl-Shift-C to copy to the system clipboard
vim.opt.mouse = ""

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

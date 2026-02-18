-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Load global utilities
require("config.globals")

-- maj's shortcuts

-- terminal split
-- vim.api.nvim_set_keymap("n", "<leader>te", ":split | terminal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>te", ":split | terminal<CR>", { noremap = true, silent = true })

-- "+ register is for the system clipboard that you interact with using Ctrl+C and Ctrl+V
-- "* register is for the primary selection in X11 which you typically intereact with using middle-click.
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- from ThePrimeagen

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half a screen, ThePrimeagen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up half a screen, ThePrimeagen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next what??, ThePrimeagen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "prev what??, ThePrimeagen" })

-- not needed <leader>e toggles the dir-tree view
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Explorer, { desc = "Project View (file Explorer)" })

-- a require here breaks
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "fuzzy find files, ThePrimeagen" })
-- vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "search only files in git repo, ThePrimeagen" })
-- vim.keymap.set("n", "<leader>ps", function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
--

--   ^^^^ maj LazyVim has an example of using telescope -- see example.lua

vim.keymap.set("v", "J", ":m '<+1<CR>gv=gv", { desc = "move a highlighted block down, ThePrimeagen" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move a highlighted block up, ThePrimeagen" })

-- buffer cycling (for Snacks bufferline)
vim.keymap.set("n", "<leader>bn", function() 
  require("snacks.picker").buffers({ jump = true })
end, { desc = "Next buffer (picker)" })

-- Alternative simple buffer cycling
vim.keymap.set("n", "<M-l>", vim.cmd.bnext, { desc = "Next buffer (Alt+l)" })
vim.keymap.set("n", "<M-h>", vim.cmd.bprevious, { desc = "Previous buffer (Alt+h)" })
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete, { desc = "Delete buffer" })

-- tab cycling and management (if you want actual tabs)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew, { desc = "New tab" })
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprevious, { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, { desc = "Close current tab" })

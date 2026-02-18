return {
  "filipdutescu/renamer.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>rn", "<Leader>rn", '<cmd>lua require("renamer").rename()<cr>', desc = "Rename" },
  },
  config = function()
    require("renamer").setup({})
  end,
}

-- vim.keymap.set('i', '<Leader>rn', '<cmd>lua require("renamer").rename()<cr>', { desc = 'Rename' })
-- vim.keymap.set('n', '<Leader>rn', '<cmd>lua require("renamer").rename()<cr>', { desc = 'Rename' })


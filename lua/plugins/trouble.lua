return {
  "folke/trouble.nvim",
  cmd = "TroubleToggle", -- command to open/close trouble
  keys = {
    -- keymap to open/close trouble
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble (Toggle)" },
    -- keymap for diagnostics in the workspace
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble (Workspace Diagnostics)" },
    -- keymap for diagnostics in the current buffer
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble (Document Diagnostics)" },
    -- keymap for quickfix list
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble (QuickFix)" },
    -- keymap for location list
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble (Location List)" },
  },
  opts = {
    -- your options here
    use_diagnostic_signs = true,
  },
}

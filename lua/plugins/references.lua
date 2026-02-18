-- ~/.config/nvim/lua/plugins/references.lua

-- print("Hello, Neovim!")
-- print("User config path:", vim.fn.stdpath("config"))

return {
  "neovim/nvim-lspconfig",
  keys = {
    {
      "<leader>fh",
      function()
        local word = vim.fn.expand("<cword>")
        print("Variable under cursor: " .. word)

        vim.lsp.buf.references()
        vim.cmd("copen")
      end,
      desc = "Find all references",
    },
  },
  opts = {
    -- Extend the keymaps table to add the new mapping
    -- This ensures the keymap is active only when the LSP client is ready
  },
}

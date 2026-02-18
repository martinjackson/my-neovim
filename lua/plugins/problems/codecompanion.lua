return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- Configure CodeCompanion to use Ollama as the default adapter
    strategies = {
      chat = { adapter = "ollama" },
      inline = { adapter = "ollama" },
      agent = { adapter = "ollama" },
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          -- Specify the default model here
          schema = {
            model = { default = "ministral-3:14b" }, -- "llama3.1" }, -- Use the model name you pulled in Step 1
          },
        })
      end,
    },
  },
  --  config = function()
  --    -- This is where you would put global keymaps that call CodeCompanion functions
  --    vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionChat<CR>", { desc = "AI Chat" })
  --    vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionCmd<CR>", { desc = "AI Commands" })
  --    vim.keymap.set("n", "<leader>ap", "<cmd>CodeCompanion<CR>", { desc = "AI Prompt" })
  --    vim.keymap.set("n", "<leader>ax", "<cmd>CodeCompanionActions<CR>", { desc = "AI Actions" })
  --    -- Add more keymaps as needed
  --  end,
}

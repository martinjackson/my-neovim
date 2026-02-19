return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      auto_fallback_to_embedded = false,
    },
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask()
        end,
        mode = "n",
        desc = "OpenCode Toggle Chat",
      },
      {
        "<leader>oa",
        function()
          require("opencode").ask("@selection: ")
        end,
        mode = "v",
        desc = "OpenCode #selection",
      },
      {
        "<leader>op",
        function()
          require("opencode").select_prompt()
        end,
        mode = { "n", "v" },
        desc = "OpenCode select prompt",
      },
    },
  },
}

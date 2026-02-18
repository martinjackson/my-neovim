return {
  "folke/noice.nvim",
  -- enabled = false,      <--- this did not work
  event = "VeryLazy",
  opts = {
    -- other noice options
    notify = {
      -- timeout = 2000, -- Set the default timeout for notifications (e.g., 2 seconds)
      timeout = 20000, -- Set the default timeout for notifications (e.g., 20 seconds)
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

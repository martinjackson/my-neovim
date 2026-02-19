-- ~/.config/nvim/lua/plugins/theme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensures it loads early
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha") -- Set your desired Catppuccin flavor
    end,
  },
  -- You can add other theme-related plugins here if needed
}

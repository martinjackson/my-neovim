return {
  "dense-analysis/ale",
  keys = {
    { "<leader>se", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show Lint Error" },
  },
  config = function()
    -- Configuration goes here.
    local g = vim.g

    -- Example configurations (modify as needed):
    -- Enable linting on save
    g.ale_lint_on_save = 1
    -- Enable fixing on save (requires fixers to be installed and configured)
    g.ale_fix_on_save = 1
    -- Specify linters for specific filetypes (example for Python and Lua)
    g.ale_linters = {
      python = { "pylint", "flake8" },
      lua = { "lua_language_server" },
      javascript = { "eslint" },
      typescript = { "eslint" },

      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    }
    -- Specify fixers for specific filetypes
    g.ale_fixers = {
      python = { "black", "isort" },
      javascript = { "eslint" },

      ["*"] = { "trim_whitespace", "remove_trailing_lines" },
    }

    -- Add any other specific ALE options you want here
    -- e.g., g.ale_ruby_rubocop_auto_correct_all = 1
  end,
}

-- Customize float borders and colors
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#1e222a", fg = "#abb2bf"})
vim.api.nvim_set_hl(0, "FloatBorder", {bg = "#1e222a", fg = "#5c6370"})

-- Force border on LSP hover
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<cr>')


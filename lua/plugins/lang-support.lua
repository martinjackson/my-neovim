local function is_lsp_attached(server_name)
  -- Iterate over all active LSP clients for the current buffer
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    -- Check if the client's name matches the server_name and if it's considered "ready"
    -- Readiness is often implied if the client is active and initialized
    if client.name == server_name and client.server_capabilities then
      return true
    end
  end
  return false
end

-- Example of how to use it
-- if not is_lsp_attached("tsserver") then
--   -- Your code to handle the situation where tsserver is not ready/attached
--   print("tsserver is not attached or ready")
-- end

return {

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "jsx",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "yaml",
      },
    },
  },

  -- add typescript lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
      },
    },
    config = function()
      -- Auto-install tsserver if not already installed
      local lspconfig = require("lspconfig")
      if not is_lsp_attached("tsserver") then
        -- ensure mason is set up first
        require("mason").setup()

        -- ensure mason-lspconfig is set up
        require("mason-lspconfig").setup({
          -- Changed tsserver to ts_ls here
          ensure_installed = { "lua_ls", "bashls", "html", "ts_ls" },
        })

        -- set up lspconfig for tsserver
        require("lspconfig").ts_ls.setup({})
      end
    end,
  },
}

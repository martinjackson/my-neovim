return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Function to list all inlay hints
    function ListInlayHints()
      local bufnr = vim.api.nvim_get_current_buf()
      local hints = vim.lsp.inlay_hint.get(bufnr)
      if not hints then
        vim.notify("No inlay hints available", vim.log.levels.INFO)
        return
      end

      for line, line_hints in pairs(hints) do
        for _, hint in ipairs(line_hints) do
          local text = type(hint.label) == "string" and hint.label
            or table.concat(
              vim.tbl_map(function(part)
                return part.value
              end, hint.label),
              ""
            )
          print(string.format("Line %d, Col %d: %s", line + 1, hint.position.character + 1, text))
        end
      end
      vim.notify("inlay hints list generated.", vim.log.levels.INFO)
    end

    -- Global LSP attach handler
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Enable inlay hints if supported
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, args.buf)
          vim.keymap.set("n", "<leader>h", ListInlayHints, { buffer = args.buf, desc = "List Inlay Hints" })
          vim.keymap.set(
            "n",
            "<leader>th",
            vim.lsp.inlay_hint.toggle,
            { buffer = args.buf, desc = "Toggle Inlay Hints" }
          )
        end
      end,
    })

    -- Example configuration for nvim-lspconfig
    require("lspconfig").tsserver.setup({})
  end,
}

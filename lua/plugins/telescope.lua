return {

  -- change some telescope options and a keymap to browse plugin files
  "nvim-telescope/telescope.nvim",
  keys = {

      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },

    -- Overrides <leader>fg which defaults to find files in the current git repo
    --
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      desc = "Live Grep",
    },

    -- telescope.nvim resume previous search
    --
    {
      "<leader>fr",
      function()
        require("telescope.builtin").resume()
      end,
      desc = "Telescope resume previous search",
    },

    -- telescope.nvim keymaps picker
    --
    {
      "<leader>fk",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Find Keymaps",
    },

    -- search across the project for the word under the cursor and add to quickfix
    --
    {
      "<leader>fh", --  maj
      function()
        local word = vim.fn.expand("<cword>")
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        pickers
          .new({}, {
            prompt_title = "References to: " .. word,
            finder = finders.new_oneshot_job({
              "rg",
              "--word",
              "--column",
              "--line-number",
              "--no-heading",
              "--color=never",
              "--smart-case",
              word,
            }, {}),
            sorter = conf.file_sorter({}),
            attach_mappings = function(prompt_bufnr, map)
              actions.select_default:replace(function()
                local results = {}
                local picker = action_state.get_current_picker(prompt_bufnr)

                for _, entry in ipairs(picker:get_multi_selection()) do
                  table.insert(results, {
                    filename = entry.filename,
                    lnum = entry.lnum,
                    col = entry.col,
                    text = entry.text,
                  })
                end

                if vim.tbl_isempty(results) then
                  local entry = action_state.get_selected_entry()
                  if entry then
                    table.insert(results, {
                      filename = entry.filename,
                      lnum = entry.lnum,
                      col = entry.col,
                      text = entry.text,
                    })
                  end
                end

                vim.fn.setqflist(results)
                vim.cmd("copen")
                actions.close(prompt_bufnr)
              end)

              map("i", "<C-q>", function()
                local results = {}
                local picker = action_state.get_current_picker(prompt_bufnr)

                for _, entry in ipairs(picker:get_multi_selection()) do
                  table.insert(results, {
                    filename = entry.filename,
                    lnum = entry.lnum,
                    col = entry.col,
                    text = entry.text,
                  })
                end

                if vim.tbl_isempty(results) then
                  local entry = action_state.get_selected_entry()
                  if entry then
                    table.insert(results, {
                      filename = entry.filename,
                      lnum = entry.lnum,
                      col = entry.col,
                      text = entry.text,
                    })
                  end
                end

                vim.fn.setqflist(results)
                vim.cmd("copen")
                actions.close(prompt_bufnr)
              end)

              return true
            end,
          })
          :find()
      end,
      desc = "Find references and add to quickfix",
    },

    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        path_display = { "absolute" }, -- { "relative" } (shows relative path)
      },
    },
  },
}

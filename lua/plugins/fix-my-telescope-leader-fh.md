# Implementing Lua Telescope references finder with quickfix list and &lt;leader&gt;fh

**Session ID:** ses_465dfa166ffeDfX2wu8vAn6uwv
**Created:** 1/7/2026, 2:22:51 PM
**Updated:** 1/7/2026, 2:24:04 PM

---

## User

I want to write a lua plugin that uses Telescope to find all references to the function or variable under the cursor and once Telescope has a list, I want to place the matches in a quick list. I would then like to define the hotkey as <leader>fh

---

## Assistant (Build · big-pickle · 4.0s)

_Thinking:_

I'll help you create a Lua plugin that uses Telescope to find references and populate a quickfix list. Let me start by exploring your Neovim configuration structure to understand the setup.

```
Tool: glob

**Input:**
```json
{
  "pattern": "**/*.lua",
  "path": "/home/mjackson/.config/nvim"
}
```

**Output:**

```
/home/mjackson/.config/nvim/lua/plugins/telescope.lua
/home/mjackson/.config/nvim/lua/plugins/theme.lua
/home/mjackson/.config/nvim/lua/plugins/codecompanion.lua
/home/mjackson/.config/nvim/lua/plugins/opencode.lua
/home/mjackson/.config/nvim/lua/plugins/mini.surround.lua
/home/mjackson/.config/nvim/lua/config/keymaps.lua
/home/mjackson/.config/nvim/lua/config/options.lua
/home/mjackson/.config/nvim/plugin/after/transparency.lua
/home/mjackson/.config/nvim/init.lua
/home/mjackson/.config/nvim/lua/plugins/snacks-animated-scrolling-off.lua
/home/mjackson/.config/nvim/lua/plugins/comment.lua
/home/mjackson/.config/nvim/lua/plugins/test.lua
/home/mjackson/.config/nvim/lua/plugins/ollama-nvim.lua
/home/mjackson/.config/nvim/lua/plugins/disable-news-alert.lua
/home/mjackson/.config/nvim/lua/plugins/nvim-react-snippets.lua
/home/mjackson/.config/nvim/lua/config/lazy.lua
/home/mjackson/.config/nvim/lua/config/nvim-dap.lua
/home/mjackson/.config/nvim/lua/config/autocmds.lua
/home/mjackson/.config/nvim/lua/plugins/example.lua
```

```

---

## Assistant (Build · big-pickle · 12.0s)

_Thinking:_




I'll help you create a Lua plugin that uses Telescope to find references and populate a quickfix list. Let me start by exploring your Neovim configuration structure to understand the setup.

```

Tool: glob

**Input:**

```json
{
  "pattern": "**/*.lua",
  "path": "/home/mjackson/.config/nvim"
}
```

**Output:**

```
/home/mjackson/.config/nvim/lua/plugins/telescope.lua
/home/mjackson/.config/nvim/lua/plugins/theme.lua
/home/mjackson/.config/nvim/lua/plugins/codecompanion.lua
/home/mjackson/.config/nvim/lua/plugins/opencode.lua
/home/mjackson/.config/nvim/lua/plugins/mini.surround.lua
/home/mjackson/.config/nvim/lua/config/keymaps.lua
/home/mjackson/.config/nvim/lua/config/options.lua
/home/mjackson/.config/nvim/plugin/after/transparency.lua
/home/mjackson/.config/nvim/init.lua
/home/mjackson/.config/nvim/lua/config/lazy.lua
/home/mjackson/.config/nvim/lua/config/nvim-dap.lua
/home/mjackson/.config/nvim/lua/config/autocmds.lua
/home/mjackson/.config/nvim/lua/plugins/nvim-react-snippets.lua
/home/mjackson/.config/nvim/lua/plugins/snacks-animated-scrolling-off.lua
/home/mjackson/.config/nvim/lua/plugins/comment.lua
/home/mjackson/.config/nvim/lua/plugins/test.lua
/home/mjackson/.config/nvim/lua/plugins/ollama-nvim.lua
/home/mjackson/.config/nvim/lua/plugins/disable-news-alert.lua
/home/mjackson/.config/nvim/lua/plugins/example.lua
```

```

---

## Assistant (Build · big-pickle · 25.4s)

_Thinking:_




Let me examine your Telescope configuration and keymaps to understand the current setup:

```

Tool: read

**Input:**

```json
{
  "filePath": "/home/mjackson/.config/nvim/lua/plugins/telescope.lua"
}
```

**Output:**

```
<file>
00001| return {
00002| 
00003|   -- change some telescope options and a keymap to browse plugin files
00004|   "nvim-telescope/telescope.nvim",
00005|   keys = {
00006| 
00007|       -- add a keymap to browse plugin files
00008|       -- stylua: ignore
00009|       {
00010|         "<leader>fp",
00011|         function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
00012|         desc = "Find Plugin File",
00013|       },
00014| 
00015|     -- Overrides <leader>fg which defaults to find files in the current git repo
00016|     --
00017|     {
00018|       "<leader>fg",
00019|       "<cmd>Telescope live_grep<cr>",
00020|       desc = "Live Grep",
00021|     },
00022| 
00023|     -- telescope.nvim resume previous search
00024|     --
00025|     {
00026|       "<leader>fr",
00027|       function()
00028|         require("telescope.builtin").resume()
00029|       end,
00030|       desc = "Telescope resume previous search",
00031|     },
00032| 
00033|     -- telescope.nvim keymaps picker
00034|     --
00035|     {
00036|       "<leader>fk",
00037|       function()
00038|         require("telescope.builtin").keymaps()
00039|       end,
00040|       desc = "Find Keymaps",
00041|     },
00042| 
00043|     -- search across the project for the word under the cursor
00044|     --
00045|     {
00046|       "<leader>fh", --  maj
00047|       function()
00048|         require("telescope.builtin").grep_string()
00049|       end,
00050|       desc = "Find the word under the cursor across the project <C-q>",
00051|     },
00052| 
00053|     -- change some options
00054|     opts = {
00055|       defaults = {
00056|         layout_strategy = "horizontal",
00057|         layout_config = { prompt_position = "top" },
00058|         sorting_strategy = "ascending",
00059|         winblend = 0,
00060|         path_display = { "absolute" }, -- { "relative" } (shows relative path)
00061|       },
00062|     },
00063|   },
00064| }
00065| 

(End of file - total 65 lines)
</file>
```

```

```

Tool: read

**Input:**

```json
{
  "filePath": "/home/mjackson/.config/nvim/lua/config/keymaps.lua"
}
```

**Output:**

```
<file>
00001| -- Keymaps are automatically loaded on the VeryLazy event
00002| -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
00003| -- Add any additional keymaps here
00004| 
00005| -- maj's shortcuts
00006| 
00007| -- terminal split
00008| -- vim.api.nvim_set_keymap("n", "<leader>te", ":split | terminal<CR>", { noremap = true, silent = true })
00009| vim.keymap.set("n", "<leader>te", ":split | terminal<CR>", { noremap = true, silent = true })
00010| 
00011| -- from ThePrimeagen
00012| 
00013| vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half a screen, ThePrimeagen" })
00014| vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up half a screen, ThePrimeagen" })
00015| vim.keymap.set("n", "n", "nzzzv", { desc = "next what??, ThePrimeagen" })
00016| vim.keymap.set("n", "N", "Nzzzv", { desc = "prev what??, ThePrimeagen" })
00017| 
00018| -- not needed <leader>e toggles the dir-tree view
00019| -- vim.keymap.set("n", "<leader>pv", vim.cmd.Explorer, { desc = "Project View (file Explorer)" })
00020| 
00021| -- a require here breaks
00022| -- local builtin = require("telescope.builtin")
00023| -- vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "fuzzy find files, ThePrimeagen" })
00024| -- vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "search only files in git repo, ThePrimeagen" })
00025| -- vim.keymap.set("n", "<leader>ps", function()
00026| --     builtin.grep_string({ search = vim.fn.input("Grep > ") });
00027| -- end)
00028| --
00029| 
00030| --   ^^^^ maj LazyVim has an example of using telescope -- see example.lua
00031| 
00032| vim.keymap.set("v", "J", ":m '<+1<CR>gv=gv", { desc = "move a highlighted block down, ThePrimeagen" })
00033| vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move a highlighted block up, ThePrimeagen" })
00034| 

(End of file - total 34 lines)
</file>
```

```

---

## Assistant (Build · big-pickle · 12.2s)

_Thinking:_




I can see that `<leader>fh` is already mapped to `grep_string()` in your Telescope configuration. I'll modify this to find references and populate the quickfix list. Let me create a custom function for this:

```

Tool: edit

**Input:**

```json
{
  "filePath": "/home/mjackson/.config/nvim/lua/plugins/telescope.lua",
  "oldString": "    -- search across the project for the word under the cursor\n    --\n    {\n      \"<leader>fh\", --  maj\n      function()\n        require(\"telescope.builtin\").grep_string()\n      end,\n      desc = \"Find the word under the cursor across the project <C-q>\",\n    },",
  "newString": "    -- search across the project for the word under the cursor and add to quickfix\n    --\n    {\n      \"<leader>fh\", --  maj\n      function()\n        local word = vim.fn.expand(\"<cword>\")\n        local pickers = require(\"telescope.pickers\")\n        local finders = require(\"telescope.finders\")\n        local conf = require(\"telescope.config\").values\n        local actions = require(\"telescope.actions\")\n        local action_state = require(\"telescope.actions.state\")\n        \n        pickers.new({}, {\n          prompt_title = \"References to: \" .. word,\n          finder = finders.new_oneshot_job({\n            \"rg\",\n            \"--word\",\n            \"--column\",\n            \"--line-number\",\n            \"--no-heading\",\n            \"--color=never\",\n            \"--smart-case\",\n            word,\n          }, {}),\n          sorter = conf.file_sorter({}),\n          attach_mappings = function(prompt_bufnr, map)\n            actions.select_default:replace(function()\n              local results = {}\n              local picker = action_state.get_current_picker(prompt_bufnr)\n              \n              for _, entry in ipairs(picker:get_multi_selection()) do\n                table.insert(results, {\n                  filename = entry.filename,\n                  lnum = entry.lnum,\n                  col = entry.col,\n                  text = entry.text\n                })\n              end\n              \n              if vim.tbl_isempty(results) then\n                local entry = action_state.get_selected_entry()\n                if entry then\n                  table.insert(results, {\n                    filename = entry.filename,\n                    lnum = entry.lnum,\n                    col = entry.col,\n                    text = entry.text\n                  })\n                end\n              end\n              \n              vim.fn.setqflist(results)\n              vim.cmd(\"copen\")\n              actions.close(prompt_bufnr)\n            end)\n            \n            map(\"i\", \"<C-q>\", function()\n              local results = {}\n              local picker = action_state.get_current_picker(prompt_bufnr)\n              \n              for _, entry in ipairs(picker:get_multi_selection()) do\n                table.insert(results, {\n                  filename = entry.filename,\n                  lnum = entry.lnum,\n                  col = entry.col,\n                  text = entry.text\n                })\n              end\n              \n              if vim.tbl_isempty(results) then\n                local entry = action_state.get_selected_entry()\n                if entry then\n                  table.insert(results, {\n                    filename = entry.filename,\n                    lnum = entry.lnum,\n                    col = entry.col,\n                    text = entry.text\n                  })\n                end\n              end\n              \n              vim.fn.setqflist(results)\n              vim.cmd(\"copen\")\n              actions.close(prompt_bufnr)\n            end)\n            \n            return true\n          end,\n        }):find()\n      end,\n      desc = \"Find references and add to quickfix\",\n    },"
}
```

```

---

## Assistant (Build · big-pickle · 19.3s)

_Thinking:_




The plugin is now configured! The `<leader>fh` keymap will:

1. Search for the word under the cursor using ripgrep
2. Show results in a Telescope picker
3. Press `<C-q>` or Enter to send all selected results (or just the current one if none selected) to the quickfix list
4. Auto-open the quickfix window

The function uses Telescope's picker API to find word references and provides a custom attachment handler to populate the quickfix list with the results.

---


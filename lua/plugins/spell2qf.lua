
-- Define global function
_G.PopulateQuickfixWithMisspellings = function()
  local qflist = {}
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local lnum = 0

  for _, line in ipairs(lines) do
    lnum = lnum + 1
    local col = 0
    
    while col >= 0 do
      local word_match = vim.fn.matchstrpos(line, '\\a\\+', col)
      local word = word_match[1]
      local start_col = word_match[2]
      local end_col = word_match[3]
      
      if word == '' then
        break
      end
      
      -- Check if the word is misspelled
      local spell_result = vim.fn.spellbadword(word)
      if spell_result[1] ~= '' then
        local entry = {
          bufnr = bufnr,
          lnum = lnum,
          col = start_col + 1, -- col is 0-based, qflist is 1-based
          text = 'Misspelling: ' .. word
        }
        table.insert(qflist, entry)
      end
      
      col = end_col
    end
  end

  vim.fn.setqflist(qflist, 'r') -- 'r' replaces the current list
  vim.cmd('copen') -- Open the quickfix window
end

return {
  -- Custom plugin for spell checking to quickfix
  {
    "spell2qf",
    name = "spell2qf",
    dir = ".",
    keys = {
      {
        "<leader>sq",
        "<cmd>lua PopulateQuickfixWithMisspellings()<cr>",
        desc = "Spell check to quickfix",
      },
    },
  },
}



local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = { 'BufReadPost', 'BufNewFile' },
    enabled = false,
    init = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 10
    end,
    opts = {
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end,
      fold_virt_text_handler = handler,
    },
    -- config = function() local ufo = require 'ufo'
    --   ufo.setup {
    --     provider_selector = function()
    --       return { 'treesitter', 'indent' }
    --     end,
    --     fold_virt_text_handler = handler,
    --     close_fold_kinds = { 'imports', 'comment' },
    --   }
    -- require("ufo").setup()
    -- vim.keymap.set('n', 'zR', ufo.openAllFolds)
    -- vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    -- vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
    -- vim.keymap.set('n', 'zm', ufo.closeFoldsWith)
    -- end,
  },
  {
    'chrisgrieser/nvim-origami',
    -- event = 'VeryLazy',
    event = { 'BufReadPost', 'BufNewFile' },
    -- enabled = false,
    opts = {}, -- needed even when using default config

    -- recommended: disable vim's auto-folding
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.o.foldcolumn = 'auto' -- '0' is not bad
    end,
  },
}

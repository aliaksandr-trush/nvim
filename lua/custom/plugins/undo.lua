return {
  -- "jiaoshijie/undotree",
    "mbbill/undotree",
  -- enabled = false,
  -- dependencies = "nvim-lua/plenary.nvim",
  -- opts = {},
  keys = {
    -- { "<leader>u", function() require('undotree').toggle() end, desc = "Undo Tree" },
    { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undo Tree" },
  },
}

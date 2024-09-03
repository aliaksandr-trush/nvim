return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
  keys = {
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo Tree" },
  },
}

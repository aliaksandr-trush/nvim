return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { '<leader>gl', "<cmd>lua require('lazygit').lazygit()<cr>", desc = 'Open [G]it\'s [L]azygit' },
  }
}

return {
  {
    "olimorris/persisted.nvim",
    enabled = false,
    config = function()
      require("persisted").setup({
        autoload = true,
        on_autoload_no_session = function()
          vim.notify("No existing session to load.")
        end
      })
      vim.keymap.set('n', '<leader>sp', ':Telescope persisted<CR>', { desc = '[S]earch [P]roject' })
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
    keys = {
      { '<leader>ps', '<cmd>lua require("persistence").load()<cr>',                desc = "Load session" },
      { '<leader>pl', '<cmd>lua require("persistence").load({ last = true })<cr>', desc = "Load last session" },
      { '<leader>pd', '<cmd>lua require("persistence").stop()<cr>',                desc = "Do not save session" },
    },
  }
}

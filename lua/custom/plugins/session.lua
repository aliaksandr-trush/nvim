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
  }
}

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      hijack_cursor = true,
      filters = {
        git_clean = false,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    }

    vim.keymap.set('n', '<leader>tt', require('nvim-tree.api').tree.toggle, { desc = 'Toggle TreeView' })
    vim.keymap.set('n', '<leader>ff', function()
      require('nvim-tree.api').tree.find_file({ focus = true, open = true })
    end, { desc = '[F]ind [f]ile in TreeView' })

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}

return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  branch = 'main',
  build = ':TSUpdate',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {},
    },
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
      config = function()
        vim.keymap.set({ 'x', 'o' }, 'af', function()
          require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
        end)
        vim.keymap.set({ 'x', 'o' }, 'if', function()
          require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
        end)
        vim.keymap.set({ 'x', 'o' }, 'ac', function()
          require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
        end)
        vim.keymap.set({ 'x', 'o' }, 'ic', function()
          require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
          require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
        end)

        vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
        end)

        vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
          require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
        end)

        vim.api.nvim_create_user_command('TSStart', function()
          vim.treesitter.start()
        end, { desc = 'Start treesitter' })

        vim.api.nvim_create_user_command('TSStop', function()
          vim.treesitter.stop()
        end, { desc = 'Stop treesitter' })
      end,
    },
  },
}

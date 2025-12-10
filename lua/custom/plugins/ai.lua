return {
  {
    'Exafunction/codeium.nvim',
    event = 'InsertEnter',
    dev = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- 'hrsh7th/nvim-cmp',
      -- 'saghen/blink.cmp',
    },
    opts = {
      enable_chat = true,
      enable_local_search = true,
      enable_index_service = true,
      enable_cmp_source = false,
    },
    keys = {
      {
        '<leader>cc',
        function()
          require('codeium').chat()
        end,
        desc = 'Codeium Chat',
      },
      { '<leader>tc', '<cmd>Codeium Toggle<cr>', desc = 'Toggle Codeium' },
      {
        '<leader>cd',
        function()
          require('codeium').add_docstring()
        end,
        desc = 'Add docstring',
      },
    },
    -- config = function()
    --   local codeium = require 'codeium'
    --   codeium.setup {
    --     enable_chat = true,
    --     enable_local_search = true,
    --     enable_index_service = true,
    --     enable_cmp_source = false,
    --     -- virtual_text = {
    --     --   enabled = true,
    --     -- },
    --   }
    --   vim.keymap.set('n', '<leader>cc', codeium.chat, { desc = 'Codeium Chat' })
    --   -- vim.keymap.set('n', '<leader>cc', '<cmd>Codeium Chat<cr>', { desc = 'Codeium' })
    --   vim.keymap.set('n', '<leader>tc', codeium.toggle, { desc = 'Toggle Codeium' })
    -- end,
  },
  {
    'folke/sidekick.nvim',
    enabled = false,
    opts = {
      cli = {
        mux = {
          backend = 'tmux',
          enabled = true,
        },
      },
    },
    keys = {
      {
        '<tab>',
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require('sidekick').nes_jump_or_apply() then
            return '<Tab>' -- fallback to normal tab
          end
        end,
        expr = true,
        desc = 'Goto/Apply Next Edit Suggestion',
      },
      {
        '<c-.>',
        function()
          require('sidekick.cli').focus()
        end,
        mode = { 'n', 'x', 'i', 't' },
        desc = 'Sidekick Switch Focus',
      },
      {
        '<leader>aa',
        desc = 'Sidekick Toggle CLI',
        function()
          require('sidekick.cli').toggle()
        end,
        mode = { 'n', 'v' },
      },
      {
        '<leader>as',
        function()
          require('sidekick.cli').select()
          -- Or to select only installed tools:
          -- require("sidekick.cli").select({ filter = { installed = true } })
        end,
        desc = 'Sidekick Select CLI',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ac',
        function()
          require('sidekick.cli').toggle { name = 'claude', focus = true }
        end,
        desc = 'Sidekick Claude Toggle',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ag',
        function()
          require('sidekick.cli').toggle { name = 'grok', focus = true }
        end,
        desc = 'Sidekick Grok Toggle',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ap',
        function()
          require('sidekick.cli').prompt()
        end,
        desc = 'Sidekick Ask Prompt',
        mode = { 'n', 'v' },
      },
    },
  },
}

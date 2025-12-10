return {
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },
  {
    'tpope/vim-rhubarb',
    event = 'VeryLazy',
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gl', "<cmd>lua require('lazygit').lazygit()<cr>", desc = "Open [G]it's [L]azygit" },
    },
    config = function()
      -- vim.g.lazygit_floating_window_use_plenary = 1
      vim.g.lazygit_use_neovim_remote = 0
      -- vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'}
    end,
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      -- See `:help gitsigns.txt`
      numhl = true,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            -- gs.next_hunk()
            gs.nav_hunk 'next'
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            -- gs.prev_hunk()
            gs.nav_hunk 'prev'
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- Toggles
        map('n', '<leader>gb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>gd', gs.toggle_deleted, { desc = 'toggle git show deleted' })
        -- vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
        -- vim.keymap.set('n', '<leader>hb', require('gitsigns').toggle_current_line_blame, { buffer = bufnr, desc = 'Preview git blame' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  },
  -- { 'sindrets/diffview.nvim' },
  {
    'NeogitOrg/neogit',
    -- enabled = false,
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      "ibhagwan/fzf-lua",              -- optional
      -- Only one of these is needed.
      -- 'nvim-telescope/telescope.nvim', -- optional
    },
    opts = {
      integrations = {
        fzf_lua = true,
        diffview = true,
      },
      graph_style = "unicode",
    },
    keys = {
      { '<leader>gg', function() require('neogit').open() end, desc = "Open [G]it's [G]it" },
    },

  },
}

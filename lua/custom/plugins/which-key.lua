return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    -- document existing key chains
    local wk = require('which-key')
    wk.setup({
      preset = "helix",
    })
    wk.add {
      { '<leader>c',  group = '[C]ode' },
      { '<leader>c_', hidden = true },
      { '<leader>d',  group = '[D]ocument' },
      { '<leader>d_', hidden = true },
      { '<leader>g',  group = '[G]it' },
      { '<leader>g_', hidden = true },
      { '<leader>f',  group = '[F]ind' },
      { '<leader>f_', hidden = true },
      { '<leader>h',  group = 'Git [H]unk' },
      { '<leader>h_', hidden = true },
      { '<leader>p',  group = '[P]roject' },
      { '<leader>p_', hidden = true },
      { '<leader>r',  group = '[R]ename' },
      { '<leader>r_', hidden = true },
      { '<leader>s',  group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>t',  group = '[T]oggle' },
      { '<leader>t_', hidden = true },
      { '<leader>w',  group = '[W]orkspace' },
      { '<leader>w_', hidden = true },
      { '<leader>x',  group = 'Trouble' },
      { '<leader>x_', hidden = true },
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      { '<leader>',   group = 'VISUAL <leader>', mode = 'v' },
      { '<leader>_',  hidden = true,             mode = 'v' },
      { '<leader>h',  group = 'Git [H]unk',      mode = 'v' },
      { '<leader>h_', hidden = true,             mode = 'v' },
    }
  end
}

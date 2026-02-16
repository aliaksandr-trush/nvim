-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ''

require 'options'

require 'lazy-bootstrap'

-- [[ Configure plugins ]]
require('lazy').setup({

  -- Detect tabstop and shiftwidth automatically
  {
    -- 'tpope/vim-sleuth',
    'nmac427/guess-indent.nvim',
    event = { 'BufRead', 'BufNewFile' },
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'kevinhwang91/nvim-bqf',
    -- enabled = false,
    ft = 'qf',
    dependencies = {
      'junegunn/fzf',
      {
        'stevearc/quicker.nvim',
        -- ft = 'qf',
        ---@module "quicker"
        ---@type quicker.SetupOptions
        opts = {},
      },
    },
  },
  { import = 'custom.plugins' },
}, {
  dev = { path = '~/Projects/' },
  -- none, single, double, rounded, solid, shadow
  ui = { border = 'rounded' },
})

-- require 'keymap'

-- require 'highlight'

-- require 'snips.go'

vim.filetype.add {
  extension = {
    ftl = 'fluent',
  },
}


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'

require 'lazy-bootstrap'

-- [[ Configure plugins ]]
require('lazy').setup({

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },


  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',

  { import = 'custom.plugins' },
}, {
  dev = { path = "~/Projects/" }
})

require 'keymap'

require 'highlight'


vim.cmd.colorscheme 'kanagawa'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

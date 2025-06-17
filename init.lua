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
    event = {'BufRead', 'BufNewFile'},
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {},
  },

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',

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

local servers = {
  'clangd',
  'gopls',
  'basedpyright',
  'ruff',
  'rust_analyzer',
  'lua_ls',
  'ty',
  'textlsp',
}

vim.lsp.enable(servers)

vim.cmd.colorscheme 'kanagawa'
-- vim.cmd.colorscheme 'tokyonight'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

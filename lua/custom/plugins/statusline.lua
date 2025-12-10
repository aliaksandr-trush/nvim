return {
  'nvim-lualine/lualine.nvim',
  -- dev = true,
  -- event = 'VeryLazy',
  -- commit = '0c6cca9f2c63dadeb9225c45bc92bb95a151d4af',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'yavorski/lualine-macro-recording.nvim',
  },
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      -- theme = 'kanagawa',
      -- component_separators = '|',
      -- section_separators = '',
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        },
        'lsp_status',
        'macro_recording',
      },
      lualine_x = {
        -- 'lsp_status',
        'filetype',
        'filesize',
      },
      -- lualine_x = {
      --   {
      --     require("noice").api.status.message.get_hl,
      --     cond = require("noice").api.status.message.has,
      --   },
      --   {
      --     require("noice").api.status.command.get,
      --     cond = require("noice").api.status.command.has,
      --     color = { fg = "#ff9e64" },
      --   },
      --   {
      --     require("noice").api.status.mode.get,
      --     cond = require("noice").api.status.mode.has,
      --     color = { fg = "#ff9e64" },
      --   },
      --   {
      --     require("noice").api.status.search.get,
      --     cond = require("noice").api.status.search.has,
      --     color = { fg = "#ff9e64" },
      --   },
      -- },
    },
    inactive_sections = {
      lualine_c = { { 'filename', path = 4 } },
    },
    extensions = { 'quickfix', 'fugitive', 'trouble' },
  },
}

return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  -- dev = true,
  event = 'VeryLazy',
  -- lazy = false,
  -- branch = 'main',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {},
    },
  },
  build = ':TSUpdate',
  -- config = function()
  --   install_dir = vim.fn.stdpath 'data' .. '/site'
  -- end,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      -- Autoinstall languages that are not installed. Defaults to true
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- ignore_install = { 'org' },
      -- auto_install = true,
      highlight = {
        enable = true,
        disable = { 'tmux' },
      },
      indent = {
        enable = true,
        disable = { 'python', 'org' },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>aa'] = '@parameter.inner',
            ['<leader>af'] = '@function.outer',
            ['<leader>ac'] = '@class.outer',
          },
          swap_previous = {
            ['<leader>aA'] = '@parameter.inner',
            ['<leader>aF'] = '@function.outer',
            ['<leader>aC'] = '@class.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        lsp_interop = {
          enable = true,
          -- border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ['<leader>df'] = '@function.outer',
            ['<leader>dF'] = '@class.outer',
          },
        },
      },
    }
  end,
}

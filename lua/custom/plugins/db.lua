return {
  'kristijanhusak/vim-dadbod-ui',
  event = 'VeryLazy',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  config = function()
    require('cmp').setup.filetype(
      { "sql", "mysql", "plsql" },
      {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        }
      }
    )
  end,
}

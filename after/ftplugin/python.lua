vim.cmd 'setlocal colorcolumn=80'

local setlocal = vim.opt_local

setlocal.expandtab = true
-- setlocal.tabstop = 4
setlocal.softtabstop = 4
setlocal.shiftwidth = 4

vim.treesitter.start()

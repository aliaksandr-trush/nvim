-- [[ Basic Keymaps ]]

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

vim.keymap.set('n', '<esc>', '<cmd>:nohl<cr>')
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Escape Escape exits terminal mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [Setup keys for maps iteraction ]
vim.keymap.set('n', '<A-t>', vim.cmd.tabnew, { desc = 'Open new tab' })
vim.keymap.set('n', '<A-x>', vim.cmd.tabclose, { desc = "Close tab" })
vim.keymap.set('n', '<A-n>', vim.cmd.tabn, { desc = "Next tab" })
vim.keymap.set('n', '<A-p>', vim.cmd.tabp, { desc = "Previous tab" })

-- [[ Basic Keymaps ]]

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true })

vim.keymap.set('n', '<M-l>', '<C-w>5>')
vim.keymap.set('n', '<M-h>', '<C-w>5<')
vim.keymap.set('n', '<M-k>', '<C-w>+')
vim.keymap.set('n', '<M-j>', '<C-w>-')

vim.keymap.set('n', '<C-Right>', '<C-w>5>')
vim.keymap.set('n', '<C-Left>', '<C-w>5<')
vim.keymap.set('n', '<C-Up>', '<C-w>+')
vim.keymap.set('n', '<C-Down>', '<C-w>-')

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

vim.keymap.set('n', '<esc>', '<cmd>:nohl<cr>')
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Escape Escape exits terminal mode' })
vim.keymap.set('n', '<leader>tt', '<cmd>:vsplit term://bash<cr>a', { desc = 'Open terminal' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [Setup keys for maps iteraction ]
vim.keymap.set('n', '<A-t>', vim.cmd.tabnew, { desc = 'Open new tab' })
vim.keymap.set('n', '<A-x>', vim.cmd.tabclose, { desc = "Close tab" })
vim.keymap.set('n', '<A-n>', vim.cmd.tabn, { desc = "Next tab" })
vim.keymap.set('n', '<A-p>', vim.cmd.tabp, { desc = "Previous tab" })

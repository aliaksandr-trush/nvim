vim.o.matchpairs = '(:),{:},[:],<:>'

vim.o.showtabline = 1
vim.o.cursorline = true
vim.o.so = 5

-- Set highlight on search
vim.o.hlsearch = true
vim.o.ignorecase = true

-- Make line numbers default
vim.wo.number = true
-- vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
vim.o.swapfile = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes:1'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.opt.inccommand = 'split'

vim.o.termguicolors = true
-- vim.o.colorcolumn = '80'
vim.o.winborder = 'rounded'

vim.o.splitbelow = true
vim.o.splitright = true

vim.diagnostic.config {
  virtual_text = {
    severity = {
      max = vim.diagnostic.severity.WARN,
    },
  },
  virtual_lines = {
    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
  },
}

-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldlevelstart = 3

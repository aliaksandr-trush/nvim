return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          buffers = {
            mappings = {
              i = {
                ['<C-d>'] = 'delete_buffer',
              },
              n = {
                ['d'] = 'delete_buffer',
              },
            },
          },
        },
        defaults = {
          -- path_display = { 'smart' },
          border = true,
          preview = {
            timeout = 500,
          },
          mappings = {
            i = {
              ['<C-s>'] = 'select_horizontal',
              -- ['<C-l>'] = require('telescope.actions').send_to_loclist + require('telescope.actions').open_loclist,
              -- ["<Tab>"] = require('telescope.actions').toggle_selection,
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          fzf = {},
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'noice')
      pcall(require('telescope').load_extension, 'lazygit')
      pcall(require('telescope').load_extension, 'fidget')
      -- pcall(require('telescope').load_extension, 'frecency')
      --
      -- See `:help telescope.builtin`
      -- local builtin = require 'telescope.builtin'

      -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Find recently opened files' })
      -- -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      --
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      -- vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })
      -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      -- vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
      -- vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = '[S]earch [C]olorscheme' })
      -- vim.keymap.set('n', '<leader>sq', builtin.quickfixhistory, { desc = '[S]earch [Q]uickfixhistory' })
      --
      -- vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
      --
      -- vim.keymap.set('n', '<leader>s/', function()
      --   builtin.live_grep {
      --     grep_open_files = true,
      --     prompt_title = 'Live Grep in Open Files',
      --   }
      -- end, { desc = '[S]earch [/] in Open Files' })
    end,
  },
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function()
      local builtin = require 'fzf-lua'
      builtin.setup { fzf_colors = true }

      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Find recently opened files' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })
      vim.keymap.set('n', '<leader>gh', builtin.git_bcommits, { desc = '[G]it [B]uffer Commits' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
      vim.keymap.set('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_cword, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.lsp_document_diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
      vim.keymap.set('n', '<leader>sc', builtin.colorschemes, { desc = '[S]earch [C]olorscheme' })
      vim.keymap.set('n', '<leader>sq', builtin.quickfix_stack, { desc = '[S]earch [Q]uickfixhistory' })

      vim.keymap.set('n', '<leader>/', builtin.lgrep_curbuf, { desc = '[/] Fuzzily search in current buffer' })

      -- vim.keymap.set('n', '<leader>u', builtin.undotree, { desc = 'Undo Tree' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
          end

          nmap('grr', builtin.lsp_references, 'References')
          nmap('grd', builtin.lsp_definitions, 'Definition')
          -- nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          nmap('gri', builtin.lsp_implementations, 'Implementation')
          nmap('grt', builtin.lsp_typedefs, 'Type [D]efinition')
          nmap('gO', builtin.lsp_document_symbols, 'Document Symbols')
          nmap('gW', builtin.lsp_workspace_symbols, '[W]orkspace [S]ymbols')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('grwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          nmap('grwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          nmap('grwl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')
        end,
      })
    end,
  },
}

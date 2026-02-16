return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = { ui = { border = 'rounded' } },
    },
    -- 'williamboman/mason-lspconfig.nvim',

    -- Status updates for LSP
    {
      'j-hui/fidget.nvim',
      opts = {
        -- notification = {
        --     window = {
        --         border = 'rounded',
        --     },
        -- },
      },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {

      callback = function(event)
        vim.keymap.set('n', 'grf', vim.lsp.buf.format, { buffer = event.buf, desc = '[C]ode [F]ormat' })

        if vim.lsp.inlay_hint then
          vim.keymap.set('n', '<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
          end, { buffer = event.buf, desc = '[T]oggle [H]ints' })
        end

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end,
    })

    local servers = {
      'clangd',
      'gopls',
      -- 'basedpyright',
      'ty',
      'ruff',
      'rust_analyzer',
      'lua_ls',
      -- 'zuban',
      'textlsp',
      -- 'copilot',
      'ruby_lsp',
      'just',
    }

    vim.lsp.enable(servers)
  end,
}

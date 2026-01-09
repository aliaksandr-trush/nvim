-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  enabled = true,
  event = 'BufReadPost',
  dependencies = {
    -- Creates a beautiful debugger UI
    {
      'rcarriga/nvim-dap-ui',
      dependencies = { 'nvim-neotest/nvim-nio' },
      opts = {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        -- controls = {
        --   icons = {
        --     pause = '⏸',
        --     play = '▶',
        --     step_into = '⏎',
        --     step_over = '⏭',
        --     step_out = '⏮',
        --     step_back = 'b',
        --     run_last = '▶▶',
        --     terminate = '⏹',
        --     disconnect = '⏏',
        --   },
        -- },
      },
    },

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = {},
    },
    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'HiPhish/debugpy.nvim',
    'vadimcn/codelldb',
    -- 'microsoft/vscode-cpptools',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'codelldb',
        'debugpy',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
    vim.keymap.set('n', '<F9>', dap.restart, { desc = 'Debug: Restart' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    vim.keymap.set({ 'n', 'v' }, '<leader>?', function()
      dapui.eval(nil, { enter = true })
    end)

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()

    dap.adapters.codelldb = {
      type = 'executable',
      command = 'codelldb',
    }

    -- dap.adapters.codelldb = {
    --     type = 'server',
    --     port = '${port}',
    --     executable = {
    --         command = 'codelldb',
    --         args = { '--port', '${port}' },
    --     },
    -- }
    -- dap.adapters.debugpy = {
    --     type = 'executable',
    --     command = 'debugpy-adapter',
    --     args = {},
    -- }
    --
    -- dap.configurations.python = {
    --     {
    --         type = 'debugpy',
    --         request = 'launch',
    --         name = 'Launch file',
    --         program = '${file}', -- This configuration will launch the current file if used.
    --         cwd = '${workspaceFolder}',
    --         stopOnEntry = false,
    --     },
    -- }

    dap.configurations.rust = {
      {
        name = 'Rust debug',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        -- cargo = {
        --   args = { "test", "--no-rerun", "--lib" }
        -- },
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        showDisassembly = 'never',
      },
    }
  end,
}

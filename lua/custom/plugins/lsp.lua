vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
    end

    nmap('grr', require('telescope.builtin').lsp_references, 'References')
    nmap('grd', require('telescope.builtin').lsp_definitions, 'Definition')
    nmap('gri', require('telescope.builtin').lsp_implementations, 'Implementation')
    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('grt', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('gO', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
    nmap('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('grwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('grwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('grwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    nmap('grf', vim.lsp.buf.format, '[C]ode [F]ormat')

    if vim.lsp.inlay_hint then
      nmap('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
      end, '[T]oggle [H]ints')
    end

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end,
})

return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = { ui = { border = 'rounded', } },
    },
    -- 'williamboman/mason-lspconfig.nvim',

    -- Status updates for LSP
    { 'j-hui/fidget.nvim',    opts = {} },

  },

  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
  -- capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
  -- Add folding capabilities required by ufo.nvim
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true,
  -- }
  -- end,
}

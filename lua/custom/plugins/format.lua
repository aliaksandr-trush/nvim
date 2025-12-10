return {
  'stevearc/conform.nvim',
  enabled = false,
  event = 'BufWritePre',
  opts = {
    -- notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt' },
      -- Conform will run multiple formatters sequentially
      python = { 'ruff_format', 'ruff_organize_imports' },
    },
    format_after_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}

return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  enabled = false,
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          build = 'make install_jsregexp',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    -- {
    --   'garymjr/nvim-snippets',
    --   opts = { friendly_snippets = true },
    --   dependencies = {
    --     -- Adds a number of user-friendly snippets
    --     'rafamadriz/friendly-snippets',
    --   }
    -- },

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',

    -- Icons
    'onsails/lspkind-nvim',
  },
  config = function()
    -- [[ Configure nvim-cmp ]]
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
          -- vim.snippet.expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-x>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
          -- vim.snippet.jump(1)
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
          -- vim.snippet.jump(-1)
        end, { 'i', 's' }),
        -- ['<Tab>'] = {
        --   c = function(_)
        --     if cmp.visible() then
        --       if #cmp.get_entries() == 1 then
        --         cmp.confirm({ select = true })
        --       else
        --         cmp.select_next_item()
        --       end
        --     else
        --       cmp.complete()
        --       if #cmp.get_entries() == 1 then
        --         cmp.confirm({ select = true })
        --       end
        --     end
        --   end,
        -- }
      },
      sources = {
        { name = 'lazydev' },
        { name = 'codeium' },
        { name = 'luasnip',  max_item_count = 5 },
        -- { name = 'snippets', max_item_count = 2 },
        { name = 'nvim_lsp', max_item_count = 10 },
        { name = 'path',     max_item_count = 5 },
        {
          name = 'buffer',
          max_item_count = 5,
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        expandable_indicator = true,
        format = require('lspkind').cmp_format {
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Codeium = '' },
          menu = {
            buffer = '[buf]',
            nvim_lsp = '[LSP]',
            lazydev = '[api]',
            path = '[path]',
            luasnip = '[snip]',
            codeium = '[Codeium]',
            -- snippets = "[snip]",
          },
        },
      },
    }

    cmp.setup.cmdline({ '/', '?' }, {
      -- mapping = cmp.mapping.preset.cmdline(),
      mapping = {
        ['<C-n>'] = { c = cmp.mapping.select_next_item() },
        ['<C-p>'] = { c = cmp.mapping.select_prev_item() },
      },
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      sources = cmp.config.sources {
        { name = 'cmdline' },
        { name = 'path' },
      },
    })

    cmp.setup.filetype({ '', 'oil' }, {
      sources = {
        { name = 'buffer' },
        { name = 'path' },
      },
    })
  end,
}

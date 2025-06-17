return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  dependencies = {
    'rafamadriz/friendly-snippets',

    {
      'Exafunction/codeium.nvim',
      opts = {
        enable_chat = true,
        enable_local_search = true,
        enable_index_service = true,
        enable_cmp_source = false,
      },
    },
    {
      'folke/lazydev.nvim',
      opts = {
        library = {
          'luvit-meta/library',
          -- { path = "wezterm-types", mods = { "wezterm" } },
        },
      },
      ft = 'lua',
      dependencies = {
        -- 'justinsgithub/wezterm-types',
        { 'Bilal2453/luvit-meta' }, -- optional `vim.uv` typings
      },
    },
  },

  -- use a release tag to download pre-built binaries
  version = 'v1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },

    signature = { enabled = true },

    -- appearance = {
      -- use_nvim_cmp_as_default = true,
      -- nerd_font_variant = 'mono',
    -- },
    completion = {
      list = {
        selection = {
          -- selection = "manual",
          -- selection = function (ctx)
          --   return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect'
          -- end
            preselect = function(ctx)
              return ctx.mode ~= 'cmdline' and not require('blink.cmp').snippet_active({ direction = 1 })
            end,
            auto_insert = function(ctx) return ctx.mode == 'cmdline' end,
        },
      },
      menu = {
        draw = {
          columns = {
            {'kind_icon'},
            {'label', 'label_description', gap = 1 },
          },

          -- components = {
          --   kind_icon = {
          --     text = function(ctx)
          --       if ctx.source_name == 'Codeium' then
          --         return ''
          --       end
          --       return require('lspkind').symbolic(ctx.kind, { mode = 'symbol' })
          --     end
          --   },
          -- },
        },
      },
      -- documentation = {
      --   auto_show = true,
      -- },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium'},
      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
        mysql = { 'snippets', 'dadbod', 'buffer' },
        plsql = { 'snippets', 'dadbod', 'buffer' },
        lua = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'codeium' },
        org = { 'lsp', 'orgmode' },
      },
      providers = {
        dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
        orgmode = {
          name = 'Orgmode',
          module = 'orgmode.org.autocompletion.blink',
          fallbacks = { 'buffer' },
        },
        codeium = {
          name = 'Codeium',
          module = 'codeium.blink',
          async = true,
          enabled = function()
            return not vim.tbl_contains({ 'oil', '' }, vim.bo.filetype)
          end,
        },
      },
    },
  },
  -- allows extending the enabled_providers array elsewhere in your config
  -- without having to redefining it
  opts_extend = { 'sources.completion.enabled_providers' },
}


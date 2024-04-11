return {
  {
    'Saecki/crates.nvim',
    event = 'BufRead Cargo.toml', -- Carica su BufRead Cargo.toml
    config = function()
      require('crates').setup {
        src = {
          cmp = { enabled = true }, -- Abilita l'integrazione con nvim-cmp
        },
      }

      -- Configurazione delle keymap qui
      local crates = require 'crates'
      local map_opts = { silent = true }

      vim.keymap.set('n', '<leader>ct', crates.toggle, vim.tbl_extend('force', map_opts, { desc = 'Toggle Crate' }))
      vim.keymap.set('n', '<leader>cr', crates.reload, vim.tbl_extend('force', map_opts, { desc = 'Reload Crate' }))
      vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, vim.tbl_extend('force', map_opts, { desc = 'Show Versions' }))
      vim.keymap.set('n', '<leader>cf', crates.show_features_popup, vim.tbl_extend('force', map_opts, { desc = 'Show Features' }))
      vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, vim.tbl_extend('force', map_opts, { desc = 'Show Dependencies' }))
      vim.keymap.set('n', '<leader>cu', crates.update_crate, vim.tbl_extend('force', map_opts, { desc = 'Update Crate' }))
      vim.keymap.set('v', '<leader>cu', crates.update_crates, vim.tbl_extend('force', map_opts, { desc = 'Update Crates' }))
      vim.keymap.set('n', '<leader>ca', crates.update_all_crates, vim.tbl_extend('force', map_opts, { desc = 'Update All Crates' }))
      vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, vim.tbl_extend('force', map_opts, { desc = 'Upgrade Crate' }))
      vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, vim.tbl_extend('force', map_opts, { desc = 'Upgrade Crates' }))
      vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, vim.tbl_extend('force', map_opts, { desc = 'Upgrade All Crates' }))
      vim.keymap.set('n', '<leader>cx', crates.expand_plain_crate_to_inline_table, vim.tbl_extend('force', map_opts, { desc = 'Expand Crate' }))
      vim.keymap.set('n', '<leader>cX', crates.extract_crate_into_table, vim.tbl_extend('force', map_opts, { desc = 'Extract Crate' }))
      vim.keymap.set('n', '<leader>cH', crates.open_homepage, vim.tbl_extend('force', map_opts, { desc = 'Open Homepage' }))
      vim.keymap.set('n', '<leader>cR', crates.open_repository, vim.tbl_extend('force', map_opts, { desc = 'Open Repository' }))
      vim.keymap.set('n', '<leader>cD', crates.open_documentation, vim.tbl_extend('force', map_opts, { desc = 'Open Documentation' }))
      vim.keymap.set('n', '<leader>cC', crates.open_crates_io, vim.tbl_extend('force', map_opts, { desc = 'Open Crates.io' }))
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'ron', 'rust', 'toml' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        rust_analyzer = {},
        taplo = {
          keys = {
            {
              'K',
              function()
                if vim.fn.expand '%:t' == 'Cargo.toml' and require('crates').popup_available() then
                  require('crates').show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = 'Show Crate Documentation',
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'codelldb' })
    end,
  },
  {
    'nvim-neotest/neotest',
    optional = true,
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      vim.list_extend(opts.adapters, {
        require 'rustaceanvim.neotest',
      })
    end,
  },
}

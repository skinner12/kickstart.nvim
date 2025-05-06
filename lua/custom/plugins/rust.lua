return {
  -- Crates.nvim con LSP interno
  {
    'Saecki/crates.nvim',
    event = 'BufRead Cargo.toml',
    opts = {
      lsp = {
        enabled = true, -- avvia il language-server di crates.nvim
        actions = true, -- registra code-actions (update/upgrade)
        completion = true, -- completions via LSP
        hover = true, -- hover popup sulle versioni
      },
    },
  },

  -- Treesitter per ron, rust, toml
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'ron', 'rust', 'toml' })
    end,
  },

  -- LSPconfig: rust_analyzer + taplo
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

  -- Mason per codelldb
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'codelldb' })
    end,
  },

  -- Neotest con adapter Rust
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

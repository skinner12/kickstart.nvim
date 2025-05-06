return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      -- Setup toggleterm with no default mapping
      require('toggleterm').setup {
        -- preserve terminal size and scrollback when toggling
        persist_size = true,
        -- disable the built-in open_mapping so we can define our own
        open_mapping = nil,
        -- default floating window options (used by our float terminal below)
        float_opts = {
          border = 'curved',
          width = function()
            return math.floor(vim.o.columns * 0.8)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.7)
          end,
        },
      }

      local Terminal = require('toggleterm.terminal').Terminal

      -- define a floating terminal instance
      local float_term = Terminal:new {
        direction = 'float',
      }

      -- define a horizontal split terminal (30% of total lines)
      local split_term = Terminal:new {
        direction = 'horizontal',
        size = function()
          return math.floor(vim.o.lines * 0.3)
        end,
      }

      -- <C-\> toggles the floating terminal
      vim.keymap.set('n', '<C-\\>', function()
        float_term:toggle()
      end, { desc = 'Toggle floating terminal' })

      -- <leader>tt toggles the horizontal split terminal
      vim.keymap.set('n', '<leader>tt', function()
        split_term:toggle()
      end, { desc = 'Toggle split terminal' })
    end,
  },
}

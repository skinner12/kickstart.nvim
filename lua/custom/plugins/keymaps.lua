return {
  -- Select all
  vim.keymap.set('n', '<C-a>', 'gg<S-v>G'),

  -- Increment/decrement
  vim.keymap.set('n', '+', '<C-a>'),
  vim.keymap.set('n', '-', '<C-x>'),

  -- Delete a word backwards
  vim.keymap.set('n', 'dw', 'vb"_d'),

  -- Move text up and down
  vim.keymap.set('v', '<A-j>', ':m .+1<CR>=='),
  vim.keymap.set('v', '<A-k>', ':m .-2<CR>=='),
  vim.keymap.set('v', 'p', '"_dP'),

  -- Visual Block --
  -- Move text up and down
  vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv"),
  vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv"),
  vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv"),
  vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv"),

  -- LSP --
  vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>'),
  vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>'),

  vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, {}), -- File Explorer
  vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {}),

  -- vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle),

  -- ThePrimeagen
  vim.keymap.set('x', '<leader>p', '"_dp'), -- paste and replace and let the word into buffer

  vim.keymap.set('n', 'J', 'mzJ`z'), -- Delete and set curson in the begin
  vim.keymap.set('n', '<C-d>', '<C-d>zz'), -- Just and let cursor in the middle of the page
  vim.keymap.set('n', '<C-u>', '<C-u>zz'),
  vim.keymap.set('n', 'n', 'nzzzv'), -- Move after search and set cursor in the middle
  vim.keymap.set('n', 'N', 'nzzzv'),

  vim.keymap.set('n', '<leader>y', '"+y'), -- Copy to clipboard
  vim.keymap.set('v', '<leader>y', '"+y'),
  vim.keymap.set('n', '<leader>Y', '"+y'),

  vim.keymap.set('n', '<leader>fc', function()
    -- require("vim.lsp.buf").format({ timeout_ms = 2000 })
    vim.lsp.buf.format { timeout_ms = 2000 }
  end, { desc = 'Format code' }),
}

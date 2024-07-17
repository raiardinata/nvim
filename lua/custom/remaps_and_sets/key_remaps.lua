return {
  vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Go back to explorer' }),

  vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to clipboard' }),
  vim.keymap.set('n', '<leader>Y', [["+Y]]),

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Drag blocked row to up' }),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Drag blocked row to down' }),
  vim.keymap.set('n', 'J', 'mzJ`z'),
  vim.keymap.set('n', '<C-d>', '<C-d>zz'),
  vim.keymap.set('n', '<C-u>', '<C-u>zz'),
}

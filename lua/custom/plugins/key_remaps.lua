-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Go back to explorer' }),

  vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to clipboard' }),
  vim.keymap.set('n', '<leader>Y', [["+Y]]),

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Drag blocked row to up' }),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Drag blocked row to down' }),
}

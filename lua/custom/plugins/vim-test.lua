return {
  'vim-test/vim-test',
  dependencies = {
    '/preservim/vimux',
  },
  vim.keymap.set('n', 'leader>t', ':TestNearest<CR>'),
  vim.keymap.set('n', '<leader>', ':TestFile<CR>'),
  vim.keymap.set('n', '<leader>', ':TestSuite<CR>'),
  vim.keymap.set('n', '<leader>', ':TestLast<CR>'),
  vim.keymap.set('n', '<leader>', ':TestVisit<CR>'),
  vim.cmd "let test#strategy = 'vimux'",
}

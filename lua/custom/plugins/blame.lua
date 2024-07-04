return {
  'FabijanZulj/blame.nvim',
  -- override current mapping of git blame line to show git blame virtual
  vim.keymap.set('n', '<leader>gb', '<Cmd>BlameToggle virtual<CR>', { desc = 'Git Blame' }),
  config = function()
    require('blame').setup()
  end,
}

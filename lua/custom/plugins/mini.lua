return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Example minimal setup
    require('mini.ai').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()
  end,
}

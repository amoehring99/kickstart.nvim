return {
  {
    'lervag/vimtex',
    init = function()
      -- Use init for configuration, don't use the more common "config".
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_callback_prograph = 'wsl nvim'
      vim.g.maplocalleader = ','
      -- open quickfix window only if there are errors
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_view_general_viewer = 'sioyek'
      -- vimtex fold
      -- From: https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt#L4671-L4713
      -- vim.o.foldmethod = 'expr'
      -- vim.o.foldexpr = 'vimtex#fold#level(v:lnum)'
      -- vim.o.foldtext = 'vimtex#fold#text()'
      -- -- I like to see at least the content of the sections upon opening
      -- vim.o.foldlevel = 2
    end,
  },
}

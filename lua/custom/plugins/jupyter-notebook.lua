return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    opts = {
      rocks = { 'magick' },
    },
  },
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      { 'n', '<localleader>mi', '<cmd>MoltenInit<CR>', desc = 'Initialize the plugin' },
      { 'n', '<localleader>me', '<cmd>MoltenEvaluateOperator<CR>', desc = 'run operator selection' },
      { 'n', '<localleader>ml', '<cmd>MoltenEvaluateLine<CR>', desc = 'evaluate line' },
      { 'n', '<localleader>mr', '<cmd>MoltenReevaluateCell<CR>', desc = 're-evaluate cell' },
      { 'v', '<localleader>mv', '<cmd><C-u>MoltenEvaluateVisual<CR>gv', desc = 'evaluate visual selection' },
      { 'n', '<localleader>md', '<cmd>MoltenDelete<CR>', desc = 'molten delete cell' },
      { 'n', '<localleader>mh', '<cmd>MoltenHideOutput<CR>', desc = 'hide output' },
      { 'n', '<localleader>ms', '<cmd>noautocmd MoltenEnterOutput<CR>', desc = 'show/enter output' },
    },
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    '3rd/image.nvim',
    opts = {
      backend = 'kitty', -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
    },
  },
}

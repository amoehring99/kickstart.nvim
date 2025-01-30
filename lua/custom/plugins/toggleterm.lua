return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      -- Set up toggleterm.nvim
      require('toggleterm').setup {
        size = 20, -- Adjust the size of the terminal window
        open_mapping = [[<c-\>]], -- Press Ctrl + \ to toggle the terminal
        direction = 'float', -- This makes the terminal open as a floating window
        float_opts = {
          border = 'single', -- Border style: 'single', 'double', 'shadow', etc.
          winblend = 3, -- Window transparency (blend level)
        },
      }

      -- Keybinding to toggle the floating terminal
      vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true, desc = '[t]oggle[t]erm' })
    end,
  },
}

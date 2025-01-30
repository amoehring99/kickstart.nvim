return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      -- Set up toggleterm.nvim with fish shell
      require('toggleterm').setup {
        size = 20, -- Adjust the size of the terminal window
        open_mapping = [[<c-\>]], -- Press Ctrl + \ to toggle the terminal
        direction = 'float', -- This makes the terminal open as a floating window
        float_opts = {
          border = 'single', -- Border style: 'single', 'double', 'shadow', etc.
          winblend = 3, -- Window transparency (blend level)
        },
        shell = '/usr/bin/fish', -- Set fish as the default shell
      }

      -- Keybinding to toggle the floating terminal
      vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true, desc = '[t]oggle[t]erm' })

      -- Function to set terminal keymaps
      _G.set_terminal_keymaps = function()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- Set the terminal keymaps when opening a terminal
      vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'
    end,
  },
}

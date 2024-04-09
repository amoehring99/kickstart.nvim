-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('i', 'jk', '<esc>')

-- neo-tree keybindings

vim.keymap.set('n', '<tab>', '<Cmd>Neotree toggle filesystem reveal left<CR>')

return {}

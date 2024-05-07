-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.g.python3_host_prog = '~/.virtualenvs/nvim/bin/python3.12'

-- use 4 spaces instead of tabs
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4

vim.keymap.set('i', 'jk', '<esc>')

-- neo-tree keybindings

vim.keymap.set('n', '<tab>', '<Cmd>Neotree toggle filesystem reveal left<CR>')

-- -- Define keybinding for entering visual mode because it doesnt bind to v by default for some reason
-- local visual_mode_key = 'v'
-- -- Map the custom keybinding to enter visual mode
-- vim.api.nvim_set_keymap('n', visual_mode_key, ':normal! v<CR>', { noremap = true, silent = true })

--autocommands
local autocmd_group = vim.api.nvim_create_augroup('Custom auto-commands', { clear = true })

--run linter for vhdl (vsg) when saving a .vhd file
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.vhd' },
  desc = 'Auto-format VHDL files after saving',
  callback = function()
    local file_name = vim.api.nvim_buf_get_name(0) -- Get file name of file in current buffer
    vim.cmd(':!vsg --fix -f ' .. file_name)
  end,
  group = autocmd_group,
})

-- Enable tabs for Makefiles
vim.cmd 'autocmd FileType make setlocal noexpandtab'

return {}

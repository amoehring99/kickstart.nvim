-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/nvim/bin/python3.12'

-- use 4 spaces instead of tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.keymap.set('i', 'jk', '<esc>')

-- neo-tree keybindings

vim.keymap.set('n', '<tab>', '<Cmd>Neotree toggle filesystem reveal left<CR>')

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

-- Global config: underline always, virtual_text off by default
vim.diagnostic.config {
  virtual_text = false, -- don't show virtual text by default
  underline = true, -- always underline diagnostics
  signs = true, -- enable diagnostic signs
  update_in_insert = false,
  severity_sort = true, -- optional: sort diagnostics by severity
}
-- Configure diagnostic signs
vim.diagnostic.config {
  signs = {
    Error = { text = '✖', texthl = 'DiagnosticSignError' },
    Warn = { text = '!', texthl = 'DiagnosticSignWarn' },
    Info = { text = 'i', texthl = 'DiagnosticSignInfo' },
    Hint = { text = '➤', texthl = 'DiagnosticSignHint' },
  },
}

-- Enable tabs for Makefiles
vim.cmd 'autocmd FileType make setlocal noexpandtab'

return {}

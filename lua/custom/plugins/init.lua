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

-- 1. Global config: underline always, virtual_text off by default
vim.diagnostic.config {
  virtual_text = false, -- don't show by default
  underline = true, -- always underline
  signs = true,
  update_in_insert = false,
}

-- 2. Namespace for temporary virtual text
local ns = vim.api.nvim_create_namespace 'cursor_line_diagnostics'

-- 3. Autocmd: Show virtual text only on the current line
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorMoved' }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1

    -- Clear old virtual text in our namespace
    vim.diagnostic.hide(ns, bufnr)

    -- Get diagnostics for the current line
    local line_diags = vim.diagnostic.get(bufnr, { lnum = cursor_line })
    if #line_diags == 0 then
      return
    end

    -- Show them with virtual text only for this line
    vim.diagnostic.show(ns, bufnr, line_diags, {
      virtual_text = {
        prefix = '● ',
        spacing = 4,
      },
      underline = false, -- already handled globally
    })
  end,
})
vim.fn.sign_define('DiagnosticSignError', { text = '✖', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = 'i', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '➤', texthl = 'DiagnosticSignHint' })

-- Enable tabs for Makefiles
vim.cmd 'autocmd FileType make setlocal noexpandtab'

return {}

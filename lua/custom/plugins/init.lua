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
-- vim.keymap.set('n', '<tab>', '<Cmd>Neotree toggle filesystem reveal left<CR>')
vim.keymap.set('n', '<tab>', '<Cmd>Ranger<CR>')

vim.diagnostic.config {
  virtual_text = false,
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✖',
      [vim.diagnostic.severity.WARN] = '!',
      [vim.diagnostic.severity.INFO] = 'i',
      [vim.diagnostic.severity.HINT] = '➤',
    },
  },
  update_in_insert = false,
  severity_sort = true,
}

local ns = vim.api.nvim_create_namespace 'line_diagnostics'

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorMoved' }, {
  callback = function()
    local bufnr = 0
    local line = vim.fn.line '.' - 1
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    local diags = vim.diagnostic.get(bufnr, { lnum = line })
    if #diags == 0 then
      return
    end

    local chunks = {}
    for _, d in ipairs(diags) do
      local sym = ({
        [vim.diagnostic.severity.ERROR] = '✖',
        [vim.diagnostic.severity.WARN] = '!',
        [vim.diagnostic.severity.INFO] = 'i',
        [vim.diagnostic.severity.HINT] = '➤',
      })[d.severity] or ''

      local hl = ({
        [vim.diagnostic.severity.ERROR] = 'DiagnosticVirtualTextError',
        [vim.diagnostic.severity.WARN] = 'DiagnosticVirtualTextWarn',
        [vim.diagnostic.severity.INFO] = 'DiagnosticVirtualTextInfo',
        [vim.diagnostic.severity.HINT] = 'DiagnosticVirtualTextHint',
      })[d.severity] or 'DiagnosticVirtualTextInfo'

      table.insert(chunks, { sym .. ' ' .. d.message, hl })
    end

    vim.api.nvim_buf_set_extmark(bufnr, ns, line, 0, {
      virt_text = chunks,
      virt_text_pos = 'eol',
      hl_mode = 'combine',
    })
  end,
})

-- Enable tabs for Makefiles
vim.cmd 'autocmd FileType make setlocal noexpandtab'

return {}

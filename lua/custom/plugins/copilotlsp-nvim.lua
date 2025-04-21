return {
  -- Copilot‑LSP plugin
  {
    'copilotlsp-nvim/copilot-lsp',
    init = function()
      vim.g.copilot_nes_debounce = 500
      vim.lsp.enable 'copilot'
      vim.keymap.set('n', '<Tab>', function()
        require('copilot-lsp.nes').apply_pending_nes()
      end)
    end,
  },

  -- nvim-cmp config with super‑tab style + Copilot‑LSP integration
  {
    'hrsh7th/nvim-cmp',
    opts = {
      mapping = {
        -- use the “super‑tab” preset as base
        ['<Tab>'] = {
          function(cmp)
            -- if Copilot‑LSP has a pending suggestion, apply it
            if vim.b[vim.api.nvim_get_current_buf()].nes_state then
              cmp.hide()
              return require('copilot-lsp.nes').apply_pending_nes()
            end
            -- otherwise, fall back to normal snippet/completion actions
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback',
        },
        -- you can add more mappings here if you like
      },
      -- optionally preserve other cmp options here (sources, formatting, etc.)
    },
  },
}

return {
  {
    'github/copilot.vim',
    lazy = false, -- Ensure Copilot is always loaded but disabled by default
    init = function()
      vim.g.copilot_enabled = false -- Disable Copilot on startup
    end,
    keys = {
      {
        '<leader>gc',
        function()
          local status = vim.fn['copilot#Enabled']()
          if status == 1 then
            vim.cmd 'Copilot disable'
            print 'Copilot Disabled'
          else
            vim.cmd 'Copilot enable'
            print 'Copilot Enabled'
          end
        end,
        desc = '[G]ithub [C]opilot Toggle',
      },
    },
  },
}

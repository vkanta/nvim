return {
  -- Core Copilot client (Lua)
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot', -- lazy-load on :Copilot
    event = 'InsertEnter',
    opts = {
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_next = ']]',
          jump_prev = '[[',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
          close = '<C-]>',
        },
      },

      suggestion = {
        enabled = true,
        auto_trigger = true, -- set false if you prefer manual
        debounce = 75,
        keymap = {
          accept = '<C-l>',
          accept_word = '<M-l>',
          accept_line = '<M-;>',
          next = '<C-k>',
          prev = '<C-j>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        markdown = true,
        help = false,
        ['*'] = true, -- enable everywhere unless overridden
      },
    },
    config = function(_, opts)
      require('copilot').setup(opts)

      -- Handy toggles
      vim.keymap.set('n', '<leader>tc', function()
        local s = require 'copilot.suggestion'
        if s.is_visible() then
          s.dismiss()
        end
        vim.g.copilot_enabled = not vim.g.copilot_enabled
        if vim.g.copilot_enabled then
          vim.notify 'Copilot: enabled'
          s.auto_trigger(true)
        else
          vim.notify 'Copilot: disabled'
          s.auto_trigger(false)
        end
      end, { desc = 'Toggle Copilot' })

      vim.keymap.set('n', '<leader>cp', '<cmd>Copilot panel<CR>', { desc = 'Copilot Panel' })
      vim.keymap.set('n', '<leader>cs', '<cmd>Copilot status<CR>', { desc = 'Copilot Status' })
    end,
  },
}

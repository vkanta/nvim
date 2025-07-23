return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
  config = function()
    require('nvim-tree').setup {
      view = { width = 30, side = 'left' },
      actions = { open_file = { resize_window = true } },
    }
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' })
  end,
}

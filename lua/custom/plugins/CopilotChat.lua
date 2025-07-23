return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- required Copilot base
      { 'nvim-lua/plenary.nvim' }, -- async utilities
      { 'nvim-telescope/telescope.nvim' }, -- optional (for selecting prompts/models)
    },
    build = 'make tiktoken', -- on Linux/macOS for token counting
    cmd = 'CopilotChat', -- lazy load on chat command
    config = function()
      require('CopilotChat').setup {
        auto_insert_mode = true,
        window = { layout = 'float', width = 0.4 },
      }
    end,
  },
}

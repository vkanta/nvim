
# 🧠 GitHub Copilot + Kickstart.nvim Setup

This guide explains how to activate GitHub Copilot in Neovim using the `copilot.lua` plugin with the [`kickstart.nvim`](https://github.com/nvim-lua/kickstart.nvim) base config.

---

## ✅ Prerequisites

- Neovim 0.11-dev (0.9+ recommended)
- GitHub Copilot subscription
- Nerd Font recommended (optional)
- Internet access

---

## 📦 Plugin Configuration (already included in `init.lua`)

```lua
{
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        ["*"] = true, -- Enable for all filetypes
      },
    })
  end,
}


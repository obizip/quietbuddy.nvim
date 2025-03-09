# quietbuddy.nvim

## [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- Lua
{
  "obizip/quietbuddy.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("quietbuddy")
  end,
  dependencies = {
    "tjdevries/colorbuddy.nvim",
  },
}
```

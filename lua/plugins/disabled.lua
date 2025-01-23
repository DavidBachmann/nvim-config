-- Disabled AstroNvim core plugins:
return {
  -- I don't use snippets
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  -- I use nvim in the terminal, not the other way around
  { "akinsho/toggleterm.nvim", enabled = false },
  -- I don't use splits
  { "nvim-window-picker", enabled = false },
  -- I don't use sessions
  { "stevearc/resession.nvim", enabled = false },
  -- Don't hijack jk and jj
  { "max397574/better-escape.nvim", enabled = false },
}

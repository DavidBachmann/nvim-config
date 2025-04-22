return {
  "comfysage/cuddlefish.nvim",
  config = function()
    require("cuddlefish").setup {
      theme = {
        variant = "spring",
        accent = "violet",
      },
      editor = {
        transparent_background = false,
      },
      style = {
        tabline = { "reverse" },
        search = { "italic", "reverse" },
        incsearch = { "italic", "reverse" },
        types = { "italic" },
        keyword = { "italic" },
        comment = { "italic" },
      },
    }

    vim.cmd.colorscheme [[cuddlefish]]
  end,
}

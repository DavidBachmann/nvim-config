require("telescope").setup {
  defaults = {
    prompt_prefix = "» ",
    selection_caret = "» ",
    entry_prefix = "  ",
    initial_mode = "normal",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { mirror = false, preview_width = 0.5 },
      vertical = { mirror = false },
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
  },
}

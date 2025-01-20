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

local function visual_paste_without_yank()
  vim.fn.setreg("x", vim.fn.getreg "*")
  vim.api.nvim_paste(vim.fn.getreg "*", {}, -1)
  vim.fn.setreg("*", vim.fn.getreg "x")
end
vim.keymap.set("v", "p", visual_paste_without_yank, { noremap = true, silent = true })

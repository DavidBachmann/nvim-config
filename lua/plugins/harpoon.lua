return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local harpoon = require "harpoon"

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>at", function() harpoon:list():add() end, { desc = "Add this one" })
    vim.keymap.set("n", "<leader>ac", function() harpoon:list():clear() end, { desc = "Clear all" })

    vim.keymap.set(
      "n",
      "<leader>aa",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon list" }
    )
  end,
}

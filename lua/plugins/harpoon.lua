return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local harpoon = require "harpoon"

    local make_finder = function(items)
      local paths = {}
      for _, item in ipairs(items) do
        table.insert(paths, item.value)
      end

      return require("telescope.finders").new_table {
        results = paths,
      }
    end

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>at", function() harpoon:list():add() end, { desc = "Add this one" })
    vim.keymap.set("n", "<leader>ac", function() harpoon:list():clear() end, { desc = "Clear all" })

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local finder = make_finder(harpoon_files.items)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = finder,
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
          attach_mappings = function(prompt_buffer_number, map)
            map("n", "dd", function()
              local state = require "telescope.actions.state"
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_buffer_number)

              harpoon:list():remove_at(selected_entry.index)
              current_picker:refresh(make_finder(harpoon:list().items))
            end)

            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<leader>aa", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon list" })
    vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
  end,
}

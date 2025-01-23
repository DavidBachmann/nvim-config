return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.sources = {
      {
        name = "nvim_lsp",
        priority = 1000,
        entry_filter = function(entry)
          -- sources to filter out
          local filtered_sources = {
            ["nvim_lsp:emmet_ls"] = true,
            ["nvim_lsp:vtsls"] = true,
          }

          local source_name = entry.source:get_debug_name()

          -- Return false if the source is in our filtered table
          return not filtered_sources[source_name]
        end,
      },
      { name = "path", priority = 250 },
    }
  end,
}

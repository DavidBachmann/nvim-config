return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode(),
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.mode { surround = { separator = "right" } },
    }

    opts.winbar = { -- winbar
      init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      fallthrough = false,
      { -- inactive winbar
        condition = function() return not status.condition.is_active() end,
        status.component.file_info {
          file_icon = {
            hl = status.hl.file_icon "winbar",
            padding = { left = 0 },
          },
          filename = {},
          filetype = false,
          file_read_only = false,
          hl = status.hl.get_attributes("winbarnc", true),
          surround = false,
          update = "BufEnter",
        },
      },
      { -- active winbar
        {
          provider = function(self)
            local icon = require("nvim-web-devicons").get_icon_color_by_filetype(vim.bo.filetype, { default = true })
            local path = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
            if path == "" then return icon .. " [No Name]" end
            return icon .. " " .. path
          end,
          hl = status.hl.get_attributes("winbarnc", true),
        },
        status.component.breadcrumbs {
          hl = status.hl.get_attributes("winbar", true),
        },
      },
    }

    opts.tabline = {}

    opts.statuscolumn = { -- statuscolumn
      init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      status.component.foldcolumn(),
      status.component.numbercolumn(),
      status.component.signcolumn(),
    }
  end,
}

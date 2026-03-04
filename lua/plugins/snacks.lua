return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = false,
    },
    picker = {
      actions = {
        open_with_system = function(picker)
          local item = picker:current()
          if not item then return end
          local path = item.file or item.path
          if not path then return end
          picker:close()
          vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
      },
      win = {
        input = {
          keys = {
            ["<C-b>"] = { "open_with_system", mode = { "n", "i" } },
          },
        },
      },
    },
  },
}

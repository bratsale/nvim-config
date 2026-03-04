return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<C-b>",
      function()
        local action_state = require("telescope.actions.state")
        local actions = require("telescope.actions")
        -- ovo se ne može ovako bindati globalno, vidi korak 4
      end,
    },
  },
  opts = function(_, opts)
    vim.notify("TELESCOPE OPTS LOADED", vim.log.levels.WARN)     -- ← ovdje
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local open_with_system = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      if not selection then return end
      local file_path = selection.path or selection.filename
      if not file_path then return end
      actions.close(prompt_bufnr)
      vim.fn.jobstart({ "xdg-open", file_path }, { detach = true })
    end

    opts.defaults = opts.defaults or {}
    opts.defaults.mappings = opts.defaults.mappings or {}
    opts.defaults.mappings.i = opts.defaults.mappings.i or {}
    opts.defaults.mappings.n = opts.defaults.mappings.n or {}

    opts.defaults.mappings.i["<C-b>"] = open_with_system
    opts.defaults.mappings.n["<C-b>"] = open_with_system
  end,
}

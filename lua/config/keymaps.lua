-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>jd", function()
  require("journal").otvori_dnevnik()
end, { desc = "Journal: Otvori dnevnik" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function(ev)
    vim.notify("TelescopePrompt ucitan, buf=" .. ev.buf, vim.log.levels.WARN)
    vim.keymap.set("i", "<C-b>", function()
      vim.notify("CTRL+B PRITISNUT!", vim.log.levels.WARN)
    end, { buffer = ev.buf })
  end,
})

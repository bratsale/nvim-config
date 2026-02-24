local M = {}

M.otvori_dnevnik = function()
  local path = vim.fn.getcwd() .. "/.dev_journal.md"

  vim.api.nvim_command("split " .. path)

  local trenutni_buf = vim.api.nvim_get_current_buf()

  print("Dnevnik otvoren za: " .. vim.fn.getcwd())

  vim.api.nvim_create_autocmd("BufWritePost", {
    buffer = trenutni_buf, -- Više nije "buf", nego smo mu dali ime iznad
    callback = function()
      vim.fn.jobstart("git add .dev_journal.md && git commit -m 'Update dnevnika' && git push &", { detach = true })
      print("Dnevnik sinkronizovan sa GitHubom!")
    end,
  })
end

return M

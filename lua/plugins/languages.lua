return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        jdtls = {},
        vtsls = {},
        html = {},
        emmet_ls = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "go" },
        },
        lua_ls = {
          settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
          },
        },
        gopls = {},
        sqls = {},
        pyright = {},
      },
    },
  },
}

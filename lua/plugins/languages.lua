return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        jdtls = {},
        vtsls = {},
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

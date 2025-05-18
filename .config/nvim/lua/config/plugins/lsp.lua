local configure_servers = {
  "lua_ls",
  "pyright",
  "clangd"
}

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      }
    },
    config = function()
      for _, server in pairs(configure_servers) do
        require('lspconfig')[server].setup {}
      end
    end
  }
}

-- ~/.config/nvim/lsp/lua_ls.lua
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}


return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "black",
      "debugpy",
      "mypy",
      "clangd",
      "pyright",
    },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "cpp",
      "c",
      "python",
      "glsl",
      "cmake",
      "make",
      "bash",
      "html",
      "json",
      "java",
      "c_sharp",
      "lua",
      "markdown",
      "regex",
      "vim",
      "yaml",
      "kotlin",
    },
  },
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 10000 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        vim.notify("Tree sitter disabled")
        return true
      end
    end,
  },
}
